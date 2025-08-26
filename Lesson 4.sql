-- Обновление данных 

use gt050525_be;

-- https://github.com/annykh/GT050525-m-be/blob/main/employees.sql

select * from employees;

set sql_safe_updates = 0;

-- Изменить фамилию Luis Popp на Smith.
update employees
set last_name = 'Smith'
where first_name = 'Luis' and last_name = 'Popp';

-- Повысить зарплату работников отдела IT в 2 раза.
update employees
set salary = salary * 2
where department = 'IT';

-- Обновить имя и фамилию для Neena Kochhar. Изменить данные на Nena Kochar.
update employees
set first_name = 'Nena', last_name = 'Kochar'
where first_name = 'Neena' and last_name = 'Kochhar'; 

-- John Russell перевели в отдел Marketing и повысили зарплату на 5000. 
-- Измените данные для работника John Russell.
update employees 
set department = 'Marketing', salary = salary + 5000
where first_name = 'John' and last_name = 'Russell';

-- Всех сотурдников отдела Sales перевели в отдел Finance и повысли зарплаты на 1000. 
-- Изменить данные для этих сотрудников.
update employees
set department = 'Finance', salary = salary + 1000
where department = 'Sales';

-- Удаление данных 
-- delete from table_name1 -- название таблицы 
-- [where condition...]; -- условие 

-- Удалить сотрдника Adam Fripp из таблицы.
delete from employees
where first_name = 'Adam' and last_name = 'Fripp';

-- Удалить сотрудников, которые получают меньше 3000.
delete from employees
where salary < 3000;

-- Всех работников отдела Shipping уволили. Удалите работников Shipping из таблицы.
delete from employees
where department = 'Shipping';

-- Удалить сотрудников с employee_id 2, 7, 10.
delete from employees
-- where employee_id = 2 or employee_id = 7 or employee_id = 10
where employee_id in (2, 7, 10);

-- Удалить всех сотрудников из таблицы employees
delete from employees;

select * from employees;

insert into employees(first_name, last_name, email, salary, department) 
values("Steven","King",	"SKING", 24000, "Sales");

-- Очистить таблицу employees
truncate table employees;

-- Удалить таблицу employees
drop table employees;

create table employees(
 	employee_id int primary key auto_increment,
 	first_name varchar(128) not null,
 	last_name varchar(128) not null,
 	email varchar(128) not null,
 	salary int, 
	department varchar(128) not null
 );
 
insert into employees(first_name, last_name, email, salary, department) values("Steven","King",	"SKING", 24000, "Sales");
insert into employees(first_name, last_name, email, salary, department) values("Neena" , "Kochhar" , "NKOCHHAR" , 17000 , "Sales");
insert into employees(first_name, last_name, email, salary, department) values("Lex" , "De Haan" , "LDEHAAN" , 17000 , "Sales");
insert into employees(first_name, last_name, email, salary, department) values("Alexander" , "Hunold" , "AHUNOLD" , 9000 , "Finance");
insert into employees(first_name, last_name, email, salary, department) values("Bruce" , "Ernst" , "BERNST" , 6000 , "Finance");
insert into employees(first_name, last_name, email, salary, department) values("Valli" , "Pataballa" , "VPATABAL" , 4800 , "Finance");
insert into employees(first_name, last_name, email, salary, department) values("Diana" , "Lorentz" , "DIANALO" , 8800 , "Finance");
insert into employees(first_name, last_name, email, salary, department) values("Nancy" , "Greenberg" , "NGREENBE" , 12008 , "Shipping");
insert into employees(first_name, last_name, email, salary, department) values("Daniel" , "Faviet" , "DFAVIET" , 9000 , "Shipping");
insert into employees(first_name, last_name, email, salary, department) values("Jose Manuel" , "Urman" , "JMURMAN" , 7800 , "Shipping");
insert into employees(first_name, last_name, email, salary, department) values("Luis" , "Popp" , "LPOPP" , 6900 , "Shipping");
insert into employees(first_name, last_name, email, salary, department) values("Den" , "Raphaely" , "DRAPHEAL" , 11000 , "Marketing");
insert into employees(first_name, last_name, email, salary, department) values("Alexander" , "Khoo" , "AKHOO" , 3100 , "Marketing");
insert into employees(first_name, last_name, email, salary, department) values("Shelli" , "Baida" , "SBAIDA" , 2900 , "Marketing");
insert into employees(first_name, last_name, email, salary, department) values("Sigal" , "Tobias" , "STOBIAS" , 2800 , "Marketing");
insert into employees(first_name, last_name, email, salary, department) values("Matthew" , "Weiss" , "MWEISS" , 8000 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Adam" , "Fripp" , "AFRIPP" , 8200 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Payam" , "Kaufling" , "PKAUFLIN" , 7900 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Shanta" , "Vollman" , "SVOLLMAN" , 6500 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Kevin" , "Mourgos" , "KMOURGOS" , 5800 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Julia" , "Nayer" , "JNAYER" , 3200 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Adam" , "Markle" , "SMARKLE" , 2200 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Laura" , "Bissot" , "LBISSOT" , 3300 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Mozhe" , "Atkinson" , "MATKINSO" , 2800 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Joshua" , "Patel" , "JPATEL" , 2500 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Trenna" , "Rajs" , "TRAJS" , 3500 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("John" , "Russell" , "JRUSSEL" , 14000 , "IT");
insert into employees(first_name, last_name, email, salary, department) values("Karen" , "Partners" , "KPARTNER" , 13500 , "IT");
insert into employees(first_name, last_name, email, salary, department) values("Alberto" , "Errazuriz" , "AERRAZUR" , 12000 , "IT");
insert into employees(first_name, last_name, email, salary, department) values("Gerald" , "Cambrault" , "GCAMBRAU" , 11000 , "IT");
insert into employees(first_name, last_name, email, salary, department) values("Eleni" , "Zlotkey" , "EZLOTKEY" , 10500 , "IT");
insert into employees(first_name, last_name, email, salary, department) values("Adam" , "Vargas" , "PVARGAS" , 2500 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Laura" , "Errazuriz" , "AERRAZUR" , 12000 , "IT");

-- Удалить сотрудников, которые работают в департаменте Sales и получают меньше 4000.
delete from employees
where department = 'Sales' and salary < 4000;

-- "Adam" "Markle" перевели в департамент 'IT'. Обновить данные.
update employees
set department = 'IT'
where first_name = "Adam" and last_name = "Markle";

-- Удалить сотрудников, у которых id больше 30 и меньше 35.
delete from employees
where employee_id > 30 and employee_id < 35;
-- where employee_id between 31 and 34

-- Удалить сотрудников, у которых фамилия начинаются на 'A'.
delete from employees
where last_name like 'A%';

select * from employees;

-- Изменить зарплаты сотрудников департамента  'Sales' на 17000.
update employees
set salary = 17000
where department = 'Sales';


-- Выборки

-- Вывести названия департаментов из таблицы employees. 
select department
from employees;

-- Выборка уникальных значений. Оператор DISTINCT

-- Вывести уникальные названия департаментов из таблицы employees. 
select distinct department
from employees;

select department, salary
from employees;

select distinct department, salary
from employees;

-- Вывести имена(first_name) всех сотрудников.
select first_name
from employees;

-- Вывести только уникальные имена(first_name) из таблицы employees.
select distinct first_name
from employees;

-- Сортировка. ORDER BY

-- select * 
-- from table_name1
-- order by column_name1, column_name2 asc/desc;

-- Вывести всех сотрудников. Отстортировать выборку по возр. зарплат.
select *
from employees
order by salary;

-- Вывести всех сотрудников. Отстортировать выборку по убыв. зарплат.
select *
from employees
order by salary desc;

-- Вывести имена и фамилии сотрудников. Отсортировать по именам по алф. порядку.
select first_name, last_name
from employees
order by first_name;

-- Вывести имена, фамилии и зарплаты сотрудников, у которых зарплата меньше 5000. Отсортировать по именам по алф. порядку.
select first_name, last_name, salary
from employees
where salary < 5000
order by first_name;

-- Отсортировать по именам и после по фамилиям.
select first_name, last_name
from employees
order by first_name, last_name;

-- Отсортировать по фамилиям и после по именам.
select first_name, last_name
from employees
order by last_name, first_name;

-- Отсортировать по именам по алф. порядку и после по фамилиям в обр. порядке.
select first_name, last_name
from employees
order by first_name asc, last_name desc;

-- Вывести имена, фамилии и зарплаты сотрудников, которые работают в департаменте IT. 
-- Отсортировать выборку по убыванию зарплаты и по алфавитному порядку имени.
select first_name, last_name, salary
from employees
where department = 'IT'
order by salary desc, first_name asc;


-- Получение диапазона строк. Оператор LIMIT
-- limit N - N кол/во строк, которое нужно вывести
-- limit M, N - M кол/во строк, которое нужно пропустить, N кол/во строк, которое нужно вывести

-- select 
-- from 
-- where
-- order by
-- limit

-- Вывести первых трех сотрудников, которые зарабатывают больше 5000.
select * from employees
where salary > 5000
limit 3;

-- Вывести трех сотрудников, которые зарабатывают больше 5000, пропуская первых двух.
select * from employees
where salary > 5000
limit 2, 3;

-- Вывести двух сотрудников из отдела IT, пропуская первого.
select * from employees
where department = 'IT'
limit 1, 2;

-- Найти сотрдуника с самой высокой зарплатой. 
select * from employees
order by salary desc
limit 1;

-- Найти сотрудника с низкой зарплатой.
select * from employees
order by salary asc
limit 1;

-- Вывести первых двух сотрудников из отдела Sales, которые получают самые высокие зарплаты.
select * from employees
where department = 'Sales'
order by salary desc
limit 2;

-- Оператор AS(как). Псевдонимы в MYSQL
-- Оператор AS в MySQL (и SQL в целом) используется для присвоения псевдонима 
-- (временного имени) столбцу или таблице, что делает запросы более читаемыми и понятными. 
-- Псевдоним, созданный с помощью AS, существует только в рамках выполнения конкретного запроса.
 
select first_name as name, last_name as surname
from employees;

select 5 as nmb;

select 'Hello' as msg;
