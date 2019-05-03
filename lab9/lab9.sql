CREATE TABLE Reviewer (
	rID int PRIMARY KEY,
	name varchar(255)
);

CREATE TABLE Movie (
	mID int PRIMARY KEY, 
	title varchar(255), 
	year int, 
	director varchar(255)
);

CREATE TABLE Rating (
	rID REFERENCES Reviewer, 
	mID REFERENCES Movie, 
	stars int, 
	ratingDate date
);

CREATE VIEW vYears AS 
	SELECT DISTINCT year FROM Movie m1 INNER JOIN Rating r1
	ON m1.mID = r1.mID
		WHERE r1.stars = 4 OR r1.stars = 5
		ORDER BY year ASC NULLS FIRST;
		
		
CREATE INDEX sIndex ON Rating (stars);
CREATE INDEX sIndex ON Movie (year);

CREATE ROLE creater CREATEROLE LOGIN;

CREATE ROLE student;
GRANT creater TO student;

REASSIGN OWNED BY creater TO student;
DROP OWNED BY creater;
DROP ROLE creater;