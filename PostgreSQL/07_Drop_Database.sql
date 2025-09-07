-- ===========================================
-- 07_Drop_Database.sql
-- Purpose: Drop the "LibraryManagementSystem" database if it exists, ensuring a clean environment.
-- ===========================================

-- Terminate all connections to the database
DO
$$
BEGIN
   IF EXISTS (SELECT 1 FROM pg_database WHERE datname = 'LibraryManagementSystem') THEN
       PERFORM pg_terminate_backend(pid)
       FROM pg_stat_activity
       WHERE datname = 'LibraryManagementSystem';
   END IF;
END
$$;

-- Drop the database
DROP DATABASE IF EXISTS "LibraryManagementSystem";
