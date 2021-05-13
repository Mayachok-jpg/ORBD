SELECT 
	DISTINCT communities.name, 
	(COUNT(communities_users.community_id) OVER()) / (SELECT COUNT(*) FROM communities) as average_users_in_group, -- среднее в группе
	FIRST_VALUE(CONCAT(users.first_name, ' ', users.last_name)) OVER (w_communities_users ORDER BY profiles.birthday DESC) AS min_age,
	FIRST_VALUE(CONCAT(users.first_name, ' ', users.last_name)) OVER (w_communities_users ORDER BY profiles.birthday) AS max_age,
	COUNT(communities_users.community_id) OVER w_communities_users AS users_in_group, -- пользователей в группе
	(SELECT COUNT(*) FROM users) AS users_in_vk, -- всего пользователей в системе
	COUNT(communities_users.community_id) OVER w_communities_users / (SELECT COUNT(*) FROM users) * 100 AS persent_of_all_users
		FROM communities_users 
	      JOIN users 
	       	on users.id = communities_users.user_id
	      JOIN profiles
		      ON users.id = profiles.user_id
   	      RIGHT JOIN communities 
	        ON communities.id = communities_users.community_id
		  WINDOW w_communities_users AS (PARTITION BY communities_users.community_id); 
		 
		 
-- Для проверки использовала такой запрос:		 
		      
select * 
	from communities_users
	join users on users.id = communities_users.user_id
	join profiles on profiles.user_id = users.id
	right join communities on communities.id = communities_users.community_id; 