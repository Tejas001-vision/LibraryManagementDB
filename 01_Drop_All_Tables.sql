
USE [LMS]
GO

/* ==================== DROP IF EXISTS (to re-create fresh) ====================*/
IF OBJECT_ID('dbo.bookShelves','U') IS NOT NULL DROP TABLE dbo.bookShelves
IF OBJECT_ID('dbo.FinePayments','U') IS NOT NULL DROP TABLE dbo.FinePayments
IF OBJECT_ID('dbo.Fines','U') IS NOT NULL DROP TABLE dbo.Fines
IF OBJECT_ID('dbo.MemberBookBorrows','U') IS NOT NULL DROP TABLE dbo.MemberBookBorrows
IF OBJECT_ID('dbo.BookReservations','U') IS NOT NULL DROP TABLE dbo.BookReservations
IF OBJECT_ID('dbo.books','U') IS NOT NULL DROP TABLE dbo.books
IF OBJECT_ID('dbo.Members','U') IS NOT NULL DROP TABLE dbo.Members
IF OBJECT_ID('dbo.Authors','U') IS NOT NULL DROP TABLE dbo.Authors
IF OBJECT_ID('dbo.publishers','U') IS NOT NULL DROP TABLE dbo.publishers
IF OBJECT_ID('dbo.Shelves','U') IS NOT NULL DROP TABLE dbo.Shelves
IF OBJECT_ID('dbo.sections','U') IS NOT NULL DROP TABLE dbo.sections
IF OBJECT_ID('dbo.genre','U') IS NOT NULL DROP TABLE dbo.genre
IF OBJECT_ID('dbo.employees','U') IS NOT NULL DROP TABLE dbo.employees
IF OBJECT_ID('dbo.staff','U') IS NOT NULL DROP TABLE dbo.staff
GO
