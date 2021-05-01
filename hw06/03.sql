USE vk;
SELECT
	(SELECT gender FROM profiles WHERE user_id = likes.user_id) AS gender,
	COUNT(*) AS total
	FROM likes
	GROUP BY gender
	ORDER BY total DESC
	LIMIT 1;