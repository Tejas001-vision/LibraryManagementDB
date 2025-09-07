-- ===========================================
-- 06_Drop_Schemas.sql
-- Purpose: Drop all "schemas" (databases or prefixed tables) created for the Library Management System to allow re-creation or clean up.
-- ===========================================

-- If using separate databases for schemas
DROP DATABASE IF EXISTS Transactions;
DROP DATABASE IF EXISTS Catalog;
DROP DATABASE IF EXISTS Members;
DROP DATABASE IF EXISTS Admin;

-- If using table name prefixes instead of databases, you must drop tables individually:
-- DROP TABLE IF EXISTS Transactions_bookShelves, Transactions_FinePayments, ... ;
