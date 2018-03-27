use srcdt;

select 
    year_birth,
    count(year_birth) as numb
from (
    select
        customer_rk,
        birth_dt,
        year(birth_dt) as year_birth
    from (
       select distinct
           customer_rk,
           birth_dt,
           monthly_income_amt
       from cd_customers
       where monthly_income_amt in (50000, 60000)
   ) t1
   group by customer_rk, birth_dt
   having count(customer_rk)=2
) t2
group by year_birth;
