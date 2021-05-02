select products.name, catalogs.name 
from products join catalogs
on (products.catalog_id = catalogs.id);