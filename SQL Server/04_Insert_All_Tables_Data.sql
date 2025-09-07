-- ===========================================
-- 04_Insert_All_Tables_Data.sql
-- Purpose: Insert sample data into all tables for testing and initial setup.
-- ===========================================

-- Admin.staff
INSERT INTO Admin.staff(staffName, staffDisc, createdBy, createdOn)
VALUES ('Librarian','Head librarian',1,GETDATE()),
       ('Assistant','Helper',1,GETDATE());

-- Admin.employees
INSERT INTO Admin.employees(employeeName, employeeStaffID, employeeLoginID, employeeLoginPass, createdBy, createdOn)
VALUES('John Doe',1,'EMP001','abc@123',1,GETDATE()),
      ('Jane Smith',2,'EMP002','pass@456',1,GETDATE()),
      ('Ravi Kumar',1,'EMP003','pass@789',1,GETDATE());

-- Catalog.genre
INSERT INTO Catalog.genre(genrename, genreDisc, createdBy, createdOn)
VALUES('Fiction','Fiction Books',1,GETDATE()),
      ('Science','Scientific books',1,GETDATE());

-- Catalog.sections
INSERT INTO Catalog.sections(sectionName, sectionShelvesCount, sectionDisc, createdBy, createdOn)
VALUES ('Section A',10,'General',1,GETDATE()),
       ('Section B',15,'Reference',1,GETDATE());

-- Catalog.Shelves
INSERT INTO Catalog.Shelves(shelveCode,shelveName,shelveSectionID,shelveDisc,createdBy,createdOn)
VALUES('SH001','Fiction Rack',1,'Fiction area',1,GETDATE()),
      ('SH002','Science Rack',2,'Science area',1,GETDATE());

-- Catalog.publishers
INSERT INTO Catalog.publishers(publisherName,publisherContactNo,publisherAddress,publisherDisc,createdBy,createdOn)
VALUES('Pearson','1234567890','Mumbai','International',1,GETDATE()),
      ('Oxford','9876543210','Pune','Academic',1,GETDATE());

-- Catalog.Authors
INSERT INTO Catalog.Authors(authorName,authorGenreDetails,createdBy,createdOn)
VALUES('J.K. Rowling','Fantasy',1,GETDATE()),
      ('Dan Brown','Thriller',1,GETDATE());

-- Members.Members
INSERT INTO Members.Members(memberCode,memberFullName,memberAgeInYears,memberGender,memberPhoneNo,memberAddress,createdBy,createdOn)
VALUES('M001','Rahul Patil',25,'M','9988776655','Nashik',1,GETDATE()),
      ('M002','Sneha Kulkarni',27,'F','8855223366','Pune',1,GETDATE());

-- Catalog.books
INSERT INTO Catalog.books(bookName,bookDisc,bookGenreID,bookAuthorID,bookpublisherID,bookTotalPages,bookPrice,createdBy,createdOn)
VALUES('Harry Potter','Fantasy Novel',1,1,1,300,399.00,1,GETDATE()),
      ('Da Vinci Code','Thriller Novel',2,2,2,420,499.00,1,GETDATE());

-- Transactions.BookReservations
INSERT INTO Transactions.BookReservations(BookReservationCode,BookID,MemberID,BookReservationDisc,BookReservedTimeInDays,createdBy,createdOn)
VALUES('BR001',1,1,'Hold 5 days',5,1,GETDATE()),
      ('BR002',2,2,'Hold 7 days',7,1,GETDATE());

-- Transactions.MemberBookBorrows
INSERT INTO Transactions.MemberBookBorrows(MemberID,BookID,BookReservationID,borrowedDatetime,borrowedTimeInDays,borrowedDueDatetime,createdBy,createdOn)
VALUES(1,1,1,GETDATE(),5,DATEADD(day,5,GETDATE()),1,GETDATE()),
      (2,2,2,GETDATE(),7,DATEADD(day,7,GETDATE()),1,GETDATE());

-- Transactions.Fines
INSERT INTO Transactions.Fines(FineCode,FineOnBookID,FineOnMemberID,FineStartedDatetime,FineDiscription,FineTotalDays,FineAmount,FineOnBorrowID,createdBy,createdOn)
VALUES('F001',1,1,GETDATE(),'Late',3,150.00,1,1,GETDATE()),
      ('F002',2,2,GETDATE(),'Damaged',2,200.00,2,1,GETDATE());

-- Transactions.FinePayments
INSERT INTO Transactions.FinePayments(FineID,MemberID,PaymentAmount,PaymentDate,PaymentMethod,Remarks,createdBy,createdOn)
VALUES(1,1,150.00,GETDATE(),'Cash','Cleared',1,GETDATE()),
      (2,2,200.00,GETDATE(),'UPI','Done',1,GETDATE());

-- Catalog.bookShelves
INSERT INTO Catalog.bookShelves(bookID,shelveID,sectionID,createdBy,createdOn)
VALUES(1,1,1,1,GETDATE()),
      (2,2,2,1,GETDATE());

GO
