CREATE DATABASE miwiki;
USE miwiki;

-- 1. Статьи
CREATE TABLE articles (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки",
	title varchar(225) NOT NULL COMMENT "Название статьи",
	body TEXT NOT NULL COMMENT "Текст статьи",
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Статьи";


-- 2. Рубрики
CREATE TABLE categories (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки",
	name varchar(225) NOT NULL COMMENT "Название рубрики",	
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Рубрики";

-- 3. Рубрикатор
CREATE TABLE articles_categories (
  article_id INT UNSIGNED NOT NULL COMMENT "Ссылка на статью",
  categorie_id INT UNSIGNED NOT NULL COMMENT "Ссылка на рубрику",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки", 
  PRIMARY KEY (article_id, categorie_id) COMMENT "Составной первичный ключ"
) COMMENT "Рубрикатор, связь между статьей и рубрикой";

-- 4. Качество статьи
CREATE TABLE quality (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки",
	article_id INT UNSIGNED NOT NULL UNIQUE COMMENT "Ссылка на статью",
	name ENUM ('Добротные статьи', 'Хорошие статьи', 'Избранные статьи', 'Избранные списки и порталы', 'Статьи года') NOT NULL COMMENT "Отметка качества",	
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Качественные статьи";

-- 5. Таблица иллюстраций
CREATE TABLE media (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки",
  user_id INT UNSIGNED NOT NULL COMMENT "Ссылка на пользователя, который загрузил файл",
  filename VARCHAR(255) NOT NULL COMMENT "Путь к файлу",
  size INT NOT NULL COMMENT "Размер файла",
  metadata JSON COMMENT "Метаданные файла",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Медиафайлы";

-- 6. Иллюстрации к статье
CREATE TABLE articles_media (
  article_id INT UNSIGNED NOT NULL COMMENT "Ссылка на статью",
  media_id INT UNSIGNED NOT NULL COMMENT "Ссылка на медиафайл",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки", 
  PRIMARY KEY (article_id, media_id) COMMENT "Составной первичный ключ"
) COMMENT "Связь статьи и иллюстраций";

-- 7. Правки (какая строка на какую, кто менял)

CREATE TABLE corrections (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор правки",  
  str_number INT UNSIGNED NOT NULL COMMENT "Номер строки",
  old_str TEXT NOT NULL COMMENT "Старый текст",  
  new_str TEXT NOT NULL COMMENT "Новый текст",
  user_id INT UNSIGNED NOT NULL COMMENT "Ссылка на пользователя, который внес правку",
  is_deleted BOOLEAN NOT NULL DEFAULT FALSE COMMENT "Признак отмены",
) COMMENT "Таблиц правок";

-- 8. Правка - статья 

CREATE TABLE articles_corrections (
  article_id INT UNSIGNED NOT NULL COMMENT "Ссылка на статью",
  correction_id INT UNSIGNED NOT NULL COMMENT "Ссылка на правку",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки", 
  PRIMARY KEY (article_id, correction_id) COMMENT "Составной первичный ключ"
) COMMENT "Связь статьи и правок";


-- 9. Авторы
CREATE TABLE users (  
    id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки", 
    first_name VARCHAR(100) NOT NULL COMMENT "Имя пользователя",
    last_name VARCHAR(100) NOT NULL COMMENT "Фамилия пользователя",
    email VARCHAR(100) NOT NULL UNIQUE COMMENT "Почта",    
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
);	

-- 10. Статус автора

CREATE TABLE statuses_users (  
  user_id INT UNSIGNED NOT NULL COMMENT "Ссылка на пользователя",
  status_id INT UNSIGNED NOT NULL COMMENT "Ссылка на статус",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки", 
  PRIMARY KEY (user_id, status_id) COMMENT "Составной первичный ключ"
) COMMENT "Статус пользователя"; -- конечно, на самом деле все сложнее, у каждого статуса еще набор прав, но пора остановиться 

 
-- 11. Справочник статусов

CREATE TABLE statuses (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки",
  name VARCHAR(150) NOT NULL UNIQUE COMMENT "Название статуса",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"  
) COMMENT "Справочник статусов ";




