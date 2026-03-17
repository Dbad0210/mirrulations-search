from typing import List, Dict, Any


class MockOpenSearchLayer:  # pylint: disable=too-few-public-methods
    """
    Mock OpenSearch layer with hardcoded dummy data (see "ingest_open_search.py")
    for testing. Mirrors the interface of OpenSearchLayer without a real connection.

    Dummy data matches the documents in ingest_open_search.py:
      FDA-2023-001: "This drug is effective." / "I oppose this proposal."
      FDA-2023-002: "Drug pricing is too high." / "This rule affects healthcare."
      FDA-2023-003: "No mention here."
    """

    def _items(self) -> List[Dict[str, Any]]:
        return [
            {
                "docket_id": "FDA-2023-001",
                "matching_comments": 1,
                "total_comments": 2,
            },
            {
                "docket_id": "FDA-2023-002",
                "matching_comments": 1,
                "total_comments": 2,
            },
            {
                "docket_id": "FDA-2023-003",
                "matching_comments": 0,
                "total_comments": 1,
            },
        ]

    def get_all(self) -> List[Dict[str, Any]]:
        """Return all dummy records without filtering."""
        return self._items()

    def search(self, term: str) -> List[Dict[str, Any]]:
        """
        Return dockets that have at least one matching comment.
        Empty term returns []. Any non-empty term returns matching dockets
        since the mock has no real index to filter against.
        """
        if not term or not term.strip():
            return []
        return [
            item for item in self._items()
            if item["matching_comments"] > 0
        ]
