select * from users;
select 
	date_format(date(concat_ws('-', year(now()), month(birthday_at), day(birthday_at))), '%W') as day,
count(*) as total
from users
group by day order by total desc;