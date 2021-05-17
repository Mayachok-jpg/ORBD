create view product_catalog as select products.name as product, catalogs.name as cat from products 
left join catalogs 
on products.catalog_id = catalogs.id;

select * from product_catalog;