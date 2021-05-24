use shop;
desc users;

CREATE TABLE temp_table (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Имя покупателя',
  birthday_at DATE COMMENT 'Дата рождения',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Покупатели';

drop table temp_table; 

TRUNCATE TABLE temp_table;

INSERT INTO temp_table (name, birthday_at) VALUES
  ('Mark', '1990-10-05'),
  ('Kate', '1984-11-12'),
  ('Alex', '1985-05-20'),
  ('Max', '1988-02-14'),
  ('Anatol', '1998-01-12'),
  ('Alice', '1992-08-29'),
  ('Sergey', '1994-03-17'),
  ('Polly', '1981-07-10'),
  ('Marina', '1988-06-12'),
  ('Anna', '1992-09-20');
 
 select * from temp_table;

 select * from users limit 20;
 
 INSERT INTO users (name, birthday_at)
 	select name, birthday_at from temp_table where name = 'Polly'; 

 select name, birthday_at from temp_table where name = 'Polly';

INSERT INTO users (name, birthday_at)
 	select t1.name, t2.birthday_at from
 		temp_table as t1,
 		temp_table as t2,
 		temp_table as t3,
 		temp_table as t4,
 		temp_table as t5,
 		temp_table as t6; 


SELECT
  COUNT(*) from users;
  
  select * 
FROM
  temp_table AS fst,
  temp_table AS snd,
  temp_table AS thd,
  temp_table AS fth,
  temp_table AS fif,
  temp_table AS sth;

SELECT COUNT(*) FROM users;

SELECT * FROM users LIMIT 10;
