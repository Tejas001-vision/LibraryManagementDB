-- ===========================================
-- 02_Create_Schemas.sql
-- Purpose: Create schemas for Library Management System
-- ===========================================

-- MySQL uses DATABASE instead of schema; creating separate databases as logical schemas

CREATE DATABASE IF NOT EXISTS Admin;
CREATE DATABASE IF NOT EXISTS Catalog;
CREATE DATABASE IF NOT EXISTS Members;
CREATE DATABASE IF NOT EXISTS Transactions;

SELECT 'Schemas Admin, Catalog, Members, and Transactions created successfully.' AS Message;
