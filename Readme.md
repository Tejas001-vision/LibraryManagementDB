# Library Management System (LMS)

## Overview
The Library Management System (LMS) is a database-driven system designed to manage library operations, including staff, employees, books, authors, genres, members, book reservations, borrowings, fines, and payments. This project provides SQL scripts for SQL Server, PostgreSQL, and MySQL to create, populate, and manage the LMS database.

---

## File Structure and Purpose

 File  Purpose 
---------------
 `01_Create_Database.sql`  Creates the `LibraryManagementSystem` database. 
 `02_Create_Schemas.sql`  Creates schemas (`Admin`, `Catalog`, `Members`, `Transactions`) to organize tables logically. 
 `03_Create_All_Tables.sql`  Creates all tables under their respective schemas with primary keys, foreign keys, and constraints. 
 `04_Insert_All_Tables_Data.sql`  Inserts sample data into all tables for testing and initial setup. 
 `05_Drop_All_Tables.sql`  Drops all tables if they exist to allow a fresh creation. 
 `06_Drop_Schemas.sql`  Drops all schemas to allow re-creation or cleanup. 
 `07_Drop_Database.sql`  Drops the `LibraryManagementSystem` database to ensure a clean environment. 

---

## Schemas and Tables

### 1. Admin
- `staff`  
- `employees`

### 2. Catalog
- `genre`  
- `sections`  
- `Shelves`  
- `publishers`  
- `Authors`  
- `books`  
- `bookShelves`  

### 3. Members
- `Members`

### 4. Transactions
- `BookReservations`  
- `MemberBookBorrows`  
- `Fines`  
- `FinePayments`

---

## Supported Platforms
- SQL Server (T-SQL syntax, IDENTITY columns, GETDATE())
- PostgreSQL (SERIALGENERATED columns, CURRENT_TIMESTAMP)
- MySQL (AUTO_INCREMENT, NOW())

 Each SQL script has been converted to work for SQL Server, PostgreSQL, and MySQL with proper syntax adjustments for sequences, date functions, and schemas.

---

## How to Use

1. Create Database
   - Run `01_Create_Database.sql` to create the `LibraryManagementSystem` database.
2. Create Schemas
   - Run `02_Create_Schemas.sql` to create logical schemas.
3. Create Tables
   - Run `03_Create_All_Tables.sql` to create all tables under the schemas.
4. Insert Sample Data
   - Run `04_Insert_All_Tables_Data.sql` to populate tables with initial data.
5. Drop Tables  Schemas  Database (if needed)
   - Run `05_Drop_All_Tables.sql` to remove all tables.
   - Run `06_Drop_Schemas.sql` to remove all schemas.
   - Run `07_Drop_Database.sql` to remove the database.

---

## Notes
- Always create the database first before creating schemas or tables.
- The scripts are ordered in a way to handle dependencies (e.g., foreign keys).
- Sample data is for testing purposes; adjust as needed for production.
- Foreign key constraints ensure referential integrity between tables.

---

## Contact
For questions or support, contact Your Name  Your Email

---

Enjoy managing your library efficiently with LMS!
