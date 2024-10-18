"""
You are given a dataset from Amazon that tracks and aggregates user activity on their platform in certain time periods. 
For each device type, find the time period with the highest number of active users.


The output should contain 'user_count', 'time_period', and 'device_type', where 'time_period' is a concatenation of 'start_timestamp' and 'end_timestamp', like ;
"start_timestamp to end_timestamp".

Table: user_activity

user_activity

start_timestamp: datetime
end_timestamp: datetime
user_count: int
device_type: varchar
time_difference: float

"""

With get_time_period AS
(
    SELECT user_count,
        device_type,
        concat(start_timestamp,' to ', end_timestamp) AS time_period
        
    FROM
        user_activity
        where user_count = (select max(user_count) from user_activity)
)

select * from get_time_period
