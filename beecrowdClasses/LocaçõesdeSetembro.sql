select customers.name, rentals.rentals_date
from customers
join rentals on rentals.id_customers = customers.id
where rentals.rentals_date between '2016-09-01' and '2016-09-30';
