"""Internal logic module for search operations with pagination"""
from mirrsearch.db import get_db
from mirrsearch.opensearch_layer import get_opensearch_layer


class InternalLogic:  # pylint: disable=too-few-public-methods
    """Internal logic for search operations with pagination"""

    def __init__(self, database, db_layer=None, opensearch_layer=None):
        self.database = database
        self.db_layer = db_layer if db_layer is not None else get_db()
        self.opensearch_layer = (
            opensearch_layer if opensearch_layer is not None
            else get_opensearch_layer()
        )

    def search(self, query, docket_type_param=None, agency=None,
               cfr_part_param=None, page=1, page_size=10):
        # pylint: disable=too-many-arguments,too-many-positional-arguments,too-many-locals
        """
        Search with pagination support. Merges Postgres docket metadata
        with OpenSearch comment counts per docket.

        Args:
            query: Search query string
            docket_type_param: Filter by docket type
            agency: Filter by agency
            cfr_part_param: Filter by CFR part
            page: Page number (1-indexed)
            page_size: Number of results per page

        Returns:
            dict: Paginated response with metadata
        """
        all_results = self.db_layer.search(
            query,
            docket_type_param,
            agency,
            cfr_part_param
        )

        # Build a lookup of comment counts keyed by docket_id
        comment_counts = {
            item["docket_id"]: item
            for item in self.opensearch_layer.search(query)
        }

        total_results = len(all_results)
        total_pages = (total_results + page_size - 1) // page_size

        start_idx = (page - 1) * page_size
        end_idx = start_idx + page_size

        page_results = all_results[start_idx:end_idx]
        for result in page_results:
            cfr_refs = result.pop("cfr_refs", None)
            if cfr_refs is not None:
                result["cfrPart"] = [
                    {"part": part, "link": link}
                    for ref in cfr_refs
                    for part, link in ref.get("cfrParts", {}).items()
                ]

            # Attach comment counts from OpenSearch, defaulting to 0
            docket_id = result.get("docket_id")
            counts = comment_counts.get(docket_id, {})
            result["matching_comments"] = counts.get("matching_comments", 0)
            result["total_comments"] = counts.get("total_comments", 0)

        return {
            "results": page_results,
            "pagination": {
                "page": page,
                "page_size": page_size,
                "total_results": total_results,
                "total_pages": total_pages,
                "has_next": page < total_pages,
                "has_prev": page > 1
            }
        }
