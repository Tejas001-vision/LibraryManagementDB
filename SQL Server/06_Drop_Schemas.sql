-- ===========================================
-- 06_Drop_Schemas.sql
-- Purpose: Drop all schemas created for the Library Management System to allow re-creation or clean up.
-- ===========================================

/* Drop Transactions schema */
IF EXISTS (SELECT * FROM sys.schemas WHERE name = 'Transactions')
BEGIN
    DROP SCHEMA Transactions;
END

/* Drop Catalog schema */
IF EXISTS (SELECT * FROM sys.schemas WHERE name = 'Catalog')
BEGIN
    DROP SCHEMA Catalog;
END

/* Drop Members schema */
IF EXISTS (SELECT * FROM sys.schemas WHERE name = 'Members')
BEGIN
    DROP SCHEMA Members;
END

/* Drop Admin schema */
IF EXISTS (SELECT * FROM sys.schemas WHERE name = 'Admin')
BEGIN
    DROP SCHEMA Admin;
END
GO
