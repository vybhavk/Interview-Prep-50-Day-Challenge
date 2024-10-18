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

# Import your libraries
import pandas as pd

# Start writing code
user_activity.head()


user_activity['start_timestamp to end_timestamp'] = user_activity[['start_timestamp',
'end_timestamp'
]].apply(lambda z: str(z['start_timestamp'])+' to '+ str(z['end_timestamp']),axis=1)

highest = user_activity['user_count'].max()
user_activity[user_activity['user_count']==highest][['user_count', 'start_timestamp to end_timestamp', 'device_type']]
