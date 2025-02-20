select customers.name
from customers
join legal_person on legal_person.id_customers = customers.id;
