-- All cusotmer information
select * from dbo.customers

-- Total number of customers
Select count(customer_code) as total_customers from dbo.customers

-- All transactions made in Chennai (market_code for Chennai is Mark001)
select * from dbo.transactions where market_code = 'Mark001'

-- Distinct products sold in Chennai
select distinct(product_code)
from dbo.transactions
where market_code = 'Mark001'

-- Products sold and quantity
select dp.product_code, count(dt.market_code) #_of_transactions
from dbo.transactions dt inner join dbo.products dp
on dt.product_code = dp.product_code
where dt.market_code = 'Mark001'
group by dp.product_code

-- All information on customers grouped by Real Store and Virtual Store
select customer_type,
case 
when customer_type = 'Brick & Mortar' THEN 'Real Store'
when customer_type = 'E-Commerce' THEN 'Virtual Store'
Else null
END as Type
from dbo.customers

-- Show all transactions in USD 

select currency, count(currency) TransactionInInUSD from dbo.transactions
where currency = 'USD'
group by currency

--	Show all transactions in 2020 
select *
from dbo.date dd inner join dbo.transactions dt
on dd.cy_date = dt.order_date
where dd.year = 2020

--	Show Total Revenue in 2020 in Chennai
select dt.customer_code,  sum(dt.sales_amount) TotalSales
from dbo.date dd inner join [dbo].[transactions] dt
on dd.cy_date = dt.order_date
where dd.year = 2020 AND market_code = 'Mark001'
group by customer_code