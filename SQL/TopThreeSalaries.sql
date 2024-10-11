/*
Given the employees and departments table, write a query to get the top 3 highest employee salaries by department. If the department contains less that 3 employees, the top 2 or the top 1 highest salaries should be listed (assume that each department has at least 1 employee). 

Note: The output should include the full name of the employee in one column, the department name, and the salary. 
The output should be sorted by department name in ascending order and salary in descending order. 

Example:

Input:

employees table

Column	Type
id	INTEGER
first_name	VARCHAR
last_name	VARCHAR
salary	INTEGER
department_id	INTEGER
departments table

Column	Type
id	INTEGER
name	VARCHAR
Output:

Column	Type
employee_name	VARCHAR
department_name	VARCHAR
salary	INTEGER

*/

/* 
RANK THE EMPLOYEE BY SALARIES AT DEPARTMENT LEVEL
GET THE TOP 3 RANKS 
*/

WITH get_sal_ranks AS
(
    SELECT 
        department_id, concat(first_name,' ', last_name) as employee_name, salary, DENSE_RANK() OVER(PARTITION BY department_id ORDER BY SALARY DESC) AS rnk
    FROM 
    employees
)

SELECT employee_name, name as department_name,
salary 
from 
get_sal_ranks s 
join 
departments d 
on s.department_id = d.id
where rnk <= 3
order by 2 asc, 3 desc
