use miwiki;

ALTER TABLE articles_categories 
  ADD CONSTRAINT articles_categories_article_id_fk 
    FOREIGN KEY (article_id) REFERENCES articles(id)
	    ON DELETE CASCADE,
  ADD CONSTRAINT articles_categories_categorie_id_fk 
    FOREIGN KEY (categorie_id) REFERENCES categories(id)
	   ON DELETE CASCADE;

ALTER TABLE articles_corrections 
  ADD CONSTRAINT articles_corrections_article_id_fk 
    FOREIGN KEY (article_id) REFERENCES articles(id)
	    ON DELETE CASCADE,
  ADD CONSTRAINT articles_corrections_correction_id_fk 
    FOREIGN KEY (correction_id) REFERENCES corrections(id)
	   ON DELETE CASCADE;

ALTER TABLE articles_media 
  ADD CONSTRAINT articles_medias_article_id_fk 
    FOREIGN KEY (article_id) REFERENCES articles(id)
	    ON DELETE CASCADE,
  ADD CONSTRAINT articles_medias_media_id_fk 
    FOREIGN KEY (media_id) REFERENCES media(id)
	   ON DELETE CASCADE;
	  
ALTER TABLE corrections
  ADD CONSTRAINT corrections_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id)
      ON DELETE RESTRICT;

ALTER TABLE quality 
  ADD CONSTRAINT quality_article_id_fk 
    FOREIGN KEY (article_id) REFERENCES articles(id)
      ON DELETE CASCADE;

ALTER TABLE statuses_users 
  ADD CONSTRAINT statuses_users_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id)
	    ON DELETE CASCADE,
  ADD CONSTRAINT statuses_users_status_id_fk 
    FOREIGN KEY (status_id) REFERENCES statuses(id)
	   ON DELETE CASCADE;

CREATE INDEX articles_title_idx
	ON articles(title);

CREATE INDEX users_first_name_last_name_idx
	ON users(first_name, last_name);
  
 	  