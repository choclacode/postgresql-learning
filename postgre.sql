
select * from persons;

select *
from persons
order by country_of_birth, gender desc, date_of_birth;

select distinct country_of_birth
from persons
order by country_of_birth;

select * from persons offset 5 limit 5;

select * from persons offset 10 fetch first row only;
select * from persons offset 10 fetch first 10 row only;

select *
from persons
where
  country_of_birth in ('China', 'United States')
order by country_of_birth, gender desc, date_of_birth;

select *
from persons
where date_of_birth
  between date '2005-01-01' and '2012-12-31'
order by country_of_birth, gender desc, date_of_birth;

-- % any character
-- _ single character
select * from persons where email like '%.%';
select * from persons where country_of_birth ilike '__na%';

select
  country_of_birth,
  count(*)
from persons
group by
  country_of_birth
  having count(*) >= 20
order by country_of_birth;

select max(price) from cars;
select min(price) from cars;
select round(avg(price)) from cars;

select
  make, model, min(price)
from cars
group by
  make, model
order by
  make, model;

select sum(price) from cars;

select
  make, sum(price)
from cars
group by make
order by make;

-- + - * / % ^ !
select
  22 + 7 as add,
  22 - 7 as subtract,
  22 * 7 as multiply,
  22 / 7 as divide,
  22 % 7 as modulus,
  22 ^ 7 as power,
  7! as factorial;

select
  id, make, model, price,
  round(price * .1, 2) as discount,
  round(price - (price * .1), 2) as price_after_discount
from cars;

select
  id,
  coalesce(email, 'email not provided')
from persons;

select coalesce(10 / nullif(0, 0), 0);

select
  now(),
  now()::date,
  now()::time;

select
  now() - interval '1 year',
  now() - interval '5 months',
  (now() + interval '24 days')::date;

select
  extract(year from now()) as year,
  extract(month from now()) as month,
  extract(day from now()) as day,
  extract(dow from now()) as day_of_week,
  extract(century from now()) as century,
  extract(hours from now()) as hours,
  extract(minutes from now()) as minutes,
  extract(seconds from now()) as seconds;

alter table persons
drop constraint persons_pkey;

alter table persons
add primary key (id);

alter table persons
add constraint unique_email unique (email);

alter table persons
drop constraint unique_email;

alter table persons
add unique (email);

alter table persons
add constraint
  gender_constraint
  check (gender in ('Male', 'Female'));

delete from persons where id = 1001;

update persons
set
  email = 'lol@lol.lol',
  gender = 'Lol'
where id = 1001;
