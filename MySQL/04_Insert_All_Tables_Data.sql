-- ===========================================
-- 04_Insert_All_Tables_Data.sql
-- Purpose: Insert sample data into all tables for testing and initial setup.
-- ===========================================

-- Admin_staff
INSERT INTO Admin_staff(staffName, staffDisc, createdBy, createdOn)
VALUES 
('Librarian','Head librarian',1,NOW()),
('Assistant','Helper',1,NOW());

-- Admin_employees
INSERT INTO Admin_employees(employeeName, employeeStaffID, employeeLoginID, employeeLoginPass, createdBy, createdOn)
VALUES
('John Doe',1,'EMP001','abc@123',1,NOW()),
('Jane Smith',2,'EMP002','pass@456',1,NOW()),
('Ravi Kumar',1,'EMP003','pass@789',1,NOW());

-- Catalog_genre
INSERT INTO Catalog_genre(genrename, genreDisc, createdBy, createdOn)
VALUES
('Fiction','Fiction Books',1,NOW()),
('Science','Scientific books',1,NOW());

-- Catalog_sections
INSERT INTO Catalog_sections(sectionName, sectionShelvesCount, sectionDisc, createdBy, createdOn)
VALUES
('Section A',10,'General',1,NOW()),
('Section B',15,'Reference',1,NOW());

-- Catalog_Shelves
INSERT INTO Catalog_Shelves(shelveCode,shelveName,shelveSectionID,shelveDisc,createdBy,createdOn)
VALUES
('SH001','Fiction Rack',1,'Fiction area',1,NOW()),
('SH002','Science Rack',2,'Science area',1,NOW());

-- Catalog_publishers
INSERT INTO Catalog_publishers(publisherName,publisherContactNo,publisherAddress,publisherDisc,createdBy,createdOn)
VALUES
('Pearson','1234567890','Mumbai','International',1,NOW()),
('Oxford','9876543210','Pune','Academic',1,NOW());

-- Catalog_Authors
INSERT INTO Catalog_Authors(authorName,authorGenreDetails,createdBy,createdOn)
VALUES
('J.K. Rowling','Fantasy',1,NOW()),
('Dan Brown','Thriller',1,NOW());

-- Members_Members
INSERT INTO Members_Members(memberCode,memberFullName,memberAgeInYears,memberGender,memberPhoneNo,memberAddress,createdBy,createdOn)
VALUES
('M001','Rahul Patil',25,'M','9988776655','Nashik',1,NOW()),
('M002','Sneha Kulkarni',27,'F','8855223366','Pune',1,NOW());

-- Catalog_books
INSERT INTO Catalog_books(bookName,bookDisc,bookGenreID,bookAuthorID,bookpublisherID,bookTotalPages,bookPrice,createdBy,createdOn)
VALUES
('Harry Potter','Fantasy Novel',1,1,1,300,399.00,1,NOW()),
('Da Vinci Code','Thriller Novel',2,2,2,420,499.00,1,NOW());

-- Transactions_BookReservations
INSERT INTO Transactions_BookReservations(BookReservationCode,BookID,MemberID,BookReservationDisc,BookReservedTimeInDays,createdBy,createdOn)
VALUES
('BR001',1,1,'Hold 5 days',5,1,NOW()),
('BR002',2,2,'Hold 7 days',7,1,NOW());

-- Transactions_MemberBookBorrows
INSERT INTO Transactions_MemberBookBorrows(MemberID,BookID,BookReservationID,borrowedDatetime,borrowedTimeInDays,borrowedDueDatetime,createdBy,createdOn)
VALUES
(1,1,1,NOW(),5,DATE_ADD(NOW(), INTERVAL 5 DAY),1,NOW()),
(2,2,2,NOW(),7,DATE_ADD(NOW(), INTERVAL 7 DAY),1,NOW());

-- Transactions_Fines
INSERT INTO Transactions_Fines(FineCode,FineOnBookID,FineOnMemberID,FineStartedDatetime,FineDiscription,FineTotalDays,FineAmount,FineOnBorrowID,createdBy,createdOn)
VALUES
('F001',1,1,NOW(),'Late',3,150.00,1,1,NOW()),
('F002',2,2,NOW(),'Damaged',2,200.00,2,1,NOW());

-- Transactions_FinePayments
INSERT INTO Transactions_FinePayments(FineID,MemberID,PaymentAmount,PaymentDate,PaymentMethod,Remarks,createdBy,createdOn)
VALUES
(1,1,150.00,NOW(),'Cash','
