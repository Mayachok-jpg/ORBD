DELIMITER //

CREATE trigger chek_last_correction before insert on articles_corrections
FOR EACH ROW BEGIN
	declare last_edit DATEtime;
	select created_at INTO last_edit from articles_corrections where new.article_id = article_id order by created_at DESC limit 1;       
	if new.created_at < last_edit then  
	    SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = last_edit;
   end if;
END//




