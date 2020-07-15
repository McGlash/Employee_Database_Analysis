-- Data engineering

-- Create tables

---titles

CREATE TABLE titles (title_id VARCHAR(5) PRIMARY KEY,
					 title char(30) NOT NULL);
					 
--- employees

CREATE TABLE employees (emp_no INT PRIMARY KEY,
					   emp_title VARCHAR(5) REFERENCES titles(title_id),
					   birth_date DATE,
					   first_name VARCHAR(30) NOT NULL,
					   last_name VARCHAR(30) NOT NULL,
					   sex CHAR(1),
					   hire_date DATE);
--- salaries

CREATE TABLE salaries (emp_no INT PRIMARY KEY REFERENCES employees(emp_no),
					  salary INT NOT NULL)
--- departments

CREATE TABLE departments (dept_no VARCHAR(4) PRIMARY KEY, 
						  dept_name VARCHAR(30) NOT NULL);
						  
--- employee department

CREATE TABLE emp_dept (emp_no INT NOT NULL REFERENCES employees(emp_no),
					   dept_no VARCHAR(4) NOT NULL REFERENCES departments(dept_no),
					   PRIMARY KEY (emp_no, dept_no)); --composite key

--- department manager 

CREATE TABLE dept_manager (dept_no VARCHAR(4) NOT NULL REFERENCES departments(dept_no),
						   emp_no INT NOT NULL REFERENCES employees(emp_no),
						   PRIMARY KEY (dept_no, emp_no)); --composite key
