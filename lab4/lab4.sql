
CREATE TABLE Warehouses(
	code serial PRIMARY KEY,
	location character varying(255),
	capacity integer
);

CREATE TABLE Boxes(
	code character(4) PRIMARY KEY,
	contents character varying(255),
	value real,
	warehouse integer
	CONSTRAINT Warehouses_code FOREIGN KEY (warehouse) REFERENCES Warehouses(code)
);


INSERT INTO Warehouses(Code,Location,Capacity) VALUES(1,'Chicago',3);
 INSERT INTO Warehouses(Code,Location,Capacity) VALUES(2,'Chicago',4);
 INSERT INTO Warehouses(Code,Location,Capacity) VALUES(3,'New York',7);
 INSERT INTO Warehouses(Code,Location,Capacity) VALUES(4,'Los Angeles',2);
 INSERT INTO Warehouses(Code,Location,Capacity) VALUES(5,'San Francisco',8);
 
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('0MN7','Rocks',180,3);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('4H8P','Rocks',250,1);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('4RT3','Scissors',190,4);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('7G3H','Rocks',200,1);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('8JN6','Papers',75,1);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('8Y6U','Papers',50,3);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('9J6F','Papers',175,2);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('LL08','Rocks',140,4);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('P0H6','Scissors',125,1);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('P2T6','Scissors',150,2);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('TU55','Papers',90,5);
 
SELECT * FROM Warehouses;
 
SELECT * FROM Boxes 
 	WHERE value > 150;
	
SELECT DISTINCT ON(contents) * FROM Boxes;

SELECT warehouse, COUNT(warehouse)
	FROM Boxes 
		GROUP BY warehouse;

SELECT warehouse, COUNT(warehouse)
	FROM Boxes
		GROUP BY warehouse
			HAVING COUNT(warehouse) > 2;

INSERT INTO Warehouses(Code, Location,Capacity) VALUES(6, 'New York', 3);

INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('H5RT', 'Papers', 200, 2);

UPDATE Boxes
	SET value = value * 0.85
		WHERE value IN (
			SELECT value FROM Boxes ORDER BY value DESC LIMIT 1 OFFSET 2 
		);

DELETE FROM Boxes *
	WHERE value < 150;
	
DELETE FROM Boxes *
	USING Warehouses
		WHERE Boxes.warehouse IN (
			SELECT code FROM Warehouses WHERE location = 'New York'
				)
				RETURNING *;
		



