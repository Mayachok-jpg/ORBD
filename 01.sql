use vk;

select * from likes limit 10;

select profiles.gender, count(likes.id) as sum_likes
from 
likes join users
on likes.user_id = users.id 
join profiles on profiles.user_id = users.id
group by profiles.gender
order by sum_likes DESC
limit 1; 

-- проверила по запросу к заданию шесть Ч цифры те же ) 
