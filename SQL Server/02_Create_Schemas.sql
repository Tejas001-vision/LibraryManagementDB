-- ===========================================
-- 02_Create_Schemas.sql
-- Purpose: Create schemas for Library Management System
-- ===========================================

USE LibraryManagementSystem;
GO

-- Create schemas if they do not exist
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'Admin')
    EXEC('CREATE SCHEMA Admin;');
    
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'Catalog')
    EXEC('CREATE SCHEMA Catalog;');

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'Members')
    EXEC('CREATE SCHEMA Members;');

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'Transactions')
    EXEC('CREATE SCHEMA Transactions;');

PRINT 'Schemas Admin, Catalog, Members, and Transactions created successfully.';
GO
