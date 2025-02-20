select products.name
from products
join providers on providers.id = products.id_providers
where products.amount >= 10 and products.amount <=20 and providers.name like 'P%';
