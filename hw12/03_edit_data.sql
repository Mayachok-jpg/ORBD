use miwiki;

select * from articles;

UPDATE articles SET updated_at = created_at WHERE  updated_at < created_at;

select * from articles_categories limit 10;
select * from articles_corrections limit 10;
select * from articles_media limit 10;
select * from categories limit 10;

UPDATE categories SET updated_at = created_at WHERE updated_at < created_at;

select * from categories limit 10;

select * from corrections;

-- media

desc media;
select * from media limit 10;

UPDATE media SET updated_at = created_at WHERE updated_at < created_at;
CREATE TEMPORARY TABLE extensions (name VARCHAR(10));
INSERT INTO extensions VALUES ('jpg'), ('avi'), ('mp3'), ('png'), ('mp4'), ('gif');
SELECT * from extensions;
UPDATE media SET filename = CONCAT('http://miwiki.net/media/', filename, '.', (select name from extensions order by rand() limit 1));
UPDATE media SET size = FLOOR(100000 + RAND() * 100000000) WHERE  size < 10000;
UPDATE media SET metadata = CONCAT('{"owner":"', 
  (SELECT CONCAT(first_name, ' ', last_name) FROM users WHERE id = user_id),
  '"}');  
ALTER TABLE media MODIFY COLUMN metadata JSON;


select * from quality limit 10;
-- quality 
-- ����������, ��� � ����� �� ������� ENUM ������ ������, �������� ���������� ��������
ALTER TABLE quality MODIFY COLUMN name ENUM('��������� ������', '������� ������', '��������� ������', ' ��������� ������ � �������', '��������� ������ � �������', '������ ����');
UPDATE quality SET name = '��������� ������ � �������' WHERE name = ' ��������� ������ � �������';
ALTER TABLE quality MODIFY COLUMN name ENUM('��������� ������', '������� ������', '��������� ������', '��������� ������ � �������', '������ ����');

select * from statuses limit 10;
UPDATE statuses SET updated_at = created_at WHERE updated_at < created_at;

select * from statuses_users;

select * from users limit 10;
UPDATE users SET updated_at = created_at WHERE updated_at < created_at;

