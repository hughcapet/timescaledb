-- This file and its contents are licensed under the Apache License 2.0.
-- Please see the included NOTICE for copyright information and
-- LICENSE-APACHE for a copy of the license.

-- Test that timescale catalog structure is properly invalidated

\c :TEST_DBNAME :ROLE_SUPERUSER

CREATE TABLE catalog_invalidation (
  time        TIMESTAMPTZ       NOT NULL
);
SELECT create_hypertable('catalog_invalidation', 'time');

SELECT 1 AS test FROM catalog_invalidation;

REINDEX SCHEMA CONCURRENTLY _timescaledb_catalog;

SELECT 1 AS test FROM catalog_invalidation;
