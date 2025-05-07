-- Question 1
-- Create the original ProductDetail table (not normalized)
CREATE TABLE ProductDetail (OrderID INT, CustomerName VARCHAR(100), Products VARCHAR(255));
INSERT INTO ProductDetail (OrderID, CustomerName, Products) VALUES
(101, 'John Doe', 'Laptop, Mouse'),
(102, 'Jane Smith', 'Tablet, Keyboard, Mouse'),
(103, 'Emily Clark', 'Phone');

-- Create a new normalized table for 1NF
CREATE TABLE ProductDetail_1NF (OrderID INT, CustomerName VARCHAR(100), Product VARCHAR(100));
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product)
VALUES
(101, 'John Doe', 'Laptop'),
(101, 'John Doe', 'Mouse'),
(102, 'Jane Smith', 'Tablet'),
(102, 'Jane Smith', 'Keyboard'),
(102, 'Jane Smith', 'Mouse'),
(103, 'Emily Clark', 'Phone');


-- Question 2
-- Create the Original OrderDetails Table (Before 2NF)
CREATE TABLE OrderDetails (OrderID INT, CustomerName VARCHAR(100), Product VARCHAR(100), Quantity INT);
INSERT INTO OrderDetails (OrderID, CustomerName, Product, Quantity) VALUES
(101, 'John Doe', 'Laptop', 2),
(101, 'John Doe', 'Mouse', 1),
(102, 'Jane Smith', 'Tablet', 3),
(102, 'Jane Smith', 'Keyboard', 1),
(102, 'Jane Smith', 'Mouse', 2),
(103, 'Emily Clark', 'Phone', 1);

-- normalized table for 2NF
-- Create the Orders table with only OrderID and CustomerName
CREATE TABLE Orders (OrderID INT PRIMARY KEY, CustomerName VARCHAR(100));
INSERT INTO Orders (OrderID, CustomerName) VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');

-- Create the OrderItems table to store products and quantities
CREATE TABLE OrderItems (OrderID INT, Product VARCHAR(100), Quantity INT, FOREIGN KEY (OrderID) REFERENCES Orders(OrderID));
INSERT INTO OrderItems (OrderID, Product, Quantity)
VALUES
(101, 'Laptop', 2),
(101, 'Mouse', 1),
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2),
(103, 'Phone', 1);
