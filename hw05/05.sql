DROP TABLE IF EXISTS catalogs;
CREATE TABLE catalogs (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL
) COMMENT = '�������';

INSERT INTO catalogs VALUES
  (NULL, '����������'),
  (NULL, '����������� �����'),
  (NULL, '����������'),
  (NULL, '������� �����'),
  (NULL, '����������� ������');

 select * from catalogs;
 
select * from catalogs where id in (5, 1, 2) order by field(id, 5, 1, 2);