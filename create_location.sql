USE Normalization1;
DROP TABLE IF EXISTS city;
DROP TABLE IF EXISTS state;

ALTER TABLE my_contacts
    ADD COLUMN state VARCHAR (25);

UPDATE my_contacts
	SET my_contacts.state = RIGHT(location, 2)
	WHERE location IS NOT NULL;
    ORDER BY location;


ALTER TABLE my_contacts
    ADD COLUMN city VARCHAR (25);

UPDATE my_contacts
	SET my_contacts.city = SUBSTRING_INDEX(location, ',' , 1)
	WHERE location IS NOT NULL;
    ORDER BY location;


