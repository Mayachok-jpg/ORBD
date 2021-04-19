CREATE TABLE posts (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "������������� ������", 
  author_id INT NOT NULL UNSIGNED COMMENT "����� �����",
  community_id INT UNSIGNED COMMENT "������ �� ������ (�����, ���� ���� �� ������ ��������)",
  created_at DATETIME DEFAULT NOW() COMMENT "����� ��������"
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "����� ����������"
  title VARCHAR (150) COMMENT "���������"
  body LONGTEXT NOT NULL COMMENT "����� �����",
  attachment_id INT UNSIGNED COMMENT "������ �� ���������",
  is_draft BOOLEAN COMMENT "������� ���������",  
) COMMENT "�����";

CREATE TABLE likes (
  object_id INT NOT NULL UNSIGNED COMMENT "��� �������",
  object_type ENUM ('post', 'profile', 'mediafile') COMMENT "��� �������, ������ �������",
  user_id INT UNSIGNED NOT NULL COMMENT "������ �� ������������ (��� ������ ����)",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "����� �������� ������", 
  ) COMMENT "�����";
