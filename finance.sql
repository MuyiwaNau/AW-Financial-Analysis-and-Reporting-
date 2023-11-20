
-- Count Gender
SELECT Gender, COUNT(Gender) AS GenderCount FROM CUSTOMER GROUP BY Gender;

SELECT Gender, COUNT(*) AS TotalOrders
FROM Customer
WHERE Gender IN ('M', 'F')
GROUP BY Gender;

---  Count HomeOwner
Select Homeowner, count(Homeowner) as HomeOwnerCount from customer group by Homeowner

---- Count AnnualIncome	
SELECT 
    CASE 
        WHEN AnnualIncome BETWEEN 50000 AND 89999 THEN 'Average'
        WHEN AnnualIncome >= 90000 THEN 'High'
        ELSE 'Low'
    END AS IncomeCategory,
    COUNT(*) AS TotalCount
FROM Customer
GROUP BY IncomeCategory
ORDER BY IncomeCategory;


--- Top 5 Product Names and their Total_Sales
select p.productname, count(s.ordernumber) as total_sales from products p
Inner Join sales_2017 s on p.productkey = s.productkey
Group by productname
Order by total_sales DESC
limit 5;

-- Top 5 return Product and the Product Names
select p.productname, count(pr.returnquantity) as total_returns from products p
Inner join productreturns pr on
p.productkey = pr.productkey
Group by productname
order by total_returns desc
limit 5;


--- Total Orders by Product categories.

SELECT pc.productcategorykey, COUNT(s.ordernumber) AS total_orders 
FROM products p
LEFT JOIN product_subcategories pc ON p.productsubcategorykey = pc.productsubcategorykey
LEFT JOIN sales_2017 s ON s.productkey = p.productkey
GROUP BY pc.productcategorykey
ORDER BY total_orders DESC;


--- Totals orders by region 2017 and 2016

select a.continent, count(s.ordernumber) as total_orders
from territories a
left join sales_2017 s on a.salesterritorykey = s.territorykey
group by a.continent 
order by total_orders desc;

select a.continent, count(s.ordernumber) as total_orders
from territories a
left join sales_2016 s on a.salesterritorykey = s.territorykey
group by a.continent 
order by total_orders desc;


--- Top 10 selling products 2017 and 2016

select p.productname, p.productkey, count(s.orderquantity) as Total_orders
from products p
left join sales_2017 s on p.productkey = s.productkey
group by p.productname, p.productkey, s.orderquantity
order by total_orders desc
limit 10;

select p.productname, p.productkey, count(s.orderquantity) as Total_orders
from products p
left join sales_2016 s on p.productkey = s.productkey
group by p.productname, p.productkey, s.orderquantity
order by total_orders desc
limit 10;

--- Order quantity of products between April and Sepetember
select s.orderdate, p.productname, p.productkey, p.productprice, s.orderquantity from products p
Left join sales_2017 s on p.productkey = s.productkey
Where orderdate between '2017-04-01' and '2017-09-01'
Order by Orderdate, orderquantity desc;


---- Customers with the hightest amount of purchases in 2015, 2016, 2017
SELECT c.firstname, c.customerkey, COUNT(s.orderquantity) AS total_quantity
FROM customer c
LEFT JOIN sales_2015 s ON c.customerkey = s.customerkey
GROUP BY c.firstname, c.customerkey
ORDER BY total_quantity DESC
LIMIT 15;

SELECT c.firstname, c.customerkey, COUNT(s.orderquantity) AS total_quantity
FROM customer c
LEFT JOIN sales_2016 s ON c.customerkey = s.customerkey
GROUP BY c.firstname, c.customerkey
ORDER BY total_quantity DESC
LIMIT 15;

SELECT c.firstname, c.customerkey, COUNT(s.orderquantity) AS total_quantity
FROM customer c
LEFT JOIN sales_2017 s ON c.customerkey = s.customerkey
GROUP BY c.firstname, c.customerkey
ORDER BY total_quantity DESC
LIMIT 15;
