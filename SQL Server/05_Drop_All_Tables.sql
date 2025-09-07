-- ===========================================
-- 05_Drop_All_Tables.sql
-- Purpose: Drop all tables in the database if they exist to allow a fresh creation.
-- ===========================================

/* Transactions Schema */
IF OBJECT_ID('Transactions.bookShelves','U') IS NOT NULL DROP TABLE Transactions.bookShelves
IF OBJECT_ID('Transactions.FinePayments','U') IS NOT NULL DROP TABLE Transactions.FinePayments
IF OBJECT_ID('Transactions.Fines','U') IS NOT NULL DROP TABLE Transactions.Fines
IF OBJECT_ID('Transactions.MemberBookBorrows','U') IS NOT NULL DROP TABLE Transactions.MemberBookBorrows
IF OBJECT_ID('Transactions.BookReservations','U') IS NOT NULL DROP TABLE Transactions.BookReservations

/* Catalog Schema */
IF OBJECT_ID('Catalog.books','U') IS NOT NULL DROP TABLE Catalog.books
IF OBJECT_ID('Catalog.Authors','U') IS NOT NULL DROP TABLE Catalog.Authors
IF OBJECT_ID('Catalog.publishers','U') IS NOT NULL DROP TABLE Catalog.publishers
IF OBJECT_ID('Catalog.Shelves','U') IS NOT NULL DROP TABLE Catalog.Shelves
IF OBJECT_ID('Catalog.sections','U') IS NOT NULL DROP TABLE Catalog.sections
IF OBJECT_ID('Catalog.genre','U') IS NOT NULL DROP TABLE Catalog.genre

/* Members Schema */
IF OBJECT_ID('Members.Members','U') IS NOT NULL DROP TABLE Members.Members

/* Admin Schema */
IF OBJECT_ID('Admin.employees','U') IS NOT NULL DROP TABLE Admin.employees
IF OBJECT_ID('Admin.staff','U') IS NOT NULL DROP TABLE Admin.staff

GO
