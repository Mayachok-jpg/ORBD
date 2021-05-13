CREATE INDEX media_first_name_last_name_idx
	ON users(first_name, last_name);

CREATE INDEX profiles_city_idx
	ON profiles(city); -- ���� � ��������� ������, ������ ��������� ������ ��� ����� �������. ��� ���� � ���, ��� ������ �� ����� ����� �������� ����� �� ����� � ������ ���������� ������������.

CREATE INDEX communities_name_idx
	ON communities(name);

CREATE INDEX media_filename_idx
	ON media(filename); -- ��� ������� ����������� ����� ����� �� ��������� ����� � �����, �� � ������ ���������� ����������� �������� ��� 