use srcdt;

select 
    calendar_dt,
    count(*) as number
from (
    select
        calendar_dt,
        valid_to_dttm,
        valid_from_dttm
    from (
        select calendar_dt
        from calendar
        where 
            calendar_dt < now()
            and calendar_dt >= (
                select min(valid_from_dttm)
                from cd_customers
            )
    ) dates
    cross join cd_customers
    where calendar_dt >= valid_from_dttm
        and calendar_dt <= valid_to_dttm
) al
group by calendar_dt
order by calendar_dt;
