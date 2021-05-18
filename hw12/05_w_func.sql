SELECT 
	DISTINCT articles.title, 
	(COUNT(articles_corrections.article_id) OVER()) / (SELECT COUNT(*) FROM articles) as average_corrections_for_article, -- ������� ���������� ������ ������
	FIRST_VALUE(CONCAT(users.first_name, ' ', users.last_name)) OVER (w_articles_corrections ORDER BY corrections.created_at DESC) AS author, -- �������� ����� ������
	FIRST_VALUE(CONCAT(users.first_name, ' ', users.last_name)) OVER (w_articles_corrections ORDER BY corrections.created_at) AS last_editor, -- ��������� ������������, ��������������� ������
	COUNT(articles_corrections.article_id) OVER w_articles_corrections AS corrections_for_articles, -- ������� ����� ������ ������
	(SELECT COUNT(*) FROM corrections) AS all_corrections, -- ����� ������� ������
	COUNT(articles_corrections.article_id) OVER w_articles_corrections / (SELECT COUNT(*) FROM corrections) * 100 AS persent_of_corrections -- ������� ������ ���������� ������ �� ������ ����� ������
		FROM articles_corrections  
   	      JOIN corrections 
	        ON corrections.id = articles_corrections.correction_id 
	      JOIN users 
	       	on users.id = corrections.user_id
	      JOIN articles
		      ON articles_corrections.article_id = articles.id 
		  WINDOW w_articles_corrections AS (PARTITION BY articles_corrections.article_id); 
