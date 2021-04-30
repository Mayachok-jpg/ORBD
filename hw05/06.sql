select * from users; 
select avg(timestampdiff(year, birthday_at, now())) as age from users;