CREATE TABLE salesman(
	salesman_id int,
	name character varying(50),
	city character varying(50),
	comission double 
);


CREATE TABLE customers(
	customers_id int,
	cust_name character varying(50),
	city character varying(50),
	grade int,
	salesman_id int,
	FOREIGN KEY salesman_id REFERENCES salesman(salesman_id)
);


CREATE TABLE orders(
	ord_no int,
	purch_amt double,
	ord_date date,
	customer_id int FOREIGN KEY REFERENCES customers(customers_id),
	salesman_id int FOREIGN KEY REFERENCES salesman(salesman_id)
);


CREATE ROLE junior_dev LOGIN;



CREATE VIEW newyorksalesmen AS
	SELECT * FROM salesman WHERE city = 'New York';

	

CREATE MATERIALIZED VIEW orders_view AS SELECT orders.ord_no, salesman.name, customers.cust_name FROM orders
JOIN customers ON ((orders.customer_id = customers.customer_id)) 
JOIN salesman ON ((customers.salesman_id = salesman.salesman_id))
GROUP BY orders.ord_no; 
GRANT ALL PRIVILEGES to junior_dev;

CREATE VIEW nameorders AS 
	SELECT ord_no, a.salesman_id, name, cust_name
	FROM orders a, salesman b, customer c
	WHERE a.salesman_id = b.salesman_id
	AND a.customer_id = c.customer_id;
	


CREATE VIEW highestgrade AS 
	SELECT * FROM customer
  	WHERE grade =
    (SELECT MAX (grade) FROM customers);
	

GRANT SELECT ON highestgrade TO junior_dev;

CREATE VIEW citynumber AS 
	SELECT city, COUNT (DISTINCT salesman_id)
	FROM salesman
	GROUP BY city;



CREATE VIEW snum AS SELECT salesman_id FROM customers GROUP BY salesman_id HAVING count(customer_id) > 1;



CREATE VIEW mcustomer AS 
	SELECT * FROM salesman s
	WHERE 1 < (SELECT COUNT(*)
    	FROM customer c
     	WHERE s.salesman_id = c.salesman_id);
		

CREATE ROLE intern;

	GRANT junior_dev TO intern;