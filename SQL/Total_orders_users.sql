
With get_group_orders as
(
	select group_id, user_id, order_id, 
		case when o.order_id = c.order_id then 1 else 0 end cust_used_coupon
			from 
			experiment e 
			where assign_t_c <= '11/29/2020'
		join
			orders o 
		e.user_id = o.user_id 
			and order_t > assign_t_c
		left join 
			coupon c 
		e.user_id = c.user_id 
		

)

select group_id, count(distinct order_id) as total_orders , sum(cust_used_coupon) as total_users_used_coupons
from 
	get_group_orders
	group by 1
	order by 2 desc 
	





