use srcdt;

select
    count(customer_rk)
from (
    select customer_rk, count(*) as customer_num
    from cd_customers
    group by customer_rk
) grpb
where customer_num = 1;
