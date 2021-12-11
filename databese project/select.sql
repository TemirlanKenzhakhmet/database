select name, ((pick_up_time - delivery_time) / 2) as AVG
from dealer d inner join warehouse w on d.id = w.dealer_id inner join for_sale on w.id = for_sale.warehouse_id
order by AVG desc limit 1;

select extract(month from pick_up_time) as Month, count(sale_id) as best
from for_sale fs inner join body_style bs on fs.model_id = bs.id
where name = 'Сonvertible'
group by Month
order by best desc limit 1;

select b.name as brand_name, count(sale_id) as top
from for_sale fs inner join model m on fs.model_id = m.id inner join brand b on m.brand_id = b.id
where extract(year from pick_up_time) = '2020'
group by brand_name
order by top desc limit 2;

select b.name as brand_name, sum(price * quantity) as top
from order_item inner join for_sale fs on order_item.vehicle_id = fs.model_id inner join body_style bs on bs.id = fs.model_id inner join model m on bs.model_id = m.id inner join brand b on m.brand_id = b.id
where extract(year from pick_up_time) = '2020'
group by brand_name
order by top desc limit 2;