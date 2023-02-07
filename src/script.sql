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
from employee group by Имя, Фамилия;

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
order by id desc;

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

