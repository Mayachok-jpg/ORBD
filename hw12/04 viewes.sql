-- Название статьи, ее качество и количество правок

create or replace view quality_of_articles as
select t1.title, t1.quality, edit_num from 
(select articles.id, title, quality.name as quality 
from articles left join quality on quality.article_id = articles.id) as t1
left join 
(select title, count(articles_corrections.correction_id) as edit_num from articles join articles_corrections on articles_corrections.article_id = articles.id
group by articles.title) as t2
on t1.title = t2.title;


-- Суммарный размер всех иллюстраций (медаиа-файлов) статьи

create or replace view size_of_articles_media as
select title, sum(media.`size`) as all_media FROM articles 
left join articles_media on articles_media.article_id = articles.id 
left join media on media.id = articles_media.media_id
group by title
order by all_media desc; 

 