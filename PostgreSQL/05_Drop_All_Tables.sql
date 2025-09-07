-- ===========================================
-- 05_Drop_All_Tables.sql
-- Purpose: Drop all tables in the database if they exist to allow a fresh creation.
-- ===========================================

-- Transactions Schema
DROP TABLE IF EXISTS Transactions.bookShelves CASCADE;
DROP TABLE IF EXISTS Transactions.FinePayments CASCADE;
DROP TABLE IF EXISTS Transactions.Fines CASCADE;
DROP TABLE IF EXISTS Transactions.MemberBookBorrows CASCADE;
DROP TABLE IF EXISTS Transactions.BookReservations CASCADE;

-- Catalog Schema
DROP TABLE IF EXISTS Catalog.books CASCADE;
DROP TABLE IF EXISTS Catalog.Authors CASCADE;
DROP TABLE IF EXISTS Catalog.publishers CASCADE;
DROP TABLE IF EXISTS Catalog.Shelves CASCADE;
DROP TABLE IF EXISTS Catalog.sections CASCADE;
DROP TABLE IF EXISTS Catalog.genre CASCADE;

-- Members Schema
DROP TABLE IF EXISTS Members.Members CASCADE;

-- Admin Schema
DROP TABLE IF EXISTS Admin.employees CASCADE;
DROP TABLE IF EXISTS Admin.staff CASCADE;
