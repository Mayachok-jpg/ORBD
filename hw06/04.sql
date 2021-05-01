select sum(total_likes) from
	(select 
		(select count(*) from likes where target_id = profiles.user_id and target_type = 'users') as total_likes
		from profiles order by birthday desc limit 10) as uset_likes;
