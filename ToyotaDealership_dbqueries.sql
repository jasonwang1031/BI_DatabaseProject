Use ToyotaDealershipDb

/*ToyotaDealer Group: Beong Jo Kang, Yuxuan Wang, Chris Lowry */

/*show every observation of each table*/

select * from Customer;

select * from Dealer;

select * from Inventory;

select * from SalesInvoices;

select * from ServiceRecord;

select * from Technician;

/* Show the total Sale of each year (use aggregate function)*/

Select YEAR(DateofSales) as Year, sum(SellingPrice) as Total_Sales_Amount, count(InvoiceID) as Total_Number_of_Sales from SalesInvoices
group by YEAR(DateofSales);

/*show the total sales of each dealer who sold at least one car (inner join) */

SELECT d.DealerName, sum(s.SellingPrice) as Total_Sales from Dealer d join 
SalesInvoices s on d.DealerID = s.DealerID
group by DealerName;

/* show the total service times and price of each technician. We want to use left join because we want to know which technician has not finished any service yet*/

Select t. TechnicianID, t.FirstName, t.LastName, sum(s.Costs) as Total_Price,count(s.ServiceRecordID) as Total_Service from Technician t left join 
ServiceRecord s on t.TechnicianID = s.TechnicianID
group by t.TechnicianID, FirstName, LastName
order by sum(Costs) desc;

/*Show the Make, Model, Selling Price, Inventory ID for each sale where the selling price is higher than the average costs, order by price (subquery) */
Select i.make, i.model, i.InventoryID, s.SellingPrice from Inventory i join SalesInvoices s on
i.InventoryID = s.InventoryID
where s.SellingPrice > (select avg(costs) from Inventory)
order by SellingPrice desc;





