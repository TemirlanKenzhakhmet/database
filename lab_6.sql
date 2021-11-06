-- task 1
-- a
select dealer_id as id, dealer.name, location, charge, client.id, client.name, city, priority
from dealer join client on dealer.id = client.dealer_id;

-- b
select d.id, c.name, city, priority, s.id, date, amount
from dealer d join client c on d.id = c.dealer_id join sell s on c.id = s.client_id;

-- c
select d.name, c.name
from dealer d join client c on c.city = d.location;

-- d
select s.id, amount, name, city
from sell s join client c on s.client_id = c.id
where amount between 100 and 500;

-- e
select distinct d.name
from dealer d join client c on d.id = c.dealer_id;

-- f
select c.name, city, d.name, charge
from dealer d join client c on d.id = c.dealer_id;

-- g
select c.name, city, d.name, charge
from dealer d join client c on d.id = c.dealer_id
where charge > 0.12;

-- h
select c.name, city, s.id, date, amount, d.name, charge
from dealer d join client c on d.id = c.dealer_id join sell s on c.id = s.client_id;

-- i
select c.name, c.priority, d.name, s.id, amount
from dealer d join client c on d.id = c.dealer_id join sell s on c.id = s.client_id
where amount > 2000 and priority is not null;

-- task 2
-- a
create view unique_client as
    select date, count(distinct client_id), avg(amount), sum(amount)
    from sell
    group by date;
   
select * from unique_client;
drop view unique_client;

-- b
create view top as
    select date, sum(amount) as total
    from sell
    group by date
    order by total desc
    limit 5;

select * from top;
drop view top;

-- c
create view total_sales as
    select d.id, count(amount) as num_sales, avg(amount) as avg_sales, sum(amount) as tot_sales
    from sell join dealer d on dealer_id = d.id
    group by d.id;
    
select * from total_sales;
drop view total_sales;

-- d
create view dealers_charge as
    select d.id, tot_sales * d.charge as earned
    from total_sales, dealer d
    where total_sales.id = d.id;

select * from dealers_charge;
drop view dealers_charge;

-- e
create view total_sales_in_location as
    select location, count(amount) as num_sales, avg(amount) as avg_sales, sum(amount) as tot_sales
    from dealer d join sell on dealer_id = d.id
    group by location;

select * from total_sales_in_location;
drop view total_sales_in_location;

-- f
create view total_expenses_in_city as
    select city, count(amount) as num_sales, avg(amount) as avg_expenses, sum(amount) as tot_expenses
    from client join sell s on client.id = s.client_id
    group by city;
    
select * from total_expenses_in_city;
drop view total_expenses_in_city;

-- g
create view cities as
    select city
    from total_expenses_in_city full outer join total_sales_in_location on city = location
    where tot_expenses > tot_sales or tot_sales is null;
   
select * from cities;
drop view cities;
