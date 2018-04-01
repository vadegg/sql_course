use srcdt;

select
    renewed_yr,
    sum(grow_index),
    sum(new_acc),
    sum(prol_acc)
from (
    select 
        year(b.renewed_dt) as renewed_yr,
        case when b.account_opening_amt / a.account_opening_amt > 1.5 then 1 else 0 end as grow_index,
        case when b.account_renewal_cnt = 1 then 1 else 0 end as new_acc,
        case when b.account_renewal_cnt > 1 then 1 else 0 end as prol_acc
    from core_account a
    cross join core_account b
    where 
    a.account_rk = b.account_rk and (a.expiration_dt = b.renewed_dt or b.account_renewal_cnt = 1 and a.account_renewal_cnt = 1)

) a
group by renewed_yr
order by renewed_yr;
