"""
Tests for OpenSearchLayer and MockOpenSearchLayer.
"""
# pylint: disable=redefined-outer-name
import pytest
from mock_opensearch import MockOpenSearchLayer
from mirrsearch.opensearch_layer import OpenSearchLayer, get_opensearch_layer


# --- Fake client helpers ---

class _FakeOpenSearchClient:
    """Fake OpenSearch client for testing without a real connection."""

    def __init__(self, buckets):
        self._buckets = buckets

    def ping(self):
        return True

    def search(self, index, body):  # pylint: disable=unused-argument
        return {"aggregations": {"docketId_stats": {"buckets": self._buckets}}}


# --- OpenSearchLayer (no client) ---

def test_opensearch_layer_no_client_returns_empty():
    """search() with no client returns empty list."""
    assert OpenSearchLayer().search("drug") == []


def test_opensearch_layer_empty_term_returns_empty():
    """search() returns empty for blank term."""
    layer = OpenSearchLayer()
    assert layer.search("") == []
    assert layer.search("   ") == []


# --- OpenSearchLayer (fake client) ---

def test_opensearch_layer_search_returns_results():
    """search() correctly parses aggregation buckets."""
    buckets = [
        {"key": "FDA-2023-001", "doc_count": 2,
         "matching_comments": {"doc_count": 1}},
        {"key": "FDA-2023-002", "doc_count": 2,
         "matching_comments": {"doc_count": 1}},
    ]
    layer = OpenSearchLayer(client=_FakeOpenSearchClient(buckets))
    results = layer.search("drug")
    assert len(results) == 2
    assert results[0]["docket_id"] == "FDA-2023-001"
    assert results[0]["matching_comments"] == 1
    assert results[0]["total_comments"] == 2


def test_opensearch_layer_search_empty_index_returns_empty():
    """search() returns [] when no buckets exist."""
    layer = OpenSearchLayer(client=_FakeOpenSearchClient([]))
    assert layer.search("drug") == []


def test_opensearch_layer_empty_term_with_client_returns_empty():
    """search() returns [] for empty term even when connected."""
    layer = OpenSearchLayer(client=_FakeOpenSearchClient([]))
    assert layer.search("") == []
    assert layer.search("   ") == []


# --- get_opensearch_layer ---

def test_get_opensearch_layer_falls_back_on_exception(monkeypatch):
    """Returns unconnected layer when connection raises."""
    def _raise(**kwargs):
        raise ConnectionError("unreachable")
    monkeypatch.setattr("mirrsearch.db.OpenSearch", _raise)
    layer = get_opensearch_layer()
    assert layer.client is None


# --- MockOpenSearchLayer ---

@pytest.fixture
def mock_os():
    return MockOpenSearchLayer()


def test_mock_get_all_returns_list(mock_os):
    assert isinstance(mock_os.get_all(), list)


def test_mock_get_all_returns_three_records(mock_os):
    assert len(mock_os.get_all()) == 3


def test_mock_get_all_have_required_fields(mock_os):
    required_fields = ["docket_id", "matching_comments", "total_comments"]
    for item in mock_os.get_all():
        for field in required_fields:
            assert field in item, f"Item missing required field: {field}"


def test_mock_get_all_field_types(mock_os):
    for item in mock_os.get_all():
        assert isinstance(item["docket_id"], str)
        assert isinstance(item["matching_comments"], int)
        assert isinstance(item["total_comments"], int)


def test_mock_get_all_content(mock_os):
    items = mock_os.get_all()
    assert items[0]["docket_id"] == "FDA-2023-001"
    assert items[0]["matching_comments"] == 1
    assert items[0]["total_comments"] == 2
    assert items[2]["matching_comments"] == 0


def test_mock_search_returns_list(mock_os):
    assert isinstance(mock_os.search("drug"), list)


def test_mock_search_excludes_zero_match_dockets(mock_os):
    """Dockets with 0 matching comments should not appear in results."""
    assert all(item["matching_comments"] > 0 for item in mock_os.search("drug"))


def test_mock_search_returns_correct_count(mock_os):
    """Only the two dockets with matches should be returned."""
    assert len(mock_os.search("drug")) == 2


def test_mock_search_empty_term_returns_empty(mock_os):
    assert mock_os.search("") == []
    assert mock_os.search("   ") == []


def test_mock_search_results_have_required_fields(mock_os):
    for item in mock_os.search("drug"):
        assert "docket_id" in item
        assert "matching_comments" in item
        assert "total_comments" in item


def test_mock_matching_never_exceeds_total(mock_os):
    """Matching comments should never exceed total comments."""
    for item in mock_os.get_all():
        assert item["matching_comments"] <= item["total_comments"]


def test_mock_search_does_not_modify_data(mock_os):
    """Repeated searches always return the same results."""
    first = mock_os.search("drug")
    mock_os.search("other_term")
    assert mock_os.search("drug") == first
