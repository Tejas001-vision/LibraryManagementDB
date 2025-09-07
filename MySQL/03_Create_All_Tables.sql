-- ===========================================
-- 03_Create_All_Tables.sql
-- Purpose: Create all tables under their respective "schemas" (databases)
-- ===========================================

-- Use the main database
USE LibraryManagementSystem;

-- Table: staff
CREATE TABLE IF NOT EXISTS Admin_staff (
    staffID INT AUTO_INCREMENT PRIMARY KEY,
    staffName VARCHAR(50) NOT NULL,
    staffDisc TEXT,
    createdBy INT NOT NULL,
    createdOn DATETIME NOT NULL
);

-- Table: employees
CREATE TABLE IF NOT EXISTS Admin_employees (
    employeeID INT AUTO_INCREMENT PRIMARY KEY,
    employeeName VARCHAR(50) NOT NULL,
    employeeStaffID INT NOT NULL,
    employeeLoginID VARCHAR(7),
    employeeLoginPass VARCHAR(20),
    createdBy INT NOT NULL,
    createdOn DATETIME NOT NULL,
    updatedBy INT,
    updatedOn DATETIME,
    FOREIGN KEY (employeeStaffID) REFERENCES Admin_staff(staffID),
    FOREIGN KEY (createdBy) REFERENCES Admin_employees(employeeID),
    FOREIGN KEY (updatedBy) REFERENCES Admin_employees(employeeID)
);

-- Table: genre
CREATE TABLE IF NOT EXISTS Catalog_genre (
    genreID INT AUTO_INCREMENT PRIMARY KEY,
    genrename VARCHAR(50) UNIQUE NOT NULL,
    genreDisc TEXT,
    createdBy INT NOT NULL,
    createdOn DATETIME NOT NULL,
    updatedBy INT,
    updatedOn DATETIME,
    FOREIGN KEY (createdBy) REFERENCES Admin_employees(employeeID),
    FOREIGN KEY (updatedBy) REFERENCES Admin_employees(employeeID)
);

-- Table: sections
CREATE TABLE IF NOT EXISTS Catalog_sections (
    sectionid INT AUTO_INCREMENT PRIMARY KEY,
    sectionName VARCHAR(50) UNIQUE NOT NULL,
    sectionShelvesCount INT,
    sectionDisc TEXT,
    createdBy INT NOT NULL,
    createdOn DATETIME NOT NULL,
    updatedBy INT,
    updatedOn DATETIME,
    FOREIGN KEY (createdBy) REFERENCES Admin_employees(employeeID),
    FOREIGN KEY (updatedBy) REFERENCES Admin_employees(employeeID)
);

-- Table: Shelves
CREATE TABLE IF NOT EXISTS Catalog_Shelves (
    shelveID INT AUTO_INCREMENT PRIMARY KEY,
    shelveCode VARCHAR(7) UNIQUE NOT NULL,
    shelveName VARCHAR(50) UNIQUE NOT NULL,
    shelveSectionID INT NOT NULL,
    shelveDisc TEXT,
    createdBy INT NOT NULL,
    createdOn DATETIME NOT NULL,
    updatedBy INT,
    updatedOn DATETIME,
    FOREIGN KEY (shelveSectionID) REFERENCES Catalog_sections(sectionid),
    FOREIGN KEY (createdBy) REFERENCES Admin_employees(employeeID),
    FOREIGN KEY (updatedBy) REFERENCES Admin_employees(employeeID)
);

-- Table: publishers
CREATE TABLE IF NOT EXISTS Catalog_publishers (
    publisherID INT AUTO_INCREMENT PRIMARY KEY,
    publisherName VARCHAR(50) UNIQUE NOT NULL,
    publisherContactNo VARCHAR(20),
    publisherAddress TEXT,
    publisherDisc TEXT,
    createdBy INT NOT NULL,
    createdOn DATETIME NOT NULL,
    updatedBy INT,
    updatedOn DATETIME,
    FOREIGN KEY (createdBy) REFERENCES Admin_employees(employeeID),
    FOREIGN KEY (updatedBy) REFERENCES Admin_employees(employeeID)
);

-- Table: Authors
CREATE TABLE IF NOT EXISTS Catalog_Authors (
    authorID INT AUTO_INCREMENT PRIMARY KEY,
    authorName VARCHAR(50) NOT NULL,
    authorGenreDetails TEXT,
    createdBy INT NOT NULL,
    createdOn DATETIME NOT NULL,
    updatedBy INT,
    updatedOn DATETIME,
    FOREIGN KEY (createdBy) REFERENCES Admin_employees(employeeID),
    FOREIGN KEY (updatedBy) REFERENCES Admin_employees(employeeID)
);

-- Table: Members
CREATE TABLE IF NOT EXISTS Members_Members (
    memberID INT AUTO_INCREMENT PRIMARY KEY,
    memberCode VARCHAR(10) UNIQUE NOT NULL,
    memberFullName VARCHAR(50) NOT NULL,
    memberAgeInYears INT,
    memberGender CHAR(5),
    memberPhoneNo VARCHAR(20),
    memberAddress TEXT,
    createdBy INT NOT NULL,
    createdOn DATETIME NOT NULL,
    updatedBy INT,
    updatedOn DATETIME,
    FOREIGN KEY (createdBy) REFERENCES Admin_employees(employeeID),
    FOREIGN KEY (updatedBy) REFERENCES Admin_employees(employeeID)
);

-- Table: books
CREATE TABLE IF NOT EXISTS Catalog_books (
    bookID INT AUTO_INCREMENT PRIMARY KEY,
    bookName VARCHAR(150) UNIQUE NOT NULL,
    bookDisc TEXT,
    bookGenreID INT NOT NULL,
    bookAuthorID INT NOT NULL,
    bookpublisherID INT NOT NULL,
    bookTotalPages INT,
    bookPrice DECIMAL(10,2),
    createdBy INT NOT NULL,
    createdOn DATETIME NOT NULL,
    updatedBy INT,
    updatedOn DATETIME,
    FOREIGN KEY (bookAuthorID) REFERENCES Catalog_Authors(authorID),
    FOREIGN KEY (bookGenreID) REFERENCES Catalog_genre(genreID),
    FOREIGN KEY (bookpublisherID) REFERENCES Catalog_publishers(publisherID),
    FOREIGN KEY (createdBy) REFERENCES Admin_employees(employeeID),
    FOREIGN KEY (updatedBy) REFERENCES Admin_employees(employeeID)
);

-- Transactions tables would be created similarly with prefix "Transactions_" instead of schema
