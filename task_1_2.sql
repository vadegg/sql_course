use srcdt;

select monthly_income_amt
	from (
		select customer_rk, monthly_income_amt 
		from cd_customers
		where valid_to_dttm >= date('2014-12-31')
			and valid_from_dttm < date('2014-01-01')
			and monthly_income_amt is not null
	) gr
order by monthly_income_amt desc
limit 10;
