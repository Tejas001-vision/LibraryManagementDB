-- ===========================================
-- 03_Create_All_Tables.sql
-- Purpose: Create all tables under their respective schemas
-- ===========================================

-- Connect to the database
\c LibraryManagementSystem;

-- Table: staff
CREATE TABLE IF NOT EXISTS Admin.staff (
    staffID SERIAL PRIMARY KEY,
    staffName VARCHAR(50) NOT NULL,
    staffDisc TEXT,
    createdBy INT NOT NULL,
    createdOn TIMESTAMP NOT NULL
);

-- Table: employees
CREATE TABLE IF NOT EXISTS Admin.employees (
    employeeID SERIAL PRIMARY KEY,
    employeeName VARCHAR(50) NOT NULL,
    employeeStaffID INT NOT NULL,
    employeeLoginID VARCHAR(7),
    employeeLoginPass VARCHAR(20),
    createdBy INT NOT NULL,
    createdOn TIMESTAMP NOT NULL,
    updatedBy INT,
    updatedOn TIMESTAMP,
    CONSTRAINT FK_employees_employeeStaffID FOREIGN KEY(employeeStaffID) REFERENCES Admin.staff(staffID),
    CONSTRAINT FK_employees_createdBy FOREIGN KEY(createdBy) REFERENCES Admin.employees(employeeID),
    CONSTRAINT FK_employees_updatedBy FOREIGN KEY(updatedBy) REFERENCES Admin.employees(employeeID)
);

-- Table: genre
CREATE TABLE IF NOT EXISTS Catalog.genre (
    genreID SERIAL PRIMARY KEY,
    genrename VARCHAR(50) UNIQUE NOT NULL,
    genreDisc TEXT,
    createdBy INT NOT NULL,
    createdOn TIMESTAMP NOT NULL,
    updatedBy INT,
    updatedOn TIMESTAMP,
    CONSTRAINT FK_genre_createdBy FOREIGN KEY(createdBy) REFERENCES Admin.employees(employeeID),
    CONSTRAINT FK_genre_updatedBy FOREIGN KEY(updatedBy) REFERENCES Admin.employees(employeeID)
);

-- Table: sections
CREATE TABLE IF NOT EXISTS Catalog.sections (
    sectionid SERIAL PRIMARY KEY,
    sectionName VARCHAR(50) UNIQUE NOT NULL,
    sectionShelvesCount INT,
    sectionDisc TEXT,
    createdBy INT NOT NULL,
    createdOn TIMESTAMP NOT NULL,
    updatedBy INT,
    updatedOn TIMESTAMP,
    CONSTRAINT FK_sections_createdBy FOREIGN KEY(createdBy) REFERENCES Admin.employees(employeeID),
    CONSTRAINT FK_sections_updatedBy FOREIGN KEY(updatedBy) REFERENCES Admin.employees(employeeID)
);

-- Table: Shelves
CREATE TABLE IF NOT EXISTS Catalog.Shelves (
    shelveID SERIAL PRIMARY KEY,
    shelveCode VARCHAR(7) UNIQUE NOT NULL,
    shelveName VARCHAR(50) UNIQUE NOT NULL,
    shelveSectionID INT NOT NULL,
    shelveDisc TEXT,
    createdBy INT NOT NULL,
    createdOn TIMESTAMP NOT NULL,
    updatedBy INT,
    updatedOn TIMESTAMP,
    CONSTRAINT FK_shelves_shelveSectionID FOREIGN KEY(shelveSectionID) REFERENCES Catalog.sections(sectionid),
    CONSTRAINT FK_shelves_createdBy FOREIGN KEY(createdBy) REFERENCES Admin.employees(employeeID),
    CONSTRAINT FK_shelves_updatedBy FOREIGN KEY(updatedBy) REFERENCES Admin.employees(employeeID)
);

-- Table: publishers
CREATE TABLE IF NOT EXISTS Catalog.publishers (
    publisherID SERIAL PRIMARY KEY,
    publisherName VARCHAR(50) UNIQUE NOT NULL,
    publisherContactNo VARCHAR(20),
    publisherAddress TEXT,
    publisherDisc TEXT,
    createdBy INT NOT NULL,
    createdOn TIMESTAMP NOT NULL,
    updatedBy INT,
    updatedOn TIMESTAMP,
    CONSTRAINT FK_publishers_createdBy FOREIGN KEY(createdBy) REFERENCES Admin.employees(employeeID),
    CONSTRAINT FK_publishers_updatedBy FOREIGN KEY(updatedBy) REFERENCES Admin.employees(employeeID)
);

-- Table: Authors
CREATE TABLE IF NOT EXISTS Catalog.Authors (
    authorID SERIAL PRIMARY KEY,
    authorName VARCHAR(50) NOT NULL,
    authorGenreDetails TEXT,
    createdBy INT NOT NULL,
    createdOn TIMESTAMP NOT NULL,
    updatedBy INT,
    updatedOn TIMESTAMP,
    CONSTRAINT FK_Authors_createdBy FOREIGN KEY(createdBy) REFERENCES Admin.employees(employeeID),
    CONSTRAINT FK_Authors_updatedBy FOREIGN KEY(updatedBy) REFERENCES Admin.employees(employeeID)
);

-- Table: Members
CREATE TABLE IF NOT EXISTS Members.Members (
    memberID SERIAL PRIMARY KEY,
    memberCode VARCHAR(10) UNIQUE NOT NULL,
    memberFullName VARCHAR(50) NOT NULL,
    memberAgeInYears INT,
    memberGender CHAR(5),
    memberPhoneNo VARCHAR(20),
    memberAddress TEXT,
    createdBy INT NOT NULL,
    createdOn TIMESTAMP NOT NULL,
    updatedBy INT,
    updatedOn TIMESTAMP,
    CONSTRAINT FK_Members_createdBy FOREIGN KEY(createdBy) REFERENCES Admin.employees(employeeID),
    CONSTRAINT FK_Members_updatedBy FOREIGN KEY(updatedBy) REFERENCES Admin.employees(employeeID)
);

-- Table: books
CREATE TABLE IF NOT EXISTS Catalog.books (
    bookID SERIAL PRIMARY KEY,
    bookName VARCHAR(150) UNIQUE NOT NULL,
    bookDisc TEXT,
    bookGenreID INT NOT NULL,
    bookAuthorID INT NOT NULL,
    bookpublisherID INT NOT NULL,
    bookTotalPages INT,
    bookPrice NUMERIC(10,2),
    createdBy INT NOT NULL,
    createdOn TIMESTAMP NOT NULL,
    updatedBy INT,
    updatedOn TIMESTAMP,
    CONSTRAINT FK_books_bookAuthorID FOREIGN KEY(bookAuthorID) REFERENCES Catalog.Authors(authorID),
    CONSTRAINT FK_books_bookGenreID FOREIGN KEY(bookGenreID) REFERENCES Catalog.genre(genreID),
    CONSTRAINT FK_books_bookpublisherID FOREIGN KEY(bookpublisherID) REFERENCES Catalog.publishers(publisherID),
    CONSTRAINT FK_books_createdBy FOREIGN KEY(createdBy) REFERENCES Admin.employees(employeeID),
    CONSTRAINT FK_books_updatedBy FOREIGN KEY(updatedBy) REFERENCES Admin.employees(employeeID)
);

-- Tables Transactions: BookReservations, MemberBookBorrows, Fines, FinePayments
-- Table: BookReservations
CREATE TABLE IF NOT EXISTS Transactions.BookReservations (
    BookReservationID SERIAL PRIMARY KEY,
    BookReservationCode VARCHAR(10) UNIQUE NOT NULL,
    BookID INT NOT NULL,
    MemberID INT NOT NULL,
    BookReservationDisc TEXT,
    BookReservationDatetime TIMESTAMP,
    BookReservedTimeInDays INT,
    createdBy INT NOT NULL,
    createdOn TIMESTAMP NOT NULL,
    updatedBy INT,
    updatedOn TIMESTAMP,
    CONSTRAINT FK_BookReservations_BookID FOREIGN KEY(BookID) REFERENCES Catalog.books(bookID),
    CONSTRAINT FK_BookReservations_MemberID FOREIGN KEY(MemberID) REFERENCES Members.Members(memberID),
    CONSTRAINT FK_BookReservations_createdBy FOREIGN KEY(createdBy) REFERENCES Admin.employees(employeeID),
    CONSTRAINT FK_BookReservations_updatedBy FOREIGN KEY(updatedBy) REFERENCES Admin.employees(employeeID)
);

-- Table: MemberBookBorrows
CREATE TABLE IF NOT EXISTS Transactions.MemberBookBorrows (
    BorrowID SERIAL PRIMARY KEY,
    MemberID INT NOT NULL,
    BookID INT NOT NULL,
    BookReservationID INT,
    borrowedDatetime TIMESTAMP NOT NULL,
    borrowedTimeInDays INT NOT NULL,
    borrowedDueDatetime TIMESTAMP NOT NULL,
    createdBy INT NOT NULL,
    createdOn TIMESTAMP NOT NULL,
    updatedBy INT,
    updatedOn TIMESTAMP,
    CONSTRAINT FK_MemberBookBorrows_MemberID FOREIGN KEY(MemberID) REFERENCES Members.Members(memberID),
    CONSTRAINT FK_MemberBookBorrows_BookID FOREIGN KEY(BookID) REFERENCES Catalog.books(bookID),
    CONSTRAINT FK_MemberBookBorrows_Res FOREIGN KEY(BookReservationID) REFERENCES Transactions.BookReservations(BookReservationID),
    CONSTRAINT FK_MemberBookBorrows_createdBy FOREIGN KEY(createdBy) REFERENCES Admin.employees(employeeID),
    CONSTRAINT FK_MemberBookBorrows_updatedBy FOREIGN KEY(updatedBy) REFERENCES Admin.employees(employeeID)
);

-- Table: Fines
CREATE TABLE IF NOT EXISTS Transactions.Fines (
    FineID SERIAL PRIMARY KEY,
    FineCode VARCHAR(20) UNIQUE NOT NULL,
    FineOnBookID INT NOT NULL,
    FineOnMemberID INT NOT NULL,
    FineStartedDatetime TIMESTAMP,
    FineDiscription TEXT,
    FineTotalDays INT,
    FineAmount NUMERIC(10,2),
    FineOnBorrowID INT NOT NULL,
    createdBy INT NOT NULL,
    createdOn TIMESTAMP NOT NULL,
    updatedBy INT,
    updatedOn TIMESTAMP,
    CONSTRAINT FK_Fines_FineOnBookID FOREIGN KEY(FineOnBookID) REFERENCES Catalog.books(bookID),
    CONSTRAINT FK_Fines_FineOnMemberID FOREIGN KEY(FineOnMemberID) REFERENCES Members.Members(memberID),
    CONSTRAINT FK_Fines_FineOnBorrowID FOREIGN KEY(FineOnBorrowID) REFERENCES Transactions.MemberBookBorrows(BorrowID),
    CONSTRAINT FK_Fines_createdBy FOREIGN KEY(createdBy) REFERENCES Admin.employees(employeeID),
    CONSTRAINT FK_Fines_updatedBy FOREIGN KEY(updatedBy) REFERENCES Admin.employees(employeeID)
);

-- Table: FinePayments
CREATE TABLE IF NOT EXISTS Transactions.FinePayments (
    PaymentID SERIAL PRIMARY KEY,
    FineID INT NOT NULL,
    MemberID INT NOT NULL,
    PaymentAmount NUMERIC(10,2),
    PaymentDate TIMESTAMP,
    PaymentMethod VARCHAR(20),
    Remarks TEXT,
    createdBy INT NOT NULL,
    createdOn TIMESTAMP NOT NULL,
    updatedBy INT,
    updatedOn TIMESTAMP,
    CONSTRAINT FK_FinePayments_FineID FOREIGN KEY(FineID) REFERENCES Transactions.Fines(FineID),
    CONSTRAINT FK_FinePayments_MemberID FOREIGN KEY(MemberID) REFERENCES Members.Members(memberID),
    CONSTRAINT FK_FinePayments_createdBy FOREIGN KEY(createdBy) REFERENCES Admin.employees(employeeID),
    CONSTRAINT FK_FinePayments_updatedBy FOREIGN KEY(updatedBy) REFERENCES Admin.employees(employeeID)
);

-- Table: bookShelves
CREATE TABLE IF NOT EXISTS Catalog.bookShelves (
    bookShelveID SERIAL PRIMARY KEY,
    bookID INT NOT NULL,
    shelveID INT NOT NULL,
    sectionID INT NOT NULL,
    createdBy INT NOT NULL,
    createdOn TIMESTAMP NOT NULL,
    updatedBy INT,
    updatedOn TIMESTAMP,
    CONSTRAINT FK_bookShelves_bookID FOREIGN KEY(bookID) REFERENCES Catalog.books(bookID),
    CONSTRAINT FK_bookShelves_shelveID FOREIGN KEY(shelveID) REFERENCES Catalog.Shelves(shelveID),
    CONSTRAINT FK_bookShelves_sectionID FOREIGN KEY(sectionID) REFERENCES Catalog.sections(sectionid),
    CONSTRAINT FK_bookShelves_createdBy FOREIGN KEY(createdBy) REFERENCES Admin.employees(employeeID),
    CONSTRAINT FK_bookShelves_updatedBy FOREIGN KEY(updatedBy) REFERENCES Admin.employees(employeeID)
);
