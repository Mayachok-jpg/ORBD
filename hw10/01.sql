CREATE INDEX media_first_name_last_name_idx
	ON users(first_name, last_name);

CREATE INDEX profiles_city_idx
	ON profiles(city); -- если я правильно поняла, индекс создается только для одной таблицы. Тут идея в том, что индекс на город может ускорить поиск по имени и городу проживания пользователя.

CREATE INDEX communities_name_idx
	ON communities(name);

CREATE INDEX media_filename_idx
	ON media(filename); -- мне кажется обязательно будет поиск по названиям аудио и видео, но в данной реализации выделенного названия нет 