from mirrsearch.db import get_db


class InternalLogic:  # pylint: disable=too-few-public-methods
    def __init__(self, database, db_layer=None):
        self.database = database
        self.db_layer = db_layer

    def search(self, query, document_type_param=None, agency=None, cfr_part_param=None):
        db_layer = self.db_layer if self.db_layer is not None else get_db()
        search_results = db_layer.search(query, document_type_param, agency, cfr_part_param)

        search_results = [
            {
                "docket_id": "Test_Id",
                "title": "Test Title",
                "cfrPart": "Test CFR Part",
                "agency_id": "Test Agency ID",
                "docket_type": "Test Docket Type",
                "modify_date": "2026-03-01"

<<<<<<< Updated upstream
=======
        Returns:
            dict: Paginated response with metadata
        """
        all_results = self.db_layer.search(
            query,
            document_type_param,
            agency,
            cfr_part_param
        )

        total_results = len(all_results)
        total_pages = (total_results + page_size - 1) // page_size

        start_idx = (page - 1) * page_size
        end_idx = start_idx + page_size

        page_results = all_results[start_idx:end_idx]
        for result in page_results:
            cfr_refs = result.pop("cfr_refs", None)
            if cfr_refs is not None:
                result["cfrPart"] = [
                    part
                    for ref in cfr_refs
                    for part in ref.get("cfrParts", [])
                ]

        return {
            "results": page_results,
            "pagination": {
                "page": page,
                "page_size": page_size,
                "total_results": total_results,
                "total_pages": total_pages,
                "has_next": page < total_pages,
                "has_prev": page > 1
>>>>>>> Stashed changes
            }
        ]
        return search_results
