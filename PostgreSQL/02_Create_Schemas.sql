-- ===========================================
-- 02_Create_Schemas.sql
-- Purpose: Create schemas for Library Management System
-- ===========================================

-- Connect to the database
\c LibraryManagementSystem;

-- Create schemas if they do not exist
DO
$$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_namespace WHERE nspname = 'Admin') THEN
        EXECUTE 'CREATE SCHEMA "Admin";';
    END IF;

    IF NOT EXISTS (SELECT 1 FROM pg_namespace WHERE nspname = 'Catalog') THEN
        EXECUTE 'CREATE SCHEMA "Catalog";';
    END IF;

    IF NOT EXISTS (SELECT 1 FROM pg_namespace WHERE nspname = 'Members') THEN
        EXECUTE 'CREATE SCHEMA "Members";';
    END IF;

    IF NOT EXISTS (SELECT 1 FROM pg_namespace WHERE nspname = 'Transactions') THEN
        EXECUTE 'CREATE SCHEMA "Transactions";';
    END IF;
END
$$;

RAISE NOTICE 'Schemas Admin, Catalog, Members, and Transactions created successfully.';
