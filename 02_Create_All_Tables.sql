
/* ==================== TABLE: staff ====================*/
CREATE TABLE staff(
	staffID INT IDENTITY(1,1) PRIMARY KEY,
	staffName VARCHAR(50) NOT NULL,
	staffDisc VARCHAR(MAX) NULL,
	createdBy INT NOT NULL,
	createdOn DATETIME NOT NULL
);

/* ==================== TABLE: employees ====================*/
CREATE TABLE employees(
	employeeID INT IDENTITY(1,1) PRIMARY KEY,
	employeeName VARCHAR(50) NOT NULL,
	employeeStaffID INT NOT NULL,
	employeeLoginID VARCHAR(7) NULL,
	employeeLoginPass VARCHAR(20) NULL,
	createdBy INT NOT NULL,
	createdOn DATETIME NOT NULL,
	updatedBy INT NULL,
	updatedOn DATETIME NULL,
	CONSTRAINT FK_employees_employeeStaffID FOREIGN KEY(employeeStaffID) REFERENCES staff(staffID),
	CONSTRAINT FK_employees_createdBy FOREIGN KEY(createdBy) REFERENCES employees(employeeID),
	CONSTRAINT FK_employees_updatedBy FOREIGN KEY(updatedBy) REFERENCES employees(employeeID)
);

/* ==================== TABLE: genre ====================*/
CREATE TABLE genre(
	genreID INT IDENTITY(1,1) PRIMARY KEY,
	genrename VARCHAR(50) NOT NULL UNIQUE,
	genreDisc VARCHAR(MAX),
	createdBy INT NOT NULL,
	createdOn DATETIME NOT NULL,
	updatedBy INT NULL,
	updatedOn DATETIME NULL,
	CONSTRAINT FK_genre_createdBy FOREIGN KEY(createdBy) REFERENCES employees(employeeID),
	CONSTRAINT FK_genre_updatedBy FOREIGN KEY(updatedBy) REFERENCES employees(employeeID)
);

/* ==================== TABLE: sections ====================*/
CREATE TABLE sections(
	sectionid INT IDENTITY(1,1) PRIMARY KEY,
	sectionName VARCHAR(50) NOT NULL UNIQUE,
	sectionShelvesCount INT,
	sectionDisc VARCHAR(MAX),
	createdBy INT NOT NULL,
	createdOn DATETIME NOT NULL,
	updatedBy INT NULL,
	updatedOn DATETIME NULL,
	CONSTRAINT FK_sections_createdBy FOREIGN KEY(createdBy) REFERENCES employees(employeeID),
	CONSTRAINT FK_sections_updatedBy FOREIGN KEY(updatedBy) REFERENCES employees(employeeID)
);

/* ==================== TABLE: Shelves ====================*/
CREATE TABLE Shelves(
	shelveID INT IDENTITY(1,1) PRIMARY KEY,
	shelveCode VARCHAR(7) NOT NULL UNIQUE,
	shelveName VARCHAR(50) NOT NULL UNIQUE,
	shelveSectionID INT NOT NULL,
	shelveDisc VARCHAR(MAX),
	createdBy INT NOT NULL,
	createdOn DATETIME NOT NULL,
	updatedBy INT NULL,
	updatedOn DATETIME NULL,
	CONSTRAINT FK_shelves_shelveSectionID FOREIGN KEY(shelveSectionID) REFERENCES sections(sectionid),
	CONSTRAINT FK_shelves_createdBy FOREIGN KEY(createdBy) REFERENCES employees(employeeID),
	CONSTRAINT FK_shelves_updatedBy FOREIGN KEY(updatedBy) REFERENCES employees(employeeID)
);

/* ==================== TABLE: publishers ====================*/
CREATE TABLE publishers(
	publisherID INT IDENTITY(1,1) PRIMARY KEY,
	publisherName VARCHAR(50) NOT NULL UNIQUE,
	publisherContactNo VARCHAR(20),
	publisherAddress VARCHAR(MAX),
	publisherDisc VARCHAR(MAX),
	createdBy INT NOT NULL,
	createdOn DATETIME NOT NULL,
	updatedBy INT NULL,
	updatedOn DATETIME NULL,
	CONSTRAINT FK_publishers_createdBy FOREIGN KEY(createdBy) REFERENCES employees(employeeID),
	CONSTRAINT FK_publishers_updatedBy FOREIGN KEY(updatedBy) REFERENCES employees(employeeID)
);

/* ==================== TABLE: Authors ====================*/
CREATE TABLE Authors(
	authorID INT IDENTITY(1,1) PRIMARY KEY,
	authorName VARCHAR(50) NOT NULL,
	authorGenreDetails VARCHAR(MAX),
	createdBy INT NOT NULL,
	createdOn DATETIME NOT NULL,
	updatedBy INT NULL,
	updatedOn DATETIME NULL,
	CONSTRAINT FK_Authors_createdBy FOREIGN KEY(createdBy) REFERENCES employees(employeeID),
	CONSTRAINT FK_Authors_updatedBy FOREIGN KEY(updatedBy) REFERENCES employees(employeeID)
);

/* ==================== TABLE: Members ====================*/
CREATE TABLE Members(
	memberID INT IDENTITY(1,1) PRIMARY KEY,
	memberCode VARCHAR(10) NOT NULL UNIQUE,
	memberFullName VARCHAR(50) NOT NULL,
	memberAgeInYears INT,
	memberGender CHAR(5),
	memberPhoneNo VARCHAR(20),
	memberAddress VARCHAR(MAX),
	createdBy INT NOT NULL,
	createdOn DATETIME NOT NULL,
	updatedBy INT NULL,
	updatedOn DATETIME NULL,
	CONSTRAINT FK_Members_createdBy FOREIGN KEY(createdBy) REFERENCES employees(employeeID),
	CONSTRAINT FK_Members_updatedBy FOREIGN KEY(updatedBy) REFERENCES employees(employeeID)
);

/* ==================== TABLE: books ====================*/
CREATE TABLE books(
	bookID INT IDENTITY(1,1) PRIMARY KEY,
	bookName VARCHAR(150) NOT NULL UNIQUE,
	bookDisc VARCHAR(MAX),
	bookGenreID INT NOT NULL,
	bookAuthorID INT NOT NULL,
	bookpublisherID INT NOT NULL,
	bookTotalPages INT,
	bookPrice DECIMAL(10,2),
	createdBy INT NOT NULL,
	createdOn DATETIME NOT NULL,
	updatedBy INT NULL,
	updatedOn DATETIME NULL,
	CONSTRAINT FK_books_bookAuthorID FOREIGN KEY(bookAuthorID) REFERENCES Authors(authorID),
	CONSTRAINT FK_books_bookGenreID FOREIGN KEY(bookGenreID) REFERENCES genre(genreID),
	CONSTRAINT FK_books_bookpublisherID FOREIGN KEY(bookpublisherID) REFERENCES publishers(publisherID),
	CONSTRAINT FK_books_createdBy FOREIGN KEY(createdBy) REFERENCES employees(employeeID),
	CONSTRAINT FK_books_updatedBy FOREIGN KEY(updatedBy) REFERENCES employees(employeeID)
);

/* ==================== TABLE: BookReservations ====================*/
CREATE TABLE BookReservations(
	BookReservationID INT IDENTITY(1,1) PRIMARY KEY,
	BookReservationCode VARCHAR(10) NOT NULL UNIQUE,
	BookID INT NOT NULL,
	MemberID INT NOT NULL,
	BookReservationDisc VARCHAR(MAX),
	BookReservationDatetime DATETIME,
	BookReservedTimeInDays INT,
	createdBy INT NOT NULL,
	createdOn DATETIME NOT NULL,
	updatedBy INT NULL,
	updatedOn DATETIME NULL,
	CONSTRAINT FK_BookReservations_BookID FOREIGN KEY(BookID) REFERENCES books(bookID),
	CONSTRAINT FK_BookReservations_MemberID FOREIGN KEY(MemberID) REFERENCES Members(memberID),
	CONSTRAINT FK_BookReservations_createdBy FOREIGN KEY(createdBy) REFERENCES employees(employeeID),
	CONSTRAINT FK_BookReservations_updatedBy FOREIGN KEY(updatedBy) REFERENCES employees(employeeID)
);

/* ==================== TABLE: MemberBookBorrows ====================*/
-- CREATE TABLE MemberBookBorrows(
	-- BorrowID INT IDENTITY(1,1) PRIMARY KEY,
	-- MemberID INT NOT NULL,
	-- BookID INT NOT NULL,
	-- BookReservationID INT NULL,
	-- borrowedDatetime DATETIME NOT NULL,
	-- borrowedTimeInDays INT NOT NULL,
	-- borrowedDueDatetime AS (DATEADD(day, borrowedTimeInDays, borrowedDatetime)),
	-- createdBy INT NOT NULL,
	-- createdOn DATETIME NOT NULL,
	-- updatedBy INT NULL,
	-- updatedOn DATETIME NULL,
	-- CONSTRAINT FK_MemberBookBorrows_MemberID FOREIGN KEY(MemberID) REFERENCES Members(memberID),
	-- CONSTRAINT FK_MemberBookBorrows_BookID FOREIGN KEY(BookID) REFERENCES books(bookID),
	-- CONSTRAINT FK_MemberBookBorrows_Res FOREIGN KEY(BookReservationID) REFERENCES BookReservations(BookReservationID),
	-- CONSTRAINT FK_MemberBookBorrows_createdBy FOREIGN KEY(createdBy) REFERENCES employees(employeeID),
	-- CONSTRAINT FK_MemberBookBorrows_updatedBy FOREIGN KEY(updatedBy) REFERENCES employees(employeeID)
-- );
CREATE TABLE MemberBookBorrows(
	BorrowID INT IDENTITY(1,1) PRIMARY KEY,
	MemberID INT NOT NULL,
	BookID INT NOT NULL,
	BookReservationID INT NULL,
	borrowedDatetime DATETIME NOT NULL,
	borrowedTimeInDays INT NOT NULL,
	borrowedDueDatetime DATETIME NOT NULL, 
	createdBy INT NOT NULL,
	createdOn DATETIME NOT NULL,
	updatedBy INT NULL,
	updatedOn DATETIME NULL,
	CONSTRAINT FK_MemberBookBorrows_MemberID FOREIGN KEY(MemberID) REFERENCES Members(memberID),
	CONSTRAINT FK_MemberBookBorrows_BookID FOREIGN KEY(BookID) REFERENCES books(bookID),
	CONSTRAINT FK_MemberBookBorrows_Res FOREIGN KEY(BookReservationID) REFERENCES BookReservations(BookReservationID),
	CONSTRAINT FK_MemberBookBorrows_createdBy FOREIGN KEY(createdBy) REFERENCES employees(employeeID),
	CONSTRAINT FK_MemberBookBorrows_updatedBy FOREIGN KEY(updatedBy) REFERENCES employees(employeeID)
);

/* ==================== TABLE: Fines ====================*/
CREATE TABLE Fines(
	FineID INT IDENTITY(1,1) PRIMARY KEY,
	FineCode VARCHAR(20) NOT NULL UNIQUE,
	FineOnBookID INT NOT NULL,
	FineOnMemberID INT NOT NULL,
	FineStartedDatetime DATETIME,
	FineDiscription VARCHAR(MAX),
	FineTotalDays INT,
	FineAmount DECIMAL(10,2),
	FineOnBorrowID INT NOT NULL,
	createdBy INT NOT NULL,
	createdOn DATETIME NOT NULL,
	updatedBy INT NULL,
	updatedOn DATETIME NULL,
	CONSTRAINT FK_Fines_FineOnBookID FOREIGN KEY(FineOnBookID) REFERENCES books(bookID),
	CONSTRAINT FK_Fines_FineOnMemberID FOREIGN KEY(FineOnMemberID) REFERENCES Members(memberID),
	CONSTRAINT FK_Fines_FineOnBorrowID FOREIGN KEY(FineOnBorrowID) REFERENCES MemberBookBorrows(BorrowID),
	CONSTRAINT FK_Fines_createdBy FOREIGN KEY(createdBy) REFERENCES employees(employeeID),
	CONSTRAINT FK_Fines_updatedBy FOREIGN KEY(updatedBy) REFERENCES employees(employeeID)
);

/* ==================== TABLE: FinePayments ====================*/
CREATE TABLE FinePayments(
	PaymentID INT IDENTITY(1,1) PRIMARY KEY,
	FineID INT NOT NULL,
	MemberID INT NOT NULL,
	PaymentAmount DECIMAL(10,2),
	PaymentDate DATETIME,
	PaymentMethod VARCHAR(20),
	Remarks VARCHAR(MAX),
	createdBy INT NOT NULL,
	createdOn DATETIME NOT NULL,
	updatedBy INT NULL,
	updatedOn DATETIME NULL,
	CONSTRAINT FK_FinePayments_FineID FOREIGN KEY(FineID) REFERENCES Fines(FineID),
	CONSTRAINT FK_FinePayments_MemberID FOREIGN KEY(MemberID) REFERENCES Members(memberID),
	CONSTRAINT FK_FinePayments_createdBy FOREIGN KEY(createdBy) REFERENCES employees(employeeID),
	CONSTRAINT FK_FinePayments_updatedBy FOREIGN KEY(updatedBy) REFERENCES employees(employeeID)
);

/* ==================== TABLE: bookShelves ====================*/
CREATE TABLE bookShelves(
	bookShelveID INT IDENTITY(1,1) PRIMARY KEY,
	bookID INT NOT NULL,
	shelveID INT NOT NULL,
	sectionID INT NOT NULL,
	createdBy INT NOT NULL,
	createdOn DATETIME NOT NULL,
	updatedBy INT NULL,
	updatedOn DATETIME NULL,
	CONSTRAINT FK_bookShelves_bookID FOREIGN KEY(bookID) REFERENCES books(bookID),
	CONSTRAINT FK_bookShelves_shelveID FOREIGN KEY(shelveID) REFERENCES Shelves(shelveID),
	CONSTRAINT FK_bookShelves_sectionID FOREIGN KEY(sectionID) REFERENCES sections(sectionid),
	CONSTRAINT FK_bookShelves_createdBy FOREIGN KEY(createdBy) REFERENCES employees(employeeID),
	CONSTRAINT FK_bookShelves_updatedBy FOREIGN KEY(updatedBy) REFERENCES employees(employeeID)
);

GO
