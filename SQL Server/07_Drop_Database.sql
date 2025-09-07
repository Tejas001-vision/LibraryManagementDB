-- ===========================================
-- 07_Drop_Database.sql
-- Purpose: Drop the "LibraryManagementSystem" database if it exists, ensuring a clean environment.
-- ===========================================

IF EXISTS (SELECT name FROM sys.databases WHERE name = N'LibraryManagementSystem')
BEGIN
    -- Set database to single user mode to avoid connections
    ALTER DATABASE LibraryManagementSystem SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    
    -- Drop the database
    DROP DATABASE LibraryManagementSystem;
END
GO
