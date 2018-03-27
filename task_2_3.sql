use srcdt;

select age, count(*) from (
    select distinct
        customer_rk,
        timestampdiff(YEAR, birth_dt, curdate()) as age
    from cd_customers
) tg
where age <= 80 and age >= 15
group by age
order by age desc
