# Plan: Empty DB and Sample Data Scripts (cost_sharing-style)

## How cost_sharing does it

**Location:** `cost_sharing/scripts/` and `src/cost_sharing/sql/`

| Piece | Purpose |
|-------|--------|
| `sql/schema-sqlite.sql` | Schema only (CREATE TABLEs). No data. |
| `sql/sample-data.sql` | INSERTs only. Assumes schema already exists. |
| `scripts/create_empty_db.sh` | Creates DB file → runs **schema only**. Optional prompt before overwriting. |
| `scripts/create_sample_db.sh` | Creates DB file → runs **schema** → runs **sample-data** → optional verify (e.g. “Alice exists”) → optional interactive step (e.g. update Alice for dev). |

**Pattern:**
1. Two SQL files: schema vs data.
2. Two scripts: “empty” (schema only) and “with sample” (schema + data + optional verification).
3. Scripts check for existing DB and can prompt before overwriting.
4. Scripts validate inputs (schema file exists, sample file exists) and exit with clear errors.
5. Dev docs (e.g. `docs/dev.md`) describe both options: “Option 1: empty DB” and “Option 2: sample DB”.

**DB engine:** cost_sharing uses SQLite (`sqlite3`, file-based). mirrulations-search uses **PostgreSQL** (server, `psql`).

---

## Current state in mirrulations-search

- **Schema:** `db/schema-postgres.sql` (dockets, documents, links, cfrparts).
- **Sample data:** `db/sample-data.sql` (INSERTs for dockets, documents, links, cfrparts).
- **Single script:** `db/setup_postgres.sh` — starts Postgres, dropdb, createdb, runs schema, runs sample-data. No “empty only” option; no overwrite prompt; always does both.

So we already have the same **split** (schema vs sample SQL). We only need to add **two scripts** that mirror cost_sharing’s behavior for Postgres and a **testing** path.

---

## What to add in mirrulations-search

### 1. `db/create_empty_db.sh`

- **Goal:** Create a **Postgres** database with **schema only** (no sample data).
- **Steps:**
  - Resolve script dir and paths to `db/schema-postgres.sql` (same as current setup).
  - Ensure Postgres is running (reuse logic from `setup_postgres.sh`: `pg_isready` / `brew services start` if needed).
  - Optional: if DB already exists, **prompt** “Overwrite? (y/n)” (like cost_sharing). If no, exit without changing anything.
  - `dropdb --if-exists $DB_NAME` then `createdb $DB_NAME`.
  - Run only: `psql -d $DB_NAME -f "$SCRIPT_DIR/schema-postgres.sql"`.
  - Optional: **verify** (e.g. `psql -d $DB_NAME -tAc "SELECT count(*) FROM information_schema.tables WHERE table_schema='public' AND table_name IN ('dockets','documents','links','cfrparts');"` and expect 4).
  - Exit 0 on success; exit 1 on failure with clear messages.

**DB name:** Use a variable (e.g. `DB_NAME=mirrulations` default). For **testing** (see below), call with `DB_NAME=mirrulations_test` so we don’t overwrite dev. **Non-interactive:** Support `OVERWRITE_YES=1` to skip the overwrite prompt (used by verify script and CI).

### 2. `db/create_sample_db.sh`

- **Goal:** Create a Postgres database with **schema + sample data** (equivalent to current “full” setup).
- **Steps:**
  - Same Postgres-up and DB-name handling as above.
  - Optional overwrite prompt if DB exists.
  - Drop/create DB, then:
    - `psql -d $DB_NAME -f "$SCRIPT_DIR/schema-postgres.sql"`.
    - `psql -d $DB_NAME -f "$SCRIPT_DIR/sample-data.sql"`.
  - **Verify:** e.g. check that key tables have rows (`SELECT count(*) FROM dockets` / `documents` and expect > 0), or that a known sample row exists.
  - Exit 0 on success; exit 1 on failure.

**Relationship to existing script:** Keep `db/setup_postgres.sh` as the “one-shot full setup” (current behavior). `create_sample_db.sh` can either:
- **Option A:** Be the same behavior as `setup_postgres.sh` but with overwrite prompt and verification, or  
- **Option B:** Call into shared logic (e.g. “ensure Postgres, drop/create DB, run schema”) and then run sample-data + verify.

Recommendation: implement **Option A** for clarity (two standalone scripts, easy to run by hand and from CI).

### 3. Testing environment: “accurately completes the task before committing”

- **Use a separate DB name for testing** so we never touch `mirrulations` (dev) when validating the scripts:
  - Example: `DB_NAME=mirrulations_test ./db/create_empty_db.sh` and `DB_NAME=mirrulations_test ./db/create_sample_db.sh`.
- **Verification:**
  - **Empty DB:** After `create_empty_db.sh`, assert: tables exist, and `dockets` / `documents` (etc.) have **0** rows.
  - **Sample DB:** After `create_sample_db.sh`, assert: tables exist, and `dockets` and `documents` have **expected row counts** (or at least ≥ 1) and optionally a known docket_id or document_id exists.
- **Ways to run this “testing”:**
  1. **Manual (before commit):** From repo root, run:
     - `./db/create_empty_db.sh` with `DB_NAME=mirrulations_test`, then run a small verification script or one-off `psql` commands.
     - Then run `./db/create_sample_db.sh` with `DB_NAME=mirrulations_test`, then verify row counts / known rows.
  2. **Scripted (recommended):** Add a small script, e.g. `db/verify_empty_and_sample.sh`, that:
     - Creates `mirrulations_test` with `create_empty_db.sh`, runs empty-DB checks, then drops `mirrulations_test`.
     - Creates `mirrulations_test` with `create_sample_db.sh`, runs sample-DB checks, then drops `mirrulations_test`.
     - Exits 0 only if all checks pass. You run this before committing to ensure the scripts “accurately complete the task.”
  3. **CI (optional):** In GitHub Actions, run the same verification script (or the two scripts + inline checks) in a job that has Postgres (e.g. a service container). Mark as non-required at first if Postgres in CI is not yet standard.

### 4. Docs

- **docs/PostgresDB.md (or README):** Add a short section:
  - “Create empty database (schema only): `./db/create_empty_db.sh`” (and mention optional `DB_NAME=mirrulations_test` for testing).
  - “Create database with sample data: `./db/create_sample_db.sh`.”
  - “Full setup (current behavior): `./db/setup_postgres.sh`.”
- Optionally add `docs/sample-dataset.md` (or a short note in PostgresDB.md) describing what’s in `sample-data.sql` (e.g. dockets CMS-2025-0240, CMS-2025-0304 and their documents/links/cfrparts), so devs know what to expect.

---

## Summary: apply cost_sharing pattern here

| cost_sharing | mirrulations-search |
|--------------|---------------------|
| `sql/schema-sqlite.sql` | Already have `db/schema-postgres.sql` |
| `sql/sample-data.sql` | Already have `db/sample-data.sql` |
| `scripts/create_empty_db.sh` | Add **`db/create_empty_db.sh`** (schema only, optional overwrite prompt, verify tables) |
| `scripts/create_sample_db.sh` | Add **`db/create_sample_db.sh`** (schema + sample, optional overwrite prompt, verify data) |
| SQLite file path | Postgres: `DB_NAME` (default `mirrulations`; use `mirrulations_test` for testing) |
| Dev docs “Option 1 / 2” | Update **docs/PostgresDB.md** (and/or README) with both options |
| Testing before commit | Use **`DB_NAME=mirrulations_test`** and a small **verification script** that runs both scripts and checks empty vs sample state |

No change to the existing SQL files or to `setup_postgres.sh` is strictly required; the new scripts are additive. You can later refactor `setup_postgres.sh` to call the new scripts if you want a single implementation.

---

## Implementation order

1. **Branch:** `feature/empty-and-sample-db-scripts` (done).
2. **Implement** `db/create_empty_db.sh` (schema only, overwrite prompt, basic verify).
3. **Implement** `db/create_sample_db.sh` (schema + sample, overwrite prompt, basic verify).
4. **Add** `db/verify_empty_and_sample.sh` (or equivalent) that runs both with `DB_NAME=mirrulations_test` and checks results.
5. **Run** the verification script locally; fix until it passes.
6. **Update** docs (PostgresDB.md / README).
7. **Commit** and open PR; optionally add CI job for the verification script later.
