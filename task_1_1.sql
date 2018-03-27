use srcdt;

select 
	customer_rk,
	case 
		when customer_rk % 3 = 0 then 'M'
		when customer_rk % 3 = 1 then 'F'
		else null
	end as gender
from (
	select distinct customer_rk
	from cd_customers
	limit 10
) customers


