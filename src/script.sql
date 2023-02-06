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