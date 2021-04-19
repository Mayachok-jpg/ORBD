CREATE TABLE posts (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки", 
  author_id INT NOT NULL UNSIGNED COMMENT "Автор поста",
  community_id INT UNSIGNED COMMENT "Ссылка на группу (пусто, если пост на личной странице)",
  created_at DATETIME DEFAULT NOW() COMMENT "Время создания"
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления"
  title VARCHAR (150) COMMENT "Заголовок"
  body LONGTEXT NOT NULL COMMENT "Текст поста",
  attachment_id INT UNSIGNED COMMENT "Ссылка на медиафайл",
  is_draft BOOLEAN COMMENT "Признак черновика",  
) COMMENT "Посты";

CREATE TABLE likes (
  object_id INT NOT NULL UNSIGNED COMMENT "Что лайкаем",
  object_type ENUM ('post', 'profile', 'mediafile') COMMENT "Тип объекта, котрый лайкаем",
  user_id INT UNSIGNED NOT NULL COMMENT "Ссылка на пользователя (кто ставит лайк)",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки", 
  ) COMMENT "Лайки";
