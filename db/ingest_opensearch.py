"""
Ingest dummy data into local OpenSearch matching the real production structure.
Uses separate indices for documents and comments.
"""

from opensearchpy import OpenSearch


def ingest_opensearch():
    """Insert dummy documents and comments into local OpenSearch"""
    try:
        client = OpenSearch(
            hosts=[{"host": "localhost", "port": 9200}],
            use_ssl=False,
            verify_certs=False,
        )
        # Force a request early so we can exit gracefully if OpenSearch is down.
        client.info()
    except Exception as e:  # pylint: disable=broad-exception-caught
        print(f"OpenSearch is not running (skipping ingest): {e}")
        return

    # Delete indexes
    for index in ["documents", "comments"]:
        if client.indices.exists(index=index):
            client.indices.delete(index=index)
    
    # Create documents index
    client.indices.create(
        index="documents",
        body={
            "mappings": {
                "properties": {
                    "agencyId": {
                        "type": "text",
                        "fields": {"keyword": {"type": "keyword", "ignore_above": 256}}
                    },
                    "comment": {
                        "type": "text",
                        "fields": {"keyword": {"type": "keyword", "ignore_above": 256}}
                    },
                    "docketId": {
                        "type": "text",
                        "fields": {"keyword": {"type": "keyword", "ignore_above": 256}}
                    },
                    "documentId": {
                        "type": "text",
                        "fields": {"keyword": {"type": "keyword", "ignore_above": 256}}
                    },
                    "documentType": {
                        "type": "text",
                        "fields": {"keyword": {"type": "keyword", "ignore_above": 256}}
                    },
                    "modifyDate": {
                        "type": "text",
                        "fields": {"keyword": {"type": "keyword", "ignore_above": 256}}
                    },
                    "postedDate": {
                        "type": "text",
                        "fields": {"keyword": {"type": "keyword", "ignore_above": 256}}
                    },
                    "title": {
                        "type": "text",
                        "fields": {"keyword": {"type": "keyword", "ignore_above": 256}}
                    }
                }
            }
        }
    )
    
    # Create comments index
    client.indices.create(
        index="comments",
        body={
            "mappings": {
                "properties": {
                    "commentId": {
                        "type": "text",
                        "fields": {"keyword": {"type": "keyword", "ignore_above": 256}}
                    },
                    "commentText": {
                        "type": "text",
                        "fields": {"keyword": {"type": "keyword", "ignore_above": 256}}
                    },
                    "docketId": {
                        "type": "text",
                        "fields": {"keyword": {"type": "keyword", "ignore_above": 256}}
                    }
                }
            }
        }
    )
    
    # Insert documents
    documents = [
        {
            "agencyId": "DEA",
            "comment": "",
            "docketId": "DEA-2024-0059",
            "documentId": "DEA-2024-0059-0001",
            "documentType": "Proposed Rule",
            "modifyDate": "2024-01-15",
            "postedDate": "2024-01-10",
            "title": "This document discusses meaningful use criteria for healthcare"
        },
        {
            "agencyId": "DEA",
            "comment": "",
            "docketId": "DEA-2024-0059",
            "documentId": "DEA-2024-0059-0002",
            "documentType": "Rule",
            "modifyDate": "2024-02-20",
            "postedDate": "2024-02-15",
            "title": "Additional meaningful use requirements and standards"
        },
        {
            "agencyId": "DEA",
            "comment": "Meaningful use standards are important for improving healthcare",
            "docketId": "DEA-2024-0059",
            "documentId": "DEA-2024-0059-0003",
            "documentType": "Rule",
            "modifyDate": "2024-03-10",
            "postedDate": "2024-03-05",
            "title": "Final meaningful use reporting guidelines"
        },
        {
            "agencyId": "CMS",
            "comment": "Medicare updates will help seniors",
            "docketId": "CMS-2025-0240",
            "documentId": "CMS-2025-0240-0001",
            "documentType": "Proposed Rule",
            "modifyDate": "2025-01-20",
            "postedDate": "2025-01-15",
            "title": "Medicare program updates for 2025 including payment changes"
        },
        {
            "agencyId": "CMS",
            "comment": "",
            "docketId": "CMS-2025-0240",
            "documentId": "CMS-2025-0240-0002",
            "documentType": "Rule",
            "modifyDate": "2025-02-10",
            "postedDate": "2025-02-05",
            "title": "Medicare Advantage plan modifications and updates"
        },
        {
            "agencyId": "CMS",
            "comment": "",
            "docketId": "CMS-2025-0304",
            "documentId": "CMS-2025-0304-0001",
            "documentType": "Proposed Rule",
            "modifyDate": "2025-03-20",
            "postedDate": "2025-03-15",
            "title": "Medicare Part B payment policies and coverage changes for calendar year 2026"
        },
        {
            "agencyId": "CMS",
            "comment": "Medicare shared savings program requirements and Medicare Prescription Drug Inflation Rebate Program updates",
            "docketId": "CMS-2025-0304",
            "documentId": "CMS-2025-0304-0002",
            "documentType": "Rule",
            "modifyDate": "2025-04-10",
            "postedDate": "2025-04-05",
            "title": "Updates to Medicare Promoting Interoperability Program requirements"
        },
        {
            "agencyId": "CMS",
            "comment": "",
            "docketId": "CMS-2025-0304",
            "documentId": "CMS-2025-0304-0003",
            "documentType": "Rule",
            "modifyDate": "2025-05-10",
            "postedDate": "2025-05-05",
            "title": "Updates to ESRD Treatment Choices Model for calendar year 2026"
        },
        {
            "agencyId": "CMS",
            "comment": "Medicare rural payment support for underserved communities",
            "docketId": "CMS-2026-0001",
            "documentId": "CMS-2026-0001-0001",
            "documentType": "Rule",
            "modifyDate": "2025-12-01",
            "postedDate": "2025-12-01",
            "title": "Rural dialysis access and payment operations update"
        },
    ]
    
    # Insert comments
    comments = [
        {
            "commentId": "DEA-2024-0059-0001",
            "commentText": "I support the meaningful use standards proposed",
            "docketId": "DEA-2024-0059"
        },
        {
            "commentId": "DEA-2024-0059-0002",
            "commentText": "The meaningful use criteria seem reasonable",
            "docketId": "DEA-2024-0059"
        },
        {
            "commentId": "CMS-2025-0240-0001",
            "commentText": "These medicare changes will help seniors",
            "docketId": "CMS-2025-0240"
        },
        {
            "commentId": "CMS-2025-0240-0002",
            "commentText": "I have concerns about medicare funding",
            "docketId": "CMS-2025-0240"
        },
        {
            "commentId": "CMS-2025-0240-0003",
            "commentText": "Medicare should cover more services",
            "docketId": "CMS-2025-0240"
        },
        {
            "commentId": "CMS-2025-0240-0004",
            "commentText": "Support the medicare updates proposed here",
            "docketId": "CMS-2025-0240"
        },
        {
            "commentId": "CMS-2025-0304-0001",
            "commentText": "Medicare Shared Savings Program requirements for calendar year 2026",
            "docketId": "CMS-2025-0304"
        },
        {
            "commentId": "CMS-2025-0304-0002",
            "commentText": "Medicare Prescription Drug Inflation Rebate Program updates and Part B coverage policy changes",
            "docketId": "CMS-2025-0304"
        },
        {
            "commentId": "CMS-2026-0001-0001",
            "commentText": "Medicare coverage changes should improve rural access",
            "docketId": "CMS-2026-0001"
        },
    ]
    
    # Insert documents and comments into OpenSearch
    for doc in documents:
        client.index(
            index="documents",
            id=doc["documentId"],
            body=doc
        )
    
    for comment in comments:
        client.index(
            index="comments",
            id=comment["commentId"],
            body=comment
        )

    client.indices.refresh(index="documents")
    client.indices.refresh(index="comments")

    print(f"✓ Ingested {len(documents)} documents and {len(comments)} comments")
    print("  DEA-2024-0059: 3 docs, 2 comments (term: 'meaningful use')")
    print("  CMS-2025-0240: 2 docs, 4 comments (terms: 'medicare', 'updates')")
    print("  CMS-2025-0304: 3 docs, 2 comments (term: 'medicare')")
    print("  CMS-2026-0001: 1 doc, 1 comment (term: 'medicare')")


if __name__ == "__main__":
    ingest_opensearch()