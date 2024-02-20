-- Caroline Richards
-- ITP 249
-- HW 5

USE salesco;

-- 1. List all vendors.
Select DISTINCT V_NAME
from VENDOR;

-- 2. List customers who do not have a middle initial.
Select CUS_LNAME, CUS_FNAME, CUS_INITIAL
from CUSTOMER
Where CUS_INITIAL is NULL;

-- 3. List products from newest to oldest.
Select P_CODE, P_INDATE
from PRODUCT
Order By P_INDATE DESC;

-- 4. List the product code, description, and quantity on hands that are cloth.
Select P_CODE, P_DESCRIPT, P_QOH
from PRODUCT
Where P_DESCRIPT LIKE '%cloth%';

-- 5. List vendors who are in the area code 901.
Select * 
from VENDOR 
Where V_AREACODE = '901';

-- 6. Count the number of vendors.
Select count(DISTINCT V_CODE) AS NumOfVendors
from VENDOR;

-- 7. Count the number of customers.
Select count(DISTINCT CUS_CODE) AS NumOfCustomers
from CUSTOMER;

-- 8. What is the average customer account balance?
Select round(avg(CUS_BALANCE),2) as AverageCustomerBalance
from CUSTOMER;

-- 9. What is the total value of assets in the inventory after applying discounts (percentage)?
Select round(sum((P_QOH*(P_PRICE*(1-P_DISCOUNT)))),2) AS TotalAssetValueWDiscounts
from PRODUCT;

-- 10. What is the average amount (revenue) of invoices? 
Select round(SUM(LINE_UNITS*LINE_PRICE)/count(DISTINCT INV_NUMBER),2) AS InvoiceAvgRev
from LINE;

-- 11. List the sales revenue (in descending order) by product. Include the product code.
Select P_Code, round(sum(LINE_UNITS*LINE_PRICE),2) AS SalesRevenue
from LINE
Group By P_Code
Order By SalesRevenue DESC;

-- 12. List invoice totals in ascending order. Include the invoice number. 
-- The list should be ordered to make the most sense to you.
Select INV_NUMBER, round(sum(LINE_UNITS*LINE_PRICE),2) AS InvoiceTotal
from LINE
Group By INV_NUMBER
Order by InvoiceTotal ASC;

-- 13. List invoice totals in descending order of invoice number 
-- only if the total is larger or equal to 150.
Select INV_NUMBER, round(sum(LINE_UNITS*LINE_PRICE),2) AS InvoiceTotal
from LINE
Group By INV_NUMBER
Having InvoiceTotal >= 150
Order by INV_NUMBER DESC;

-- 14. List the number of customers per area code. Include the area code.
Select DISTINCT CUS_AREACODE as AreaCode, count(CUS_CODE) as NumOfCustomers
from CUSTOMER
Group By CUS_AREACODE;

-- 15. List the date with the highest number of orders. Hint:  You may use LIMIT. 
Select INV_DATE, count(INV_NUMBER) as NumofInvoices
from INVOICE
Group By INV_DATE
Order By NumofInvoices DESC
Limit 1;
