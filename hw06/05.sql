select 
	concat(first_name, ' ', last_name) as full_name,
		(select count(*) from likes where likes.user_id = users.id) + 
		(select count(*) from media where media.user_id = users.id) +
		(select count(*) from friendship where friendship.user_id = users.id) +
		(select count(*) from messages where messages.from_user_id = users.id) as activity
			from users
			order by activity
			limit 10;