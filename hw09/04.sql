use shop;

DROP TABLE IF EXISTS posts;

CREATE TABLE IF NOT EXISTS posts (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  created_at DATE NOT NULL
);

INSERT INTO posts VALUES
(NULL, '������ ������', '2018-11-01'),
(NULL, '������ ������', '2018-11-02'),
(NULL, '������ ������', '2018-11-03'),
(NULL, '��������� ������', '2018-11-04'),
(NULL, '����� ������', '2018-11-05'),
(NULL, '������ ������', '2018-11-06'),
(NULL, '������� ������', '2018-11-07'),
(NULL, '������� ������', '2018-11-08'),
(NULL, '������� ������', '2018-11-09'),
(NULL, '������� ������', '2018-11-10');

select * from posts; 

SELECT created_at
  FROM posts
  ORDER BY created_at DESC
  LIMIT 5, 1;

DELETE posts
FROM posts
JOIN
 (SELECT created_at
  FROM posts
  ORDER BY created_at DESC
  LIMIT 5, 1) AS delpst
ON
  posts.created_at <= delpst.created_at;

SELECT * FROM posts;
