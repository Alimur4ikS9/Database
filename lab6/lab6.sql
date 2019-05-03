CREATE TABLE locations(
	location_id SERIAL PRIMARY KEY,
	street_address CHARACTER VARYING(25),
	postal_code CHARACTER VARYING(12),
	city CHARACTER VARYING(30),
	state_province CHARACTER VARYING(12)
);

CREATE TABLE departments(
	department_id SERIAL PRIMARY KEY,
	department_name CHARACTER VARYING(50) UNIQUE,
	budget INTEGER,
	location_id INTEGER REFERENCES locations
);

CREATE TABLE employees(
	employee_id SERIAL PRIMARY KEY,
	first_name CHARACTER VARYING(50),
	last_name CHARACTER VARYING(50),
	email CHARACTER VARYING(50),
	phone_number CHARACTER VARYING(20),
	salary INTEGER,
	department_id INTEGER REFERENCES departments
);

CREATE TABLE grades(
	grade_level CHARACTER VARYING(1),
	lowest_salary INTEGER,
	highest_salary INTEGER
);

SELECT employee_id FROM employees INNER JOIN grades 
	ON employees.salary BETWEEN grades.lowest_salary AND grades.highest_salary;  
	
SELECT employee_id, salary FROM employees e1 INNER JOIN employees e2
	ON e1.salary < e2.salary
		WHERE e2.employee_id = 120;
	
ALTER TABLE employees
	ADD COLUMN manager_id REFERENCES employees (employee_id)
	SELECT employee_id FROM employees e INNER JOIN employees m ON e.employee_id = m.manager_id 
		RETURNING e.employee_id, e.first_name, e.last_name, e.manager_id, m.first_name, m.last_name;
		
SELECT department_name, count(*) FROM departments INNER JOIN employees ON
	departments.departmnet_id = employees.department_id;
	
SELECT * FROM employees INNER JOIN departments ON employees.department_id = departments.department_id
	INNER JOIN locations ON departments.location_id = locations.location_id;
		--RETURNING locations.city, locations.state_province;
		
	
		
