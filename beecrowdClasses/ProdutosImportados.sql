select products.name, providers.name, categories.name
from products
join providers on providers.id = products.id_providers
join categories on categories.id = products.id_categories
where providers.name = 'Sansul SA' and categories.name = 'Imported';
