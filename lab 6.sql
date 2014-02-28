--Name : Rakesh Nandigama 
--CWID : 200 54 070
--Date : 02/26/2014


--1. Get the name and the city of customers who live in a city where the most number of products are made

select name,city 
from customers 
where city in ( select city from Products
                group by city
                order by count(quantity) desc limit 1);


--2. Get the name and city of customers who live in any city where the most number of products are made

select name,city 
from customers 
where city in ( select city from products 
                group by city 
                order by count(quantity) desc limit 1);


--3. list the products whose priceusd is above the average priceusd

select * 
from Products
where priceusd > ( select avg(priceusd) 
                   from products );


--4. Show the customer name, pid ordered, and the dollars for all customer orders, sorted by dollars from high to low

select c.name, o.pid, o.dollars
from orders o, customers c
where o.cid = c.cid
order by dollars desc ;


--5. Show all customer names (in order) and their total ordered, and nothing more. Use coalesce to avoid showing NULLs. 

select c.name, coalesce(sum(o.qty),0) as "total products " 
from customers c
left outer join orders o
on c.cid = o.cid
group by c.name
order by c.name ;

