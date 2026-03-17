"""
Shared pytest fixtures for all tests.
"""
# pylint: disable=redefined-outer-name
import pytest
from mock_db import MockDBLayer
from mock_opensearch import MockOpenSearchLayer
from mirrsearch.app import create_app


@pytest.fixture
def mock_db():
    """Return a MockDBLayer instance with dummy data."""
    return MockDBLayer()


@pytest.fixture
def mock_opensearch():
    """Return a MockOpenSearchLayer instance with dummy data."""
    return MockOpenSearchLayer()


@pytest.fixture
def app(tmp_path, mock_db, mock_opensearch):
    """Create a test app that uses mock layers and a temporary dist dir."""
    dist = tmp_path / "frontend" / "dist"
    dist.mkdir(parents=True)
    (dist / "index.html").write_text("<html></html>")
    flask_app = create_app(
        dist_dir=str(dist),
        db_layer=mock_db,
        opensearch_layer=mock_opensearch
    )
    flask_app.config['TESTING'] = True
    return flask_app


@pytest.fixture
def client(app):
    """Test client for the app."""
    return app.test_client()
