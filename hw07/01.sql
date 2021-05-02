select name, orders.id from users 
join 
orders 
on (orders.user_id = users.id);