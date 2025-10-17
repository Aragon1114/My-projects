DROP TABLE Menu CASCADE CONSTRAINT;
DROP TABLE Members CASCADE CONSTRAINT;
DROP TABLE Orders CASCADE CONSTRAINT;
DROP TABLE OrderDetails CASCADE CONSTRAINT;
DROP TABLE Employee CASCADE CONSTRAINT;
DROP TABLE Inventory CASCADE CONSTRAINT;
DROP TABLE Payment CASCADE CONSTRAINT;
DROP TABLE Reservation CASCADE CONSTRAINT;

-- Create Tables--

CREATE TABLE Menu (
    ItemCode VARCHAR(10) PRIMARY KEY,
    ItemName VARCHAR(50) NOT NULL,
    Description VARCHAR(255),
    Price DECIMAL(8, 2) CHECK (Price > 0),
    Category VARCHAR(20) NOT NULL
);

CREATE TABLE Members (
    MemberID INT NOT NULL PRIMARY KEY,
    Name VARCHAR (50) NOT NULL,
    ContactNo VARCHAR(15) NOT NULL,
    Email VARCHAR(50) UNIQUE,
    Address VARCHAR(255)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    MemberID INT,
    OrderDate DATE NOT NULL,
    OrderType VARCHAR (15) CHECK (OrderType IN ('Dine-In','Takeaway','Delivery')),
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);


CREATE TABLE OrderDetails (
    OrderID INT NOT NULL,
    ItemCode VARCHAR(10) NOT NULL,
    Quantity INT CHECK (Quantity >0),
    PRIMARY KEY (OrderID ,ItemCode),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ItemCode) REFERENCES Menu(ItemCode)
);

CREATE TABLE Employee (
    EmployeeID VARCHAR (4) PRIMARY KEY,
    EmployeeName VARCHAR (50) NOT NULL,
    Role VARCHAR (20) NOT NULL,
    ContactNo VARCHAR (20),
    ShiftSchedule VARCHAR (50)
);


CREATE TABLE Inventory (
    IngredientID NUMERIC (2) PRIMARY KEY,
    IngredientName VARCHAR (50) NOT NULL,
    QuantityAvailable INT CHECK (QuantityAvailable  >= 0),
    ReorderLevel INT NOT NULL
);

CREATE TABLE Payment(
    PaymentID INT PRIMARY KEY,
    OrderID INT NOT NULL,
    AmountPaid DECIMAL (10, 2) NOT NULL,
    PaymentMethod VARCHAR(20),
    PaymentDate DATE NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

CREATE TABLE Reservation (
    ReservationID INT NOT NULL PRIMARY KEY,
    ReservationTime VARCHAR(8) NOT NULL, 
    ReservationDate DATE NOT NULL,
    TableNo INT NOT NULL,
    MemberID INT NOT NULL,
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);

--Green Goblin Menu--

INSERT INTO Menu VALUES ('A001','Rice', 'Thai Fried Rice', 12.50, 'Main Course' );
INSERT INTO Menu VALUES ('A002','Japanese', 'Karē', 16.66, 'Main Course' );
INSERT INTO Menu VALUES ('A003','Rice', 'Shrimp Fried Rice ', 15.99, 'Main Course' );
INSERT INTO Menu VALUES ('A004','Bubble Tea', 'Cold Tea', 5.80, 'Beverage' );
INSERT INTO Menu VALUES ('A005','Wontons', 'Crispy Fried Wontons', 11.30, 'Main Course' );
INSERT INTO Menu VALUES ('A006','Sprite', 'Soft Drink', 3.55, 'Beverage' );
INSERT INTO Menu VALUES ('A007','Skewers', 'Teriyaki Chicken Skewers', 10.12, 'Appetizer' );
INSERT INTO Menu VALUES ('A008','Rice', 'Yang Chow Fried Rice', 13.38, 'Main Course' );
INSERT INTO Menu VALUES ('A009','Green Tea', 'Hot Tea', 8.50, 'Beverage' );
INSERT INTO Menu VALUES ('A010','Ipoh White Coffee', 'Hot Coffee', 5.67, 'Beverage' );
INSERT INTO Menu VALUES ('A011','Chocolate Fudge Mooncakes', 'Chocolate Fudge Mooncakes', 7.70, 'Beverage' );


--Customer Table--

INSERT INTO Members VALUES (1, 'Nick' , '012-3456789','nick@gmail.com','Sksyen 14 Subang');
INSERT INTO Members VALUES (2, 'Mark Lawson' , '016-9876543','MarkLawson@gmail.com','12, Jalan Ampang, KL');
INSERT INTO Members VALUES (3, 'Oren Chandler' , '017-1234567','OrenChandler@gmail.com','5, Lorong Mahkota 1, JB');
INSERT INTO Members VALUES (4, 'Nancy Klein' , '018-7654321','NancyKlein@gmail.com','9, Lebuh Chulia, PG');
INSERT INTO Members VALUES (5, 'Dante Colon' , '011-23456789','DanteColon@gmail.com','45, Jalan Sultan Idris, IP');
INSERT INTO Members VALUES (6, 'Wilbert Maxwell' , '014-8765432','WilbertMaxwell@gmail.com','32, Jalan Sultan Zainal Abidin, KT');
INSERT INTO Members VALUES (7, 'Pearlie Sawyer' , '019-5678901','PearlieSawyer@gmail.com','21, Jalan Tanjung Aru, KK');
INSERT INTO Members VALUES (8, 'Roberta Elliott' , '013-6789012','RobertaElliott@gmail.com','7, Lorong Putra, AL');
INSERT INTO Members VALUES (9, 'Sondra Savage' , '010-4567890','SondraSavage@gmail.com','18, Jalan Dato Bandar, SB');
INSERT INTO Members VALUES (10, 'Sterling Bolton' , '012-9896832','SterlingBolton@gmail.com','10, Jalan Bukit Bintang, KL');


--Order Table--

INSERT INTO Orders VALUES (1, 1, TO_DATE('2024-12-01', 'YYYY-MM-DD'), 'Dine-In', 46.26);
INSERT INTO Orders VALUES (2, NULL, TO_DATE('2024-12-02', 'YYYY-MM-DD'), 'Delivery', 51.04);
INSERT INTO Orders VALUES (3, NULL, TO_DATE('2024-12-03', 'YYYY-MM-DD'), 'Takeaway', 15.92);
INSERT INTO Orders VALUES (4, 2, TO_DATE('2024-12-04', 'YYYY-MM-DD'), 'Dine-In', 19.04);
INSERT INTO Orders VALUES (5, 5, TO_DATE('2024-12-05', 'YYYY-MM-DD'), 'Delivery', 32.56);
INSERT INTO Orders VALUES (6, 10, TO_DATE('2024-12-06', 'YYYY-MM-DD'), 'Delivery', 30.84);
INSERT INTO Orders VALUES (7, 6, TO_DATE('2024-12-07', 'YYYY-MM-DD'), 'Takeaway', 34.50);
INSERT INTO Orders VALUES (8, 4, TO_DATE('2024-12-08', 'YYYY-MM-DD'), 'Dine-In', 59.13);
INSERT INTO Orders VALUES (9, NULL, TO_DATE('2024-12-07', 'YYYY-MM-DD'), 'Dine-In', 30.03);
INSERT INTO Orders VALUES (10, 8, TO_DATE('2024-12-08', 'YYYY-MM-DD'), 'Delivery', 17.10);


--OrderDetails Table--

INSERT INTO OrderDetails VALUES (1, 'A001', 1);
INSERT INTO OrderDetails VALUES (1, 'A002', 1);
INSERT INTO OrderDetails VALUES (1, 'A004', 1);
INSERT INTO OrderDetails VALUES (1, 'A005', 1);
INSERT INTO OrderDetails VALUES (2, 'A002', 1);
INSERT INTO OrderDetails VALUES (2, 'A001', 1);
INSERT INTO OrderDetails VALUES (2, 'A009', 1);
INSERT INTO OrderDetails VALUES (2, 'A008', 1);
INSERT INTO OrderDetails VALUES (3, 'A004', 1);
INSERT INTO OrderDetails VALUES (3, 'A007', 1);
INSERT INTO OrderDetails VALUES (4, 'A009', 2);
INSERT INTO OrderDetails VALUES (4, 'A010', 1);
INSERT INTO OrderDetails VALUES (5, 'A004', 1);
INSERT INTO OrderDetails VALUES (5, 'A008', 2);
INSERT INTO OrderDetails VALUES (6, 'A003', 1);
INSERT INTO OrderDetails VALUES (6, 'A005', 1);
INSERT INTO OrderDetails VALUES (6, 'A006', 1);
INSERT INTO OrderDetails VALUES (7, 'A001', 1);
INSERT INTO OrderDetails VALUES (7, 'A004', 1);
INSERT INTO OrderDetails VALUES (7, 'A009', 1);
INSERT INTO OrderDetails VALUES (7, 'A010', 1);
INSERT INTO OrderDetails VALUES (8, 'A003', 1);
INSERT INTO OrderDetails VALUES (8, 'A004', 2);
INSERT INTO OrderDetails VALUES (8, 'A005', 1);
INSERT INTO OrderDetails VALUES (8, 'A007', 2);
INSERT INTO OrderDetails VALUES (9, 'A002', 1);
INSERT INTO OrderDetails VALUES (9, 'A009', 1);
INSERT INTO OrderDetails VALUES (9, 'A010', 1);
INSERT INTO OrderDetails VALUES (10, 'A004', 1);
INSERT INTO OrderDetails VALUES (10, 'A005', 1);


--Employee Table--

INSERT INTO Employee VALUES ('1', 'Juliet ','Chef','5556783526', 'Night');
INSERT INTO Employee VALUES ('2', 'Smith', 'Chef', '5374628122', 'Morning');
INSERT INTO Employee VALUES ('3', 'Kennedy','Waiter','5670902346', 'Evening');
INSERT INTO Employee VALUES ('4', 'David', 'Chef', '5906843015', 'Morning');
INSERT INTO Employee VALUES ('5', 'Dennis','Casher','5109756789', 'Evening');
INSERT INTO Employee VALUES ('6', 'Jaylan', 'Dishwasher', '5789001356', 'Morning');
INSERT INTO Employee VALUES ('7', 'Xander', 'Dishwasher', '5098563471', 'Morning');
INSERT INTO Employee VALUES ('8', 'Juan ','Chef','5789023415', 'Evening');
INSERT INTO Employee VALUES ('9', 'Jaron ','Diswasher','5678920178', 'Night');
INSERT INTO Employee VALUES ('10', 'Kane', 'Waiter', '5778245613', 'Morning');
INSERT INTO Employee VALUES ('11', 'Yazmin','Chef','5980477791', 'Evening');
INSERT INTO Employee VALUES ('12', 'Laura', 'Casher', '5543268910', 'Morning');
INSERT INTO Employee VALUES ('13', 'Cesar ','Chef','5009856235', 'Night');
INSERT INTO Employee VALUES ('14', 'Bianca','Waiter','5002456781', 'Morning');
INSERT INTO Employee VALUES ('15', 'Rey ','Diswasher','5990005362', 'Night');
INSERT INTO Employee VALUES ('16', 'Connor','Waiter','5987634164', 'Evening');
INSERT INTO Employee VALUES ('17', 'Mckenna','Waiter','5113567891', 'Night');
INSERT INTO Employee VALUES ('18', 'Rocco ','Chef','5127890185', 'Evening');
INSERT INTO Employee VALUES ('19', 'Simeon', 'Dishwasher', '5779908376', 'Evening');
INSERT INTO Employee VALUES ('20', 'Malia','Diswasher','5366789017', 'Evening');
INSERT INTO Employee VALUES ('21', 'Wilson','Manager','5670902346', 'Morning');
INSERT INTO Employee VALUES ('22', 'Felipe ','Waiter','5097564621', 'Night');
INSERT INTO Employee VALUES ('23', 'Khadija', 'Chef', '555123456', 'Morning');
INSERT INTO Employee VALUES ('24', 'Carmen  ','Chef','5223416788', 'Night');
INSERT INTO Employee VALUES ('25', 'Ariana ','Casher','5991725398', 'Morning');
INSERT INTO Employee VALUES ('26', 'Gabriella ','Manager','5376287300', 'Morning');
INSERT INTO Employee VALUES ('27', 'Zink ','Supervisor','5987857632', 'Night');
INSERT INTO Employee VALUES ('28', 'Karthik', 'Delivery man', '8674635462', 'All day');
INSERT INTO Employee VALUES ('29', 'Mark', 'Delivery man', '192095847', 'All day');



--Inventory Table--

INSERT INTO Inventory VALUES (1, 'Buns', 50, 20);
INSERT INTO Inventory VALUES (2, 'Cheese', 30, 10);
INSERT INTO Inventory VALUES (3, 'Rice', 100, 50);
INSERT INTO Inventory VALUES (4, 'Shrimp', 25, 10);
INSERT INTO Inventory VALUES (5, 'Tea Leaves', 40, 15);
INSERT INTO Inventory VALUES (6, 'Chicken', 60, 20);
INSERT INTO Inventory VALUES (7, 'Wontons', 50, 15);
INSERT INTO Inventory VALUES (8, 'Vegetables', 80, 30);
INSERT INTO Inventory VALUES (9, 'Mooncake Mix', 30, 10);
INSERT INTO Inventory VALUES (10, 'Soft Drink Syrup', 20, 5);

--Payment Data--

INSERT INTO Payment VALUES (1, 1, 46.26, 'Credit Card', TO_DATE('2024-12-01', 'YYYY-MM-DD'));
INSERT INTO Payment VALUES (2, 2, 51.04, 'Cash', TO_DATE('2024-12-02', 'YYYY-MM-DD'));
INSERT INTO Payment VALUES (3, 3, 15.92, 'Credit Card', TO_DATE('2024-12-03', 'YYYY-MM-DD'));
INSERT INTO Payment VALUES (4, 4, 19.04, 'Debit Card', TO_DATE('2024-12-04', 'YYYY-MM-DD'));
INSERT INTO Payment VALUES (5, 5, 32.56, 'Cash', TO_DATE('2024-12-05', 'YYYY-MM-DD'));
INSERT INTO Payment VALUES (6, 6, 30.84, 'Credit Card', TO_DATE('2024-12-06', 'YYYY-MM-DD'));
INSERT INTO Payment VALUES (7, 7, 34.50, 'Debit Card', TO_DATE('2024-12-07', 'YYYY-MM-DD'));
INSERT INTO Payment VALUES (8, 8, 59.13, 'Cash', TO_DATE('2024-12-08', 'YYYY-MM-DD'));
INSERT INTO Payment VALUES (9, 9, 30.03, 'Credit Card', TO_DATE('2024-12-09', 'YYYY-MM-DD'));
INSERT INTO Payment VALUES (10, 10, 17.10, 'Cash', TO_DATE('2024-12-10', 'YYYY-MM-DD'));

--Reservation Data--

INSERT INTO Reservation VALUES (1, '18:30', TO_DATE('2024-12-11', 'YYYY-MM-DD'), 5, 1);
INSERT INTO Reservation VALUES (2, '12:30', TO_DATE('2024-12-13', 'YYYY-MM-DD'), 2, 6);
INSERT INTO Reservation VALUES (3, '17:30', TO_DATE('2024-12-18', 'YYYY-MM-DD'), 1, 2);

--a) Find all members and their corresponding orders, including members who have not placed any orders --
SELECT m.MemberID, m.Name AS MemberName, o.OrderID, o.OrderDate, o.TotalAmount
FROM Members m
LEFT OUTER JOIN Orders o ON m.MemberID = o.MemberID;


--b) Check the order history of each member --
SELECT m.MemberID, m.Name, Me.ItemName
FROM members m
JOIN Orders o ON o.MemberID = m.MemberID
JOIN OrderDetails OD ON OD.OrderID = o.OrderID
JOIN Menu Me ON Me.ItemCode = OD.ItemCode
ORDER BY m.MemberID ASC;

--c)Retrieve all orders where the customer's email contains "gmail" and the order was placed in December 2024 --
SELECT o.OrderID, m.Name AS MemberName, m.Email, o.OrderDate, o.TotalAmount
FROM Orders o
LEFT JOIN Members m ON o.MemberID = m.MemberID
WHERE m.Email LIKE '%gmail%' 
AND EXTRACT(MONTH FROM o.OrderDate) = 12 
AND EXTRACT(YEAR FROM o.OrderDate) = 2024;

--d) Find Orders for Dine-In or Delivery, with TotalAmount greater than 30 --
SELECT *
FROM Orders
WHERE (OrderType = 'Dine-In' OR OrderType = 'Delivery')
AND TotalAmount > 30;

--e) Retrieves the total quantity of items ordered by each member and includes only those members who have ordered more than 5 items in total --
SELECT m.MemberID, m.Name, TotalQuantity
FROM Members m
JOIN (
    SELECT o.MemberID, SUM(OD.Quantity) AS TotalQuantity
    FROM Orders o
    JOIN OrderDetails OD ON o.OrderID = OD.OrderID
    GROUP BY o.MemberID
) MemberOrderTotals ON m.MemberID = MemberOrderTotals.MemberID
WHERE TotalQuantity > 5;
