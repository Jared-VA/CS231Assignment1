USE Normalization1;
DROP TABLE IF EXISTS seeking1;

ALTER TABLE my_contacts
    ADD COLUMN seeking1 VARCHAR (25);

UPDATE my_contacts
	SET my_contacts.seeking1 = SUBSTRING_INDEX(seeking, ',' , 1)
	WHERE seeking IS NOT NULL
    ORDER BY seeking;


ALTER TABLE my_contacts
    ADD COLUMN seeking2 VARCHAR (25);

UPDATE my_contacts
	SET my_contacts.seeking2 = RIGHT(seeking, length(seeking)-length(my_contacts.seeking)-1)
	WHERE seeking IS NOT NULL
    ORDER BY seeking;


ALTER TABLE my_contacts
   DROP COLUMN seeking;