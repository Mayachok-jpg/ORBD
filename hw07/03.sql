CREATE TABLE flights (
  id SERIAL PRIMARY KEY,
  city_from VARCHAR(255),
  city_to VARCHAR(255)
) COMMENT = 'Рейсы';

CREATE TABLE cities (
  label VARCHAR(255),
  name VARCHAR(255)
) COMMENT = 'Города';

INSERT INTO flights
  (city_from, city_to)
VALUES
  ('moscow', 'omsk'),
  ('novgorod', 'kazan'),
  ('irkutsk', 'moscow'),
  ('omsk', 'irkutsk'),
  ('moscow', 'kazan');
  
 select * from flights;
 
INSERT INTO cities 
  (label, name)
VALUES
  ('moscow', 'Москва'),
  ('irkutsk', 'Иркутск'),
  ('novgorod', 'Новгород'),
  ('kazan', 'Казань'),
  ('omsk', 'Омск');
 
 SELECT * from cities;

select id, city_from.name, city_to.name FROM 
	flights 
	join 
	cities as city_from 
	on city_from = city_from.label
	join cities as city_to on city_to = city_to.label
order by id; 


	
 
 
