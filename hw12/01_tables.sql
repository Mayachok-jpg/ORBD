CREATE DATABASE miwiki;
USE miwiki;

-- 1. ������
CREATE TABLE articles (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "������������� ������",
	title varchar(225) NOT NULL COMMENT "�������� ������",
	body TEXT NOT NULL COMMENT "����� ������",
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "����� �������� ������",  
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "����� ���������� ������"
) COMMENT "������";


-- 2. �������
CREATE TABLE categories (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "������������� ������",
	name varchar(225) NOT NULL COMMENT "�������� �������",	
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "����� �������� ������",  
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "����� ���������� ������"
) COMMENT "�������";

-- 3. ����������
CREATE TABLE articles_categories (
  article_id INT UNSIGNED NOT NULL COMMENT "������ �� ������",
  categorie_id INT UNSIGNED NOT NULL COMMENT "������ �� �������",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "����� �������� ������", 
  PRIMARY KEY (article_id, categorie_id) COMMENT "��������� ��������� ����"
) COMMENT "����������, ����� ����� ������� � ��������";

-- 4. �������� ������
CREATE TABLE quality (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "������������� ������",
	article_id INT UNSIGNED NOT NULL UNIQUE COMMENT "������ �� ������",
	name ENUM ('��������� ������', '������� ������', '��������� ������', '��������� ������ � �������', '������ ����') NOT NULL COMMENT "������� ��������",	
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "����� �������� ������",  
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "����� ���������� ������"
) COMMENT "������������ ������";

-- 5. ������� �����������
CREATE TABLE media (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "������������� ������",
  user_id INT UNSIGNED NOT NULL COMMENT "������ �� ������������, ������� �������� ����",
  filename VARCHAR(255) NOT NULL COMMENT "���� � �����",
  size INT NOT NULL COMMENT "������ �����",
  metadata JSON COMMENT "���������� �����",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "����� �������� ������",
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "����� ���������� ������"
) COMMENT "����������";

-- 6. ����������� � ������
CREATE TABLE articles_media (
  article_id INT UNSIGNED NOT NULL COMMENT "������ �� ������",
  media_id INT UNSIGNED NOT NULL COMMENT "������ �� ���������",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "����� �������� ������", 
  PRIMARY KEY (article_id, media_id) COMMENT "��������� ��������� ����"
) COMMENT "����� ������ � �����������";

-- 7. ������ (����� ������ �� �����, ��� �����)

CREATE TABLE corrections (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "������������� ������",  
  str_number INT UNSIGNED NOT NULL COMMENT "����� ������",
  old_str TEXT NOT NULL COMMENT "������ �����",  
  new_str TEXT NOT NULL COMMENT "����� �����",
  user_id INT UNSIGNED NOT NULL COMMENT "������ �� ������������, ������� ���� ������",
  is_deleted BOOLEAN NOT NULL DEFAULT FALSE COMMENT "������� ������",
) COMMENT "������ ������";

-- 8. ������ - ������ 

CREATE TABLE articles_corrections (
  article_id INT UNSIGNED NOT NULL COMMENT "������ �� ������",
  correction_id INT UNSIGNED NOT NULL COMMENT "������ �� ������",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "����� �������� ������", 
  PRIMARY KEY (article_id, correction_id) COMMENT "��������� ��������� ����"
) COMMENT "����� ������ � ������";


-- 9. ������
CREATE TABLE users (  
    id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "������������� ������", 
    first_name VARCHAR(100) NOT NULL COMMENT "��� ������������",
    last_name VARCHAR(100) NOT NULL COMMENT "������� ������������",
    email VARCHAR(100) NOT NULL UNIQUE COMMENT "�����",    
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "����� �������� ������",  
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "����� ���������� ������"
);	

-- 10. ������ ������

CREATE TABLE statuses_users (  
  user_id INT UNSIGNED NOT NULL COMMENT "������ �� ������������",
  status_id INT UNSIGNED NOT NULL COMMENT "������ �� ������",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "����� �������� ������", 
  PRIMARY KEY (user_id, status_id) COMMENT "��������� ��������� ����"
) COMMENT "������ ������������"; -- �������, �� ����� ���� ��� �������, � ������� ������� ��� ����� ����, �� ���� ������������ 

 
-- 11. ���������� ��������

CREATE TABLE statuses (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "������������� ������",
  name VARCHAR(150) NOT NULL UNIQUE COMMENT "�������� �������",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "����� �������� ������",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "����� ���������� ������"  
) COMMENT "���������� �������� ";




