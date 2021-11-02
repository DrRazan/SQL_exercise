/* SQL Exercise
====================================================================
We will be working with database northwind.db we have set up and connected to in the activity Connect to Remote PostgreSQL Database earlier.


-- MAKE YOURSELF FAIMLIAR WITH THE DATABASE AND TABLES HERE



--==================================================================
/* TASK I
-- Q1. Write a query to get Product name and quantity/unit.
*/


/* TASK II
Q2. Write a query to get most expense and least expensive Product list (name and unit price)
*/
SELECT productname,unitprice  FROM Products ORDER BY unitprice ASC
  LIMIT 1;
  SELECT productname,unitprice  FROM Products ORDER BY unitprice DESC
  LIMIT 1;
/* TASK III
Q3. Write a query to count current and discontinued products.
*/
SELECT count(current_user)  FROM Products Group BY discontinued

/* TASK IV
Q4. Select all product names and their category names (77 rows)
*/
SELECT ProductName,categoryid FROM Products 

/* TASK V
Q5. Select all product names, unit price and the supplier region that don't have suppliers from USA region. (26 rows)
*/
select
       productname,
       unitprice
from products
join suppliers s on products.supplierid = s.supplierid
where not country like 'USA'

/* TASK VI
Q6. Get the total quantity of orders sold.( 51317)
*/
select SUM(quantity)  from ORDER_DETAILS

/* TASK VII
Q7. Get the total quantity of orders sold for each order.(830 rows)
*/
SELECT orderid, 
    SUM(UnitPrice * Quantity * (1 - Discount)) as Subtotal
FROM order_details
GROUP BY orderid
ORDER BY orderid;

/* TASK VIII
Q8. Get the number of employees who have been working more than 5 year in the company. (9 rows)
*/
SELECT firstname FROM employees WHERE (CURRENT_DATE,hiredate)  > 5
