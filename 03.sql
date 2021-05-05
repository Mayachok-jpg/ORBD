select concat(users.first_name, ' ', users.last_name) as full_name, count(distinct likes.id) + count(distinct media.id) + count(distinct messages.id) + count(distinct friendship.friend_id) as activity
	from users 
		left join likes 
		on users.id = likes.user_id
		left join media 
		on users.id = media.user_id
		left join messages 
		on users.id = messages.from_user_id
		left join friendship 
		on users.id = friendship.user_id
			group by users.id 
			order by activity
			limit 10; -- результат совпадает с результатом ДЗ 6 		

