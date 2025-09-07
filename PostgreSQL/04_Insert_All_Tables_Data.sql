-- ===========================================
-- 04_Insert_All_Tables_Data.sql
-- Purpose: Insert sample data into all tables for testing and initial setup.
-- ===========================================

-- Admin.staff
INSERT INTO Admin.staff(staffName, staffDisc, createdBy, createdOn)
VALUES 
('Librarian','Head librarian',1,CURRENT_TIMESTAMP),
('Assistant','Helper',1,CURRENT_TIMESTAMP);

-- Admin.employees
INSERT INTO Admin.employees(employeeName, employeeStaffID, employeeLoginID, employeeLoginPass, createdBy, createdOn)
VALUES
('John Doe',1,'EMP001','abc@123',1,CURRENT_TIMESTAMP),
('Jane Smith',2,'EMP002','pass@456',1,CURRENT_TIMESTAMP),
('Ravi Kumar',1,'EMP003','pass@789',1,CURRENT_TIMESTAMP);

-- Catalog.genre
INSERT INTO Catalog.genre(genrename, genreDisc, createdBy, createdOn)
VALUES
('Fiction','Fiction Books',1,CURRENT_TIMESTAMP),
('Science','Scientific books',1,CURRENT_TIMESTAMP);

-- Catalog.sections
INSERT INTO Catalog.sections(sectionName, sectionShelvesCount, sectionDisc, createdBy, createdOn)
VALUES
('Section A',10,'General',1,CURRENT_TIMESTAMP),
('Section B',15,'Reference',1,CURRENT_TIMESTAMP);

-- Catalog.Shelves
INSERT INTO Catalog.Shelves(shelveCode,shelveName,shelveSectionID,shelveDisc,createdBy,createdOn)
VALUES
('SH001','Fiction Rack',1,'Fiction area',1,CURRENT_TIMESTAMP),
('SH002','Science Rack',2,'Science area',1,CURRENT_TIMESTAMP);

-- Catalog.publishers
INSERT INTO Catalog.publishers(publisherName,publisherContactNo,publisherAddress,publisherDisc,createdBy,createdOn)
VALUES
('Pearson','1234567890','Mumbai','International',1,CURRENT_TIMESTAMP),
('Oxford','9876543210','Pune','Academic',1,CURRENT_TIMESTAMP);

-- Catalog.Authors
INSERT INTO Catalog.Authors(authorName,authorGenreDetails,createdBy,createdOn)
VALUES
('J.K. Rowling','Fantasy',1,CURRENT_TIMESTAMP),
('Dan Brown','Thriller',1,CURRENT_TIMESTAMP);

-- Members.Members
INSERT INTO Members.Members(memberCode,memberFullName,memberAgeInYears,memberGender,memberPhoneNo,memberAddress,createdBy,createdOn)
VALUES
('M001','Rahul Patil',25,'M','9988776655','Nashik',1,CURRENT_TIMESTAMP),
('M002','Sneha Kulkarni',27,'F','8855223366','Pune',1,CURRENT_TIMESTAMP);

-- Catalog.books
INSERT INTO Catalog.books(bookName,bookDisc,bookGenreID,bookAuthorID,bookpublisherID,bookTotalPages,bookPrice,createdBy,createdOn)
VALUES
('Harry Potter','Fantasy Novel',1,1,1,300,399.00,1,CURRENT_TIMESTAMP),
('Da Vinci Code','Thriller Novel',2,2,2,420,499.00,1,CURRENT_TIMESTAMP);

-- Transactions.BookReservations
INSERT INTO Transactions.BookReservations(BookReservationCode,BookID,MemberID,BookReservationDisc,BookReservedTimeInDays,createdBy,createdOn)
VALUES
('BR001',1,1,'Hold 5 days',5,1,CURRENT_TIMESTAMP),
('BR002',2,2,'Hold 7 days',7,1,CURRENT_TIMESTAMP);

-- Transactions.MemberBookBorrows
INSERT INTO Transactions.MemberBookBorrows(MemberID,BookID,BookReservationID,borrowedDatetime,borrowedTimeInDays,borrowedDueDatetime,createdBy,createdOn)
VALUES
(1,1,1,CURRENT_TIMESTAMP,5,CURRENT_TIMESTAMP + INTERVAL '5 day',1,CURRENT_TIMESTAMP),
(2,2,2,CURRENT_TIMESTAMP,7,CURRENT_TIMESTAMP + INTERVAL '7 day',1,CURRENT_TIMESTAMP);

-- Transactions.Fines
INSERT INTO Transactions.Fines(FineCode,FineOnBookID,FineOnMemberID,FineStartedDatetime,FineDiscription,FineTotalDays,FineAmount,FineOnBorrowID,createdBy,createdOn)
VALUES
('F001',1,1,CURRENT_TIMESTAMP,'Late',3,150.00,1,1,CURRENT_TIMESTAMP),
('F002',2,2,CURRENT_TIMESTAMP,'Damaged',2,200.00,2,1,CURRENT_TIMESTAMP);

-- Transactions.FinePayments
INSERT INTO Transactions.FinePayments(FineID,MemberID,PaymentAmount,PaymentDate,PaymentMethod,Remarks,createdBy,createdOn)
VALUES
(1,1,150.00,CURRENT_TIMESTAMP,'Cash','Cleared',1,CURRENT_TIMESTAMP),
(2,2,200.00,CURRENT_TIMESTAMP,'UPI','Done',1,CURRENT_TIMESTAMP);

-- Catalog.bookShelves
INSERT INTO Catalog.bookShelves(bookID,shelveID,sectionID,createdBy,createdOn)
VALUES
(1,1,1,1,CURRENT_TIMESTAMP),
(2,2,2,1,CURRENT_TIMESTAMP);
