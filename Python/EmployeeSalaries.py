"""
Let’s say we have a table representing a company payroll schema.

Due to an ETL error, the employees table, instead of updating the salaries every year when doing compensation adjustments, did an insert instead. The head of HR still needs the current salary of each employee.

Write a query to get the current salary for each employee.

Note: Assume no duplicate combination of first and last names (I.E. No two John Smiths). Assume the INSERT operation works with ID autoincrement.

Example:

Input:

employees table

Column	Type
id	VARCHAR
first_name	VARCHAR
last_name	VARCHAR
salary	INTEGER
department_id	INTEGER
Output:

Column	Types
first_name	VARCHAR
last_name	VARCHAR
salary	INTEGER
"""

import pandas as pd
import numpy as np

def employee_salaries_etl_error(employees: pd.DataFrame):
    
    salary = employees.sort_values('id').groupby(['first_name', 'last_name']).agg({'salary':'max','id':'max'})
    return salary.reset_index()[['first_name', 'last_name','salary']]
