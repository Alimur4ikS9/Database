
CREATE TABLE countries(
	country_id serial PRIMARY KEY,
	country_name character varying,
	region_id integer,
	population integer
);

INSERT INTO countries (country_name, region_id, population)
	VALUES ('Qazaqstan', 01, 1000000);

INSERT INTO countries (country_name)
	VALUES ('USA');

INSERT INTO countries (country_name, region_id, population)
	VALUES ('Russia', NULL, 50000000);

INSERT INTO countries (country_name, region_id, population)
	VALUES ('Qazaqstan', 01, 1000000),
	('China', 13, 1800000000),
	('UK', 5, 30000000);

ALTER TABLE countries 
	ALTER country_name SET DEFAULT 'KAZAKHSTAN';

INSERT INTO countries (country_name, region_id, population)
	VALUES (DEFAULT, 57, 1500000);

INSERT INTO countries DEFAULT VALUES;


CREATE TABLE countries_new (LIKE countries);

INSERT INTO countries_new SELECT * FROM countries;

UPDATE countries_new 
	SET  region_id = 1
		WHERE region_id IS NULL;  


UPDATE countries_new 
	SET population = population * 1.10
		RETURNING country_name, population AS New_Population;


DELETE FROM countries 
	WHERE population < 100000;


DELETE FROM countries_new 
	USING countries 
		WHERE countries_new.country_id = countries.country_id
			RETURNING *;


DELETE FROM countries_new * 
	RETURNING *;
	
	