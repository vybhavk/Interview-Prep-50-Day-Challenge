/*
Write a query to identify customers who placed more than three transactions each in both 2019 and 2020.
Example:
Input:
transactions table

Column	Type
id	INTEGER
user_id	INTEGER
created_at	DATETIME
product_id	INTEGER
quantity	INTEGER
users table

Column	Type
id	INTEGER
name	VARCHAR
  Output:

Column	Type
customer_name	VARCHAR

*/

/*
filter row from 2019 and 2020 
filter customers who placed more 3 transactions
*/

WITH get_tds_2019 AS
(
    SELECT user_id
    FROM 
    transactions
    WHERE EXTRACT (YEAR from created_at) = 2019 
    GROUP BY 1
    HAVING count(distinct id) > 3

),
get_tds_2020 AS
(
     SELECT user_id
    FROM 
    transactions
    WHERE EXTRACT (YEAR from created_at) = 2020
    GROUP BY 1
    HAVING count(distinct id) > 3

)

SELECT t.name AS customer_name 
FROM 
get_tds_2019 tt 
JOIN 
get_tds_2020 u 
ON u.user_id = tt.user_id 
JOIN 
users t 
ON t.id = u.user_id
