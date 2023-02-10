create table employee (
                          id bigserial not null primary key,
                          first_name varchar(60) not null ,
                          last_name varchar(60) not null ,
                          gender varchar(6) not null,
                          age int not null
);
insert into employee (first_name, last_name, gender, age)
values ('Petr','Petrov','man',18);
insert into employee (first_name, last_name, gender, age)
values ('Vasily', 'Vasilyev','man',20);
insert into employee (first_name, last_name, gender, age)
values ('Ivan','Ivanov','man',25);
select * from employee;
update employee set first_name='Ann', last_name='Popova',gender='woman',age=18 where id=1;
select * from employee;
delete from employee where id=1;
select * from employee;

-- домашняя работа 2
-- Задание 1


insert into employee (first_name, last_name, gender, age)
values ('Bob','Bobov','man',19);
insert into employee (first_name, last_name, gender, age)
values ('Viktor','Viktorov','man',20);
insert into employee (first_name, last_name, gender, age)
VALUES ('Vera','Sergeevna','woman',27);
select * from employee;

select first_name AS Имя,
       last_name AS Фамилия
from employee;

select last_name AS Фамилия,
       age AS Возраст
from employee
where age < 30
order by Возраст desc, Фамилия;

select last_name AS Фамилия,
       age AS Возраст
from employee
where age > 50
order by Возраст desc, Фамилия;

select last_name AS Фамилия,
       age AS Возраст
from employee
where age > 30 AND age < 50
order by Возраст desc, Фамилия;

select first_name AS Имя,
       last_name AS Фамилия,
       age AS Возраст
from employee
where age > 18 AND age < 30
order by Возраст desc, Имя, Фамилия;

select last_name AS Фамилия,
       id AS Номер
from employee
order by Фамилия desc;

select first_name AS Имя
from employee group by first_name
HAVING length(first_name)>4;

select last_name AS Фамилия
from employee group by last_name
HAVING length(last_name)<7;

-- Задание 2
update employee set first_name='Ivan', last_name='Ivanov' where id=2;
update employee set first_name='Ivan', last_name='Ivanov' where id=4;

select first_name AS Имя,
       sum(age) AS Возраст_Суммарный
from employee group by first_name;

select * from employee
where age=(
    select min(age)
    from employee
);

select first_name AS Имя,
       max(age) AS Максимальный_Возраст
from employee GROUP BY Имя
HAVING count(first_name)>1
order by Максимальный_Возраст;

--Задание Выборка данных и вложенные запросы


create table city (
                      city_id BIGSERIAL primary key ,
                      city_name varchar(20) not null
);
alter table employee
    add column city_id bigint references city(city_id);

select *
from employee;

insert into city (city_name)
values ('Moscow'),
       ('Peterbourg'),
       ('Novgorod');

update employee set city_id = (
    select city_id from city where city_name = 'Moscow'
)
where first_name = 'Ann';
update employee set city_id = (
    select city_id from city where city_name = 'Novgorod'
)
where first_name = 'Ivan';

update employee set city_id = (
    select city_id from city where city_name = 'Peterbourg'
)
where first_name = 'Vasily';

select * from city;
select * from employee;

insert into employee (first_name, last_name, gender, age) VALUES ('Vera', 'Sergeevna', 'woman',20);


select e.first_name, e.last_name, c.city_name
from employee e
         inner join city c on e.city_id = c.city_id;

select e.first_name, e.last_name, c.city_name
from city c
         right join employee e on c.city_id = e.city_id;

select e.first_name, e.last_name, c.city_name
from city c
         left join employee e on e.city_id = c.city_id;

insert into city (city_name) values ('Volgograd');

select e.first_name, c.city_name
from city c
         full join employee e on e.city_id = c.city_id;

select e.first_name, c.city_name
from city c
         cross join employee e;
