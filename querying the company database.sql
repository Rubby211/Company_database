SELECT * FROM  employee ORDER BY salary DESC; -- the riches employee--
 SELECT * FROM employee ORDER BY sex, first_name, last_name; -- find all employee orderd by sex and then name ---
 SELECT * FROM employee LIMIT 5;-- find the first five employees--
 SELECT first_name, last_name FROM employee; -- find the first and last name of the employees --
SELECT first_name AS forename, last_name AS surname FROM employee; -- find the forename and suranme of all employees --
SELECT DISTINCT sex FROM employee; -- find out all the different gender --
SELECT DISTINCT branch_id FROM employee; -- to find the various branch_id stored in the employee database --

-- further queries using functions---
SELECT COUNT(emp_id) FROM employee;      -- find the number of employees--
SELECT COUNT(super_id) FROM employee;    -- to find out how many employees have supervisors--
SELECT COUNT(emp_id) FROM employee WHERE sex='F' AND  birth_date > '1971-01-01';-- find the number of female employee born after 1970 --
SELECT AVG(salary) FROM employee;-- find the average of all employee salary
SELECT AVG(salary) FROM employee WHERE sex= 'M';-- find the average of all male employee salary--
SELECT SUM(salary) FROM employee;  -- find the sum of all employee salary

-- Agggregation; Using fucntions to dsiplay data results in a more helpful way--
SELECT COUNT(sex), sex FROM employee GROUP BY sex; -- find out how many males and how many females there are--
SELECT SUM(total_sales), emp_id FROM works_with GROUP BY emp_id; -- find the total sales of each salesman--
SELECT SUM(total_sales), client_id FROM works_with GROUP BY client_id; -- Find out how much each client spent--

-- using wildcats % =any number of characters, _= one charater. it is a pattern to matc specific pieces of data to. It is use to grab data that matches a specific pattern--
SELECT * FROM client WHERE client_name LIKE '%LLC';  -- find any client who are in LLC client_idclient_namebranch_id --
SELECT * FROM branch_supplier WHERE supplier_name LIKE '%Label%'; -- Find branch suppliers who are in the label business-- 
SELECT * from employee WHERE birth_date LIKE '%10%';-- find any employee born in October-- 
SELECT * from employee WHERE birth_date LIKE '____-10%';-- find any employee born in October--
SELECT * FROM client WHERE client_name LIKE '%school%'; -- find any clients who are schools --

-- Unions in SQL; a special sql oporator used to combine the result of multiple select statements into one --
SELECT first_name AS Company_Names FROM employee 
UNION
SELECT branch_name FROM branch
UNION 
SELECT client_name FROM client;   -- find the list of employees name, client name and branch names As company names --
SELECT client_name FROM client UNION SELECT supplier_name FROM branch_supplier; -- find the list of all client and branch suppliers's name Or;
SELECT client_name, branch_id FROM client UNION SELECT supplier_name, branch_id FROM branch_supplier;
SELECT salary AS Cash_flow FROM employee UNION SELECT total_sales FROM works_with; -- find the list of all money spent or earned by the company --