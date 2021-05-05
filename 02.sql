select sum(total_likes) from
	(select count(likes.id) as total_likes, profiles.birthday, profiles.user_id 
		from likes 
		right join profiles 
		on likes.target_id = profiles.user_id and target_type = 'users' 
		group by profiles.user_id 
		order by profiles.birthday desc 
		limit 10) as all_likes;
 
-- долго крутила, но совсем без вложенного запроса обойтись так и не удалось. Результат совпадает с тем, что показывает ДЗ 6

