USE Normalization1;
DROP TABLE IF EXISTS interests1;

ALTER TABLE my_contacts
    ADD COLUMN interests1 VARCHAR (25);

UPDATE my_contacts
	SET my_contacts.interests1 = SUBSTRING_INDEX(interests, ',' , 1)
	WHERE interests IS NOT NULL;
    ORDER BY interests;


CREATE TABLE interests (
  interests2 VARCHAR(25) NOT NULL auto_increment,
  interests VARCHAR(25) NOT NULL,
  PRIMARY KEY  (interests2)
) AS
	SELECT DISTINCT interests
	FROM my_contacts
	WHERE interests IS NOT NULL
	ORDER BY interests;