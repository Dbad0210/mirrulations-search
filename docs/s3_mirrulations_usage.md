# S3 bucket usage (`mirrulations`)

This project downloads docket data from the **public AWS Open Data S3 bucket** named `mirrulations` (see the AWS Open Data registry page linked from `README.md`).

## Key points

- **Bucket**: `mirrulations` (hardcoded in `mirrulations_fetch/download_docket.py`)
- **Auth**: **unsigned / public access** (no AWS credentials required)
- **API**: `boto3` S3 client (`list_objects_v2`, paginated listing, and `download_file`)
- **How data is organized**: keys are grouped by **agency** and **docket id**

## How the CLI maps a docket id to S3 prefixes

Given a `docket_id` like `DEA-2024-0059`, the CLI derives:

- **Agency**: everything before the first `-` (with a small extra split on `_`), e.g. `DEA`
- **Base prefixes**:
  - `raw-data/<agency>/<docket_id>/...`
  - `derived-data/<agency>/<docket_id>/...`

## Bucket data structure (key layout)

At a high level, the bucket is organized like this:

```
s3://mirrulations/
  raw-data/
    <agency>/
      <docket_id>/
        text-<docket_id>/
          docket/
            ...
          documents/
            ...
          comments/
            ...
        binary-<docket_id>/
          ...
  derived-data/
    <agency>/
      <docket_id>/
        ...
```

Where:

- **`<agency>`**: derived from the docket id (e.g. `DEA` from `DEA-2024-0059`)
- **`text-<docket_id>/...`**: text/metadata organized into `docket/`, `documents/`, `comments/`
- **`binary-<docket_id>/...`**: original binary assets (only downloaded when `--include-binary`)
- **`derived-data/<agency>/<docket_id>/...`**: derived outputs (downloaded unless `--no-comments`)

The tool expects the following (text) layout for a docket:

- **Docket text**: `raw-data/<agency>/<docket_id>/text-<docket_id>/docket/`
- **Document text**: `raw-data/<agency>/<docket_id>/text-<docket_id>/documents/`
- **Comment text**: `raw-data/<agency>/<docket_id>/text-<docket_id>/comments/`
- **Derived data (optional)**: `derived-data/<agency>/<docket_id>/`
- **Binary (optional; when `--include-binary`)**: `raw-data/<agency>/<docket_id>/binary-<docket_id>/`

Before downloading, the CLI checks that:

- `raw-data/<agency>/<docket_id>/` exists (at least one object with that prefix), and
- `raw-data/<agency>/<docket_id>/text-<docket_id>/` exists

If either check fails, it exits with a “not found in S3 bucket” style error.

## What gets downloaded (and where it lands locally)

The CLI lists all objects under the relevant prefixes, then downloads each object to disk preserving its *relative path* under the logical root.

For an output folder `<output-folder>` and docket `<docket_id>`, the local structure is:

```
<output-folder>/
  <docket_id>/
    raw-data/
      <agency>/<docket_id>/text-<docket_id>/{docket,documents,comments}/...
      <agency>/<docket_id>/binary-<docket_id>/...          # (if --include-binary)
    derived-data/
      <agency>/<docket_id>/...                             # (if present and not --no-comments)
```

Notes:

- **`--no-comments`** skips both:
  - comment text (`.../comments/`), and
  - derived data (`derived-data/...`) (because it is comment-related in this project’s workflow)
- **`--include-binary`** adds `binary-<docket_id>/` if it exists

## How downloads work (implementation details)

In `mirrulations_fetch/download_docket.py`:

- **Listing**: uses `list_objects_v2` with a paginator to gather object keys and sizes.
- **Downloading**: uses `s3_client.download_file(bucket, key, local_path)`.
- **Concurrency**: downloads are executed across up to 8 worker threads.
- **Progress**: prints counts and an ETA based on objects completed, separately tracking “Text” and “Bin” when binary download is enabled.

## Operational notes

- Because the bucket is public, **you should not add credentials** for normal use.
- If you see `AccessDenied`, it usually indicates one of:
  - the key/prefix doesn’t exist,
  - the bucket policy changed, or
  - you’re on a network that blocks S3 endpoints.

