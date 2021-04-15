CREATE TABLE messages (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "������������� ������", 
  from_sender_id INT UNSIGNED NOT NULL COMMENT "������ �� ����������� ���������: ������������ ��� ����������",
  to_addressee_id INT UNSIGNED NOT NULL COMMENT "������ �� ���������� ���������: ������������ ��� ����������",
  body TEXT NOT NULL COMMENT "����� ���������",
  attachment_id INT UNSIGNED NOT NULL COMMENT "������ �� ���������",
  is_important BOOLEAN COMMENT "������� ��������",
  is_delivered BOOLEAN COMMENT "������� ��������",
  is_deleted BOOLEAN COMMENT "������� ��������, ��������, ����� ��������� ����� ��� �� ��������� ������ � ����� ���� ������������",
  created_at DATETIME DEFAULT NOW() COMMENT "����� �������� ������"
) COMMENT "���������";

-- ������� ����� ������������� � �����
CREATE TABLE communities_users (
  community_id INT UNSIGNED NOT NULL COMMENT "������ �� ������",
  user_id INT UNSIGNED NOT NULL COMMENT "������ �� ������������",
  user_role VARCHAR(130) COMMENT "���� ������������, ������ ��� ������ ���� ��������� �������-����������",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "����� �������� ������", 
  PRIMARY KEY (community_id, user_id) COMMENT "��������� ��������� ����"
) COMMENT "��������� �����, ����� ����� �������������� � ��������";

CREATE TABLE profiles (
  user_id INT UNSIGNED NOT NULL PRIMARY KEY COMMENT "������ �� ������������", 
  gender CHAR(1) NOT NULL COMMENT "���",
  birthday DATE COMMENT "���� ��������",
  city VARCHAR(130) COMMENT "����� ����������",
  country VARCHAR(130) COMMENT "������ ����������",
  access_status_id INT UNSIGNED NOT NULL COMMENT "������ �� ������ ("������ �", "������", "������ ������" � �.�.)",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "����� �������� ������",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "����� ���������� ������"
) COMMENT "�������"; 

-- ������� �������� �������
CREATE TABLE access_statuses (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "������������� ������",
  name VARCHAR(150) NOT NULL UNIQUE COMMENT "�������� �������",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "����� �������� ������",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "����� ���������� ������"  
) COMMENT "������� �������";