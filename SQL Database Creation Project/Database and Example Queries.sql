

CREATE TABLE Promotion (
	PromotionID CHAR(3) NOT NULL,
	PromotionName VARCHAR(50) NOT NULL,
	PromotionDiscount DECIMAL(4,1) NOT NULL,
	Primary Key (PromotionID)
);

CREATE TABLE Category (
	CategoryID CHAR(5) NOT NULL,
	CategoryName VARCHAR(50) NOT NULL,
	CategoryDesc VARCHAR(200) NOT NULL,
	Primary Key (CategoryID)
);

CREATE TABLE Chocolate (
	ChocolateID CHAR(6) NOT NULL,
	ChocolateName VARCHAR(50) NOT NULL,
	ChocolateDesc VARCHAR(200) NOT NULL,
	ChocolatePrice DECIMAL (5, 2) NOT NULL,
	ChocolateWeight INT NOT NULL,
	CategoryID CHAR(5) NOT NULL,
	Primary Key (ChocolateID),
	Foreign Key (CategoryID) references Category(CategoryID)
);

CREATE TABLE Discount (
	PromotionID CHAR(3) NOT NULL,
	ChocolateID CHAR(6) NOT NULL,
	StartDate DATETIME NOT NULL,
	EndDate DATETIME NOT NULL,
	Primary Key (PromotionID, ChocolateID),
	Foreign Key (PromotionID) references Promotion (PromotionID),
	Foreign Key (ChocolateID) references Chocolate (ChocolateID)
);

CREATE TABLE Customer (
	CustomerID CHAR(6) NOT NULL,
	CustomerName VARCHAR(70) NOT NULL,
	CustomerEmail VARCHAR(100) NOT NULL,
	CustomerPhNum VARCHAR(32) NOT NULL,
	Primary Key (CustomerID)
);

CREATE TABLE Review (
	ReviewID CHAR(6) NOT NULL,
	ReviewRating DECIMAL (2,0) NOT NULL,
	ReviewComment VARCHAR(255) NOT NULL,
	ReviewDate DATETIME NOT NULL,
	CustomerID CHAR(6) NULL,
	ChocolateID CHAR(6) NOT NULL,
	primary Key (ReviewID),
	Foreign Key (CustomerID) references Customer (CustomerID),
	Foreign Key (ChocolateID) references Chocolate (ChocolateID)
);
-- Once successfully implemented, these insert statements should work.

INSERT INTO Promotion VALUES
	('P01', "Opening Sale", 50.0), 
	('P02', "Christmas Special", 25.0),   
	('P03', "Summer Sale", 30.0),    
	('P04', "Spring Discount", 45.0),    
	('P05', "Winter Sale", 30.0);

INSERT INTO Category VALUES
	('CAT01', "Ecuador Single Origin", "Cocoa beans from a single Ecuadorian source"),
    ('CAT02', "Milk Chocolate", "chocolate mixed with smooth milk"),
	('CAT03', "Dark Chocolate", "A strong and rich flavour"),
	('CAT04', "White Chocolate",  "A sweet version of milk chocolate"),
	('CAT05', "Ruby Chocolate", "a pink coloured chocolate with the taste of strawberries");
    
INSERT INTO Chocolate VALUES
	('CHOC13', "Dark Chocolate Tablet", "Small, bite sized dark chocolate tablets", 17.99, 80, 'CAT01'),
    ('CHOC14', "Milk Chocolate bar", "Large, mixed with creamy milk", 10.50, 90, 'CAT02'),
	('CHOC15', "White chocolate tablet", "Small, sweet chocolate infused with butter", 12.70, 70, 'CAT03'),
	('CHOC16', "Ruby Chocolate", "medium sized sweet flavoured pink chocolate", 8.50, 90, 'CAT04'),
	('CHOC17', "sea Salt Caramel", "Large, salty chocolate that tastes exactly like caramel", 15.75, 85, 'CAT05');

INSERT INTO Discount VALUES
	('P01', 'CHOC13', '2023-02-01 08:00:00', '2023-02-02 18:00:00'),
    ('P02', 'CHOC14', '2023-03-03 08:00:00', '2023-03-10 20:00:00'),
    ('P03', 'CHOC15', '2023-05-10 10:00:00', '2023-05-20 20:00:00'),
    ('P04', 'CHOC16', '2023-09-04 09:00:00', '2023-09-15 18:00:00'),   
	('P05', 'CHOC17', '2023-10-21 10:00:00', '2023-10-30 21:00:00');
    
INSERT INTO Customer VALUES
	('CUS145', "Jon Snow", "j.snow@notreal.com",  "90861923"),
    ('CUS148', "Tony Stark", "Tony.Stark@fake.com", "90765431"),
	('CUS150', "bruce Wayne", "Bruce.Wayne@notreal.com", "90743225"),    
	('CUS153', "James Bond", "j.Bond@fake.com", "90589451"),    
	('CUS157', "Steve Rogers", "S.Rogers@notreal.com", "90865433");
INSERT INTO Review VALUES
	('REV131', 8, "A delicious milk chocolate", '2023-02-02 13:22:54', 'CUS145','CHOC13'),
    ('REV132', 9, "Amazingly Sweet", '2023-01-03 10:20:00', 'CUS148', 'CHOC14'),
    ('REV133', 6,  "Very tasty but a little bit too sweet", '2023-03-04 08:00:00', 'CUS150', 'CHOC15'),
    ('REV134', 8, "The strawberry flavour is terrific", '2023-06-21 10:30:30', 'CUS153', 'CHOC16'),
    ('REV135', 7, "It is the perfect mix of sea salt and caramel", '2023-10-30 12:45:00', 'CUS157', 'CHOC17');
-- Please ensure you INSERT atleast 5 records for every table and add it below







-- Question-B
/* Explain in simple words what each query does and make sure you comment it
 */

-- An example of an answer to a Query

/* This query prints the names of all chocolates */

Select ChocolateName
from Chocolate;

-- Query 1: A query involving a single table with one condition. Insert your answer below
select ChocolatePrice
from Chocolate
Where ChocolatePrice = 10.50;


-- Query 2: A query involving a single table with two conditions, with one of the conditions that uses a wild card operator. Insert your answer below
select CustomerName
from Customer
Where CustomerName != 'bruce Wayne'
AND CustomerEmail Like "%T%";


-- Query 3: A query involving a join between at least two tables with an order by clause. Insert your answer below
select Review.reviewID, Customer.customerName, Review.ReviewRating
from Review
Inner Join Customer ON Review.CustomerID = Customer.CustomerID
Order By Review.ReviewRating;


-- Query 4: A query involving a single table with an aggregate and group by function. Insert your answer below
Select COUNT(PromotionID), PromotionName
From Promotion
Group By PromotionName;