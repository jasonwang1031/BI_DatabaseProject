Create Database ToyotaDealershipDb
Go
Use ToyotaDealershipDb
Go

Create Table Dealer(
DealerID bigint,
DealerName varchar(50),
GeneralManagerName varchar(50),
PhoneNumber bigint,
EmailAddress varchar(50),
Primary Key (DealerID)
);

Create Table Inventory(
InventoryID bigint,
StockNumber bigint,
VIN bigint,
Make varchar(50),
Model varchar(50),
Costs bigint,
Primary Key(InventoryID)
);

Create Table Customer(
CustomerID bigint Primary Key,
LastName varchar(50),
FirstName varchar(50),
PhoneNumber bigint,
State varchar(50),
ZipCode bigint); 

Create Table SalesInvoices(
InvoiceID bigint Primary Key,
DateofSales date,
SellingPrice bigint,
TradeinValue bigint,
BalanceDue bigint,
DealerID bigint, 
InventoryID bigint,
CustomerID bigint,
Foreign Key (DealerID) References Dealer(DealerID),
Foreign Key (InventoryID) References Inventory(InventoryID),
Foreign Key (CustomerID) References Customer(CustomerID)
); 

Create Table ServiceRecord(
ServiceRecordID bigint Not Null Primary Key, 
TechnicianID bigint Not Null Foreign Key References Technician(TechnicianID),
ServiceType varchar(50) Not Null,
Costs bigint Not Null,
InventoryID bigint Not Null Foreign Key References Inventory(InventoryID),
CustomerID bigint Not Null Foreign Key References Customer(CustomerID)
);

Create Table Technician(
TechnicianID bigint Primary Key,
FirstName varchar(50),
LastName varchar(50),
Position varchar(50));




INSERT INTO [dbo].[Dealer] ([DealerID], [DealerName], [GeneralManagerName], [PhoneNumber], [EmailAddress]) 
VALUES (1, N'Peter Smith', N'Jenny Green', 6178000000, N'pm@dealer.com')

INSERT INTO [dbo].[Dealer] ([DealerID], [DealerName], [GeneralManagerName], [PhoneNumber], [EmailAddress]) 
VALUES (2, N'Richard White', N'Jenny Green', 6178000001, N'rw@dealer.com')

INSERT INTO [dbo].[Dealer] ([DealerID], [DealerName], [GeneralManagerName], [PhoneNumber], [EmailAddress]) 
VALUES (3, N'Smith Wang', N'Jenny Green', 6178000002, N'sw@dealer.com')

INSERT INTO [dbo].[Dealer] ([DealerID], [DealerName], [GeneralManagerName], [PhoneNumber], [EmailAddress]) 
VALUES (4, N'Kobe Jones', N'Jenny Green', 6178000003, N'kj@dealer.com')

INSERT INTO [dbo].[Dealer] ([DealerID], [DealerName], [GeneralManagerName], [PhoneNumber], [EmailAddress]) 
VALUES (5, N'Kidd Smith', N'Jenny Green', 6178000004, N'ks@dealer.com')

INSERT INTO [dbo].[Dealer] ([DealerID], [DealerName], [GeneralManagerName], [PhoneNumber], [EmailAddress]) 
VALUES (6, N'Kevin Wilson', N'Jenny Green', 6178000005, N'kw@dealer.com')

INSERT INTO [dbo].[Dealer] ([DealerID], [DealerName], [GeneralManagerName], [PhoneNumber], [EmailAddress]) 
VALUES (7, N'Jane Zhang', N'Jenny Green', 6178000006, N'jz@dealer.com')

INSERT INTO [dbo].[Dealer] ([DealerID], [DealerName], [GeneralManagerName], [PhoneNumber], [EmailAddress]) 
VALUES (8, N'Paula Evans', N'Jason Wang', 6178000007, N'pe@dealer.com')

INSERT INTO [dbo].[Dealer] ([DealerID], [DealerName], [GeneralManagerName], [PhoneNumber], [EmailAddress]) 
VALUES (9, N'Jack Edwards', N'Jason Wang', 6178000008, N'pm@dealer.com')

INSERT INTO [dbo].[Dealer] ([DealerID], [DealerName], [GeneralManagerName], [PhoneNumber], [EmailAddress]) 
VALUES (10, N'Jordan Young', N'Jason Wang', 6178000009, N'jy@dealer.com')

INSERT INTO Inventory (InventoryID, StockNumber,VIN, Make, Model,Costs) VALUES
(1, 543, 1111111111111, 'Toyota', 'Camry', 20000),
(2, 544, 2222222222222, 'Toyota', 'Corolla', 18000),
(3, 545, 3333333333333, 'Toyota', 'Camry', 22000),
(4, 546, 4444444444444, 'Toyota', 'RAV4', 15000),
(5, 547, 5555555555555, 'Toyota', 'RAV4', 17000),
(6, 548, 6666666666666, 'Toyota', 'RAV4', 19000),
(7, 650, 7777777777777, 'Lexus', 'RX300',43000),
(8, 651, 8888888888888, 'Lexus', 'RX450',45000),
(9, 652, 9999999999999, 'Lexus', 'NX200T',39000),
(10, 653, 0000000000000, 'Lexus', 'NX300H',43000);

Insert INTO Customer(CustomerID, FirstName, LastName, PhoneNumber, State, ZipCode) VALUES
(1, 'Mike', 'Stewart', 5705705757, 'MA', 02477),
(2, 'Jason', 'Lee', 5705705758, 'MA', 02482),
(3, 'Clark', 'Jiang', 5705705759, 'MA', 02483),
(4, 'Waiter', 'Parker', 5705705760, 'MA', 02115),
(5, 'Scott', 'Mitchel', 5705705761, 'MA', 02117),
(6, 'Peter', 'Davies', 5705705762, 'MA', 02467),
(7, 'Max', 'Ward', 5705705763, 'NY', 01050),
(8, 'Matt', 'Steven', 5705705764, 'LA', 43566),
(9, 'Jackson', 'Watson', 57057057565, 'MA', 02477),
(10, 'Mike', 'Cooper', 5705705766, 'MA', 02477);

Insert INTO SalesInvoices(InvoiceId, DateofSales, SellingPrice, TradeinValue, BalanceDue, DealerID, InventoryID, CustomerID) VALUES 
(1, '2016-01-05', 30000, 0, 0, 3, 1, 2),
(2, '2016-3-5', 25000, 0,0,3,2,1),
(3, '2015-4-22', 55000, 0, 0, 1, 10, 6),
(4, '2016-11-11', 67000, 45000, 0, 1, 8, 6),
(5, '2016-6-13', 32000, 0, 0, 1, 3, 3),
(6, '2016-7-25', 52000, 0, 0, 9, 9, 9),
(7, '2017-3-14', 22000, 0, 21000, 1, 4, 4),
(8, '2015-12-27', 28000, 0, 0, 2, 5, 5),
(9, '2016-10-31', 31000, 0, 0, 2, 6, 7),
(10, '2016-2-14', 32000, 0, 0, 9, 7, 8);

Insert INTO ServiceRecord(ServiceRecordID, TechnicianID, ServiceType, Costs, InventoryID, CustomerID) VALUES 
(1, 6, 'Maintenance', 500, 1,2),
(2, 6, 'Maintenance', 300, 2,1),
(3, 9, 'Maintenance', 800, 10,6),
(4, 7, 'Maintenance', 500, 6,7),
(5, 8, 'Maintenance', 900, 8,6),
(6, 1, 'Repair', 3300, 4,4),
(7, 1, 'Repair', 1700, 9,9),
(8, 3, 'Repair', 700, 3,3),
(9, 1, 'Repair', 2200, 1,2),
(10,7, 'Maintenance', 500, 7,8),
(11, 2, 'Repair', 2200, 1,2),
(12, 2, 'Repair', 1400, 6,7),
(13, 4, 'Maintenance', 400, 1,2),
(14, 4, 'Repair', 2200, 6,7),
(15, 10, 'Maintenanice', 400, 8,6);

Insert INTO Technician(TechnicianID, FirstName, LastName, Position)VALUES
(1, 'Jackson', 'Trump', 'Technician Manager'),
(2, 'Stefanie', 'Smith', 'Repair Technician'), 
(3, 'Potter', 'Harry', 'Repair Technician'), 
(4, 'Smith', 'King', 'Repair Technician'), 
(5, 'John', 'Snow', 'Repair Technician'), 
(6, 'Sandy', 'Gray', 'Maintenance Technician'),
(7, 'Jackson', 'Green', 'Maintenance Technician'),
(8, 'Rogers', 'Cook', 'Maintenance Technician'),
(9, 'Turner', 'Lee', 'Maintenance Technician'),
(10, 'John', 'Davies', 'Maintenance Manager');
