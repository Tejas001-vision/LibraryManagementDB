-- ===========================================
-- 06_Drop_Schemas.sql
-- Purpose: Drop all schemas created for the Library Management System to allow re-creation or clean up.
-- ===========================================

-- Drop Transactions schema
DROP SCHEMA IF EXISTS Transactions CASCADE;

-- Drop Catalog schema
DROP SCHEMA IF EXISTS Catalog CASCADE;

-- Drop Members schema
DROP SCHEMA IF EXISTS Members CASCADE;

-- Drop Admin schema
DROP SCHEMA IF EXISTS Admin CASCADE;
