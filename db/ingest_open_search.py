from opensearchpy import OpenSearch, helpers
import hashlib

INDEX_NAME = "comments_demo"

print("Connecting to OpenSearch...")

client = OpenSearch(
    hosts=[{"host": "localhost", "port": 9200}],
    timeout=10
)

if not client.ping():
    raise Exception("❌ Cannot connect to OpenSearch")

print("✅ Connected")

# -------------------------------------------------
# 1️⃣ Create Index If Missing
# -------------------------------------------------
mapping = {
    "mappings": {
        "properties": {
            "docketId": {
                "type": "text",
                "fields": {
                    "keyword": {"type": "keyword"}
                }
            },
            "commentText": {
                "type": "text"
            }
        }
    }
}

if not client.indices.exists(index=INDEX_NAME):
    client.indices.create(index=INDEX_NAME, body=mapping)
    print("✅ Created index")
else:
    print("Index already exists")

# -------------------------------------------------
# 2️⃣ Sample Documents
# -------------------------------------------------
documents = [
    {"docketId": "FDA-2023-001", "commentText": "This drug is effective."},
    {"docketId": "FDA-2023-001", "commentText": "I oppose this proposal."},
    {"docketId": "FDA-2023-002", "commentText": "Drug pricing is too high."},
    {"docketId": "FDA-2023-002", "commentText": "This rule affects healthcare."},
    {"docketId": "FDA-2023-003", "commentText": "No mention here."},
]

# -------------------------------------------------
# 3️⃣ Use Stable Document IDs
# -------------------------------------------------
def generate_id(doc):
    """
    Create a deterministic ID based on document content.
    This prevents duplicates across runs.
    """
    raw = f"{doc['docketId']}|{doc['commentText']}"
    return hashlib.sha256(raw.encode()).hexdigest()

actions = [
    {
        "_index": INDEX_NAME,
        "_id": generate_id(doc),  # Stable ID
        "_source": doc
    }
    for doc in documents
]

helpers.bulk(client, actions)
client.indices.refresh(index=INDEX_NAME)

print(f"✅ Upserted {len(documents)} documents")

# -------------------------------------------------
# 4️⃣ Run Aggregation Query
# -------------------------------------------------
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
                            "commentText": "drug"
                        }
                    }
                }
            }
        }
    }
}

response = client.search(index=INDEX_NAME, body=query)

print("\n=== AGGREGATION RESULTS ===\n")

for bucket in response["aggregations"]["docketId_stats"]["buckets"]:
    print(f"Docket ID: {bucket['key']}")
    print(f"  Total Docs: {bucket['doc_count']}")
    print(f"  Docs mentioning 'drug': {bucket['matching_comments']['doc_count']}")