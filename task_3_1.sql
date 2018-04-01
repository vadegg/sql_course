use srcdt;

select 
    customer_rk,
    current_customers.lfm_nm as lfm_nm,
    number
from (
    select distinct
        customer_rk,
        concat(last_nm, ' ', first_nm, ' ', middle_nm) as lfm_nm
    from cd_customers
    where
        valid_from_dttm < now()
        and valid_to_dttm > now()
) current_customers

left join (
    select
        concat(last_nm, ' ', first_nm, ' ', middle_nm) as lfm_nm,
        count(*) as number
    from cd_customers
    where
        valid_from_dttm < now()
        and valid_to_dttm > now()
    group by lfm_nm
) b on b.lfm_nm = a.lfm_nm
order by number;
