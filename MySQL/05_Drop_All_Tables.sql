-- ===========================================
-- 05_Drop_All_Tables.sql
-- Purpose: Drop all tables in the database if they exist to allow a fresh creation.
-- ===========================================

-- Transactions
DROP TABLE IF EXISTS Transactions_bookShelves;
DROP TABLE IF EXISTS Transactions_FinePayments;
DROP TABLE IF EXISTS Transactions_Fines;
DROP TABLE IF EXISTS Transactions_MemberBookBorrows;
DROP TABLE IF EXISTS Transactions_BookReservations;

-- Catalog
DROP TABLE IF EXISTS Catalog_books;
DROP TABLE IF EXISTS Catalog_Authors;
DROP TABLE IF EXISTS Catalog_publishers;
DROP TABLE IF EXISTS Catalog_Shelves;
DROP TABLE IF EXISTS Catalog_sections;
DROP TABLE IF EXISTS Catalog_genre;

-- Members
DROP TABLE IF EXISTS Members_Members;

-- Admin
DROP TABLE IF EXISTS Admin_employees;
DROP TABLE IF EXISTS Admin_staff;
