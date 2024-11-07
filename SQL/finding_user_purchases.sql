"""
Finding User Purchases
Write a query that'll identify returning active users.
A returning active user is a user that has made a second purchase within 7 days of any other of their purchases. Output a list of user_ids of these returning active users.
"""


with get_first_txn as (
select user_id, id,
created_at, row_number() over(partition by user_id order by created_at desc) as rnk
from amazon_transactions 

)

select distinct u.user_id
from 
(
select user_id, created_at,id
from get_first_txn
where rnk = 1 
) s
join 
amazon_transactions u 
on s.user_id = u.user_id 
and u.id <> s.id 
and  s.created_at-u.created_at between 0 and 7 
order by 1
