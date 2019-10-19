USE Normalization1;
DROP TABLE IF EXISTS interests1;

ALTER TABLE my_contacts
    ADD COLUMN interests1 VARCHAR (25);

UPDATE my_contacts
	SET my_contacts.interests1 = SUBSTRING_INDEX(interests, ',' , 1)
	WHERE interests IS NOT NULL
    ORDER BY interests;


ALTER TABLE my_contacts
    ADD COLUMN interests2 VARCHAR (25);

UPDATE my_contacts
	SET my_contacts.interests2 = RIGHT(interests, length(interests)-length(my_contacts.interests1)-1)
	WHERE interests IS NOT NULL
    ORDER BY interests;


ALTER TABLE my_contacts
    ADD COLUMN interests3 VARCHAR (25);

UPDATE my_contacts
	SET my_contacts.interests3 = RIGHT(my_contacts.interests2, length(my_contacts.interests2)-length(my_contacts.interests1)-3)
	WHERE interests IS NOT NULL
    ORDER BY interests;