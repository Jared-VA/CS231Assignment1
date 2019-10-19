USE Normalization1;
DROP TABLE IF EXISTS status;

CREATE TABLE status (
  current_status int(11) NOT NULL auto_increment,
  status VARCHAR(25) NOT NULL,
  PRIMARY KEY  (current_status)
) AS
	SELECT DISTINCT status
	FROM my_contacts
	WHERE status IS NOT NULL
	ORDER BY status;

ALTER TABLE my_contacts
	ADD COLUMN current_status INT(11);



UPDATE my_contacts
	INNER JOIN status
	ON status.status = my_contacts.status
	SET my_contacts.current_status = status.current_status
	WHERE status.status IS NOT NULL;

SELECT mc.first_name, mc.last_name, mc.status, mc.current_status, st.status
	FROM status AS st
		INNER JOIN my_contacts AS mc
	ON st.current_status = mc.current_status;

ALTER TABLE my_contacts
   DROP COLUMN status;