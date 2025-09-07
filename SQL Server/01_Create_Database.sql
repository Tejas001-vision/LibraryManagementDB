-- ===========================================
-- 01_Create_Database.sql
-- Purpose: Create the Library Management System database
-- ===========================================

-- Check if database exists, if not, create it
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'LibraryManagementSystem')
BEGIN
    CREATE DATABASE LibraryManagementSystem;
    PRINT 'Database LibraryManagementSystem created successfully.';
END
ELSE
BEGIN
    PRINT 'Database LibraryManagementSystem already exists.';
END
GO

-- Use the database
USE LibraryManagementSystem;
GO
