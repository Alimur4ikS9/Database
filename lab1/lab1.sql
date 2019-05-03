CREATE DATABASE lab1
CREATE TABLE users (
	id integer NOT NULL DEFAULT nextval,
	firstname character varying(50)[], 
	lastname character varying(50)[],
	)
ALTER TABLE users
ADD isadmin integer DEFAULT 0;

ALTER TABLE users
ALTER COLUMN isadmin SET DATA TYPE boolean;

// TYPE (USING::boolean)

ALTER TABLE users
ALTER COLUMN isadmin SET DEFAULT false;


ALTER TABLE users
ADD CONSTRAINT users_pkey PRIMARY KEY (id);

CREATE TABLE tasks (
	id int NOT NUL AUTO_INCREMENT,
	name varchar(50),
	user_id integer,
	);

//DROP TABLE tasks;
//DROP DATABASE lab1;