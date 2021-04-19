USE vk;

SHOW tables;

DESC users; 
SELECT * FROM users LIMIT 10;
UPDATE users set updated_at = created_at WHERE  updated_at < created_at; 

DESC profiles;
SELECT * FROM profiles LIMIT 10;
UPDATE profiles set updated_at = created_at WHERE  updated_at < created_at; 
ALTER TABLE profiles MODIFY COLUMN gender ENUM('m', 'f');


DESC messages;
SELECT * FROM messages LIMIT 10;

DESC media;
SELECT * FROM media LIMIT 10;
UPDATE media SET updated_at = created_at WHERE  updated_at < created_at;
CREATE TEMPORARY TABLE extensions (name VARCHAR(10));
INSERT INTO extensions VALUES ('jpg'), ('avi'), ('mp3'), ('png'), ('mp4');
SELECT * from extensions;
UPDATE media SET filename = CONCAT('http://dropbox.net/vk/', filename, '.', (select name from extensions order by rand() limit 1));
UPDATE media SET size = FLOOR(100000 + RAND() * 100000000) WHERE  size < 10000;
UPDATE media SET metadata = CONCAT('{"owner":"', 
  (SELECT CONCAT(first_name, ' ', last_name) FROM users WHERE id = user_id),
  '"}');  
ALTER TABLE media MODIFY COLUMN metadata JSON;
UPDATE media SET media_type_id = FLOOR(1 + RAND() * 3);

DESC media_types;
SELECT * FROM media_types;
DELETE FROM media_types;
TRUNCATE media_types;
INSERT INTO media_types (name) VALUES
  ('photo'),
  ('video'),
  ('audio')
;

DESC friendship; 
SELECT * FROM friendship LIMIT 30;
UPDATE friendship SET 
  user_id = FLOOR(1 + RAND() * 100),
  friend_id = FLOOR(1 + RAND() * 100);
UPDATE friendship SET friend_id = friend_id + 1 WHERE user_id = friend_id; 
UPDATE friendship SET confirmed_at = created_at WHERE confirmed_at < created_at;
UPDATE friendship SET updated_at = created_at WHERE  updated_at < created_at;
 
SELECT * FROM friendship_statuses;
TRUNCATE friendship_statuses; 
INSERT INTO friendship_statuses (name) VALUES
  ('Requested'),
  ('Confirmed'),
  ('Rejected');

DESC communities; 
SELECT * FROM communities;
DELETE FROM communities WHERE id > 30;
UPDATE communities SET updated_at = created_at WHERE updated_at < created_at;

DESC communities_users;
SELECT * FROM communities_users; 
DELETE FROM communities_users;
INSERT INTO communities_users
  SELECT FLOOR(1 + RAND() * 100), FLOOR(1 + RAND() * 100), NOW() 
    FROM users;
DELETE FROM communities_users WHERE community_id > 30;   
   






