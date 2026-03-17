"""
OpenSearch layer for querying comments by search term.
"""
from typing import List, Dict, Any
from mirrsearch.db import get_opensearch_connection

INDEX_NAME = "comments_demo"


class OpenSearchLayer:  # pylint: disable=too-few-public-methods
    """
    Layer for querying comments from OpenSearch.
    Returns per-docket comment match counts for a given search term.
    """

    def __init__(self, client=None):
        self.client = client

    def search(self, term: str) -> List[Dict[str, Any]]:
        """
        Search comments for a term. Returns a list of dockets with
        matching and total comment counts.

        Returns [] if no client is connected or term is empty.
        """
        if self.client is None:
            return []
        if not term or not term.strip():
            return []

        query = {
            "size": 0,
            "aggs": {
                "docketId_stats": {
                    "terms": {
                        "field": "docketId.keyword",
                        "size": 1000
                    },
                    "aggs": {
                        "matching_comments": {
                            "filter": {
                                "match": {
                                    "commentText": term
                                }
                            }
                        }
                    }
                }
            }
        }

        response = self.client.search(index=INDEX_NAME, body=query)
        buckets = response["aggregations"]["docketId_stats"]["buckets"]

        return [
            {
                "docket_id": bucket["key"],
                "matching_comments": bucket["matching_comments"]["doc_count"],
                "total_comments": bucket["doc_count"],
            }
            for bucket in buckets
        ]


def get_opensearch_layer() -> OpenSearchLayer:
    """
    Return an OpenSearchLayer connected to OpenSearch.
    Falls back to an unconnected layer if OpenSearch is unavailable.
    """
    try:
        client = get_opensearch_connection()
        if client.ping():
            return OpenSearchLayer(client=client)
        return OpenSearchLayer()
    except Exception:  # pylint: disable=broad-except
        return OpenSearchLayer()
