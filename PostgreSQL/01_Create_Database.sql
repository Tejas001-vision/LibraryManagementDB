-- ===========================================
-- 01_Create_Database.sql
-- Purpose: Create the Library Management System database
-- ===========================================

-- Check if database exists, if not, create it
DO $$
BEGIN
   IF NOT EXISTS (
       SELECT FROM pg_database 
       WHERE datname = 'LibraryManagementSystem'
   ) THEN
       PERFORM dblink_exec('dbname=postgres', 'CREATE DATABASE "LibraryManagementSystem"');
       RAISE NOTICE 'Database LibraryManagementSystem created successfully.';
   ELSE
       RAISE NOTICE 'Database LibraryManagementSystem already exists.';
   END IF;
END
$$;

-- Connect to the database
\c LibraryManagementSystem
