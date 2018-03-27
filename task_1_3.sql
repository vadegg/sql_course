use srcdt;

select
concat(substring(year(birth_dt), 1, 3), '0-е'),
birth_dt
from cd_customers
