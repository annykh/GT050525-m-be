-- https://github.com/annykh/genTech/blob/main/hr1.txt
  
-- Inner join

-- Горизонтальное соединение 
-- JOIN - Inner join / Outer join

-- INNER JOIN
-- Join позволяет объединять данные из таблиц "горизонтально". То есть указав
-- правило, по которым вы хотите объединять строки, join их объединяет.
-- При inner join в результирующую выборку попадут только те записи, которые
-- нашли себе пару по условию join (указанное после ключевого слова on).
-- Все остальные записи в результирующую выборку не попадут

-- select column1, column2, column3,...
-- from table1
-- [inner] join table2
-- on table1.column = table2.column 
-- [inner] join table3
-- on условие..

-- Пример
-- emp - emp_id, first_name, last_name, email, salary, dep_id
-- dep - dep_id, dep_name, dep_manager, dep_location, dep_emp_count

-- select first_name, last_name, dep_name, dep_location
-- from emp
-- join dep
-- on emp.dep_id = dep.dep_id;

use hr;

select * from employees;
select * from departments;
select * from locations;

-- Вывести имена, фамилии сотрудников, а также название департаментов, в которых они работают.
select employees.first_name, employees.last_name, departments.department_name
from employees
join departments
on employees.department_id = departments.department_id;

-- Можно сократить названия таблиц
select emp.first_name, emp.last_name, dep.department_name
from employees as emp
join departments as dep
on emp.department_id = dep.department_id;

-- Можно и без оператора AS
select emp.first_name, emp.last_name, dep.department_name 
from employees emp
join departments dep
on emp.department_id = dep.department_id;

-- Очередность выполнения команд
-- FROM
-- JOIN
-- ON
-- SELECT

-- Вывести название департамента и название улицы, где он находится.
select department_name, street_address
from departments
join locations
on departments.location_id = locations.location_id;

select department_name, street_address
from locations
join departments
on locations.location_id = departments.location_id;

-- Вывест все столбы из employees и все столбцы из departments.
select employees.*, departments.*
from employees
join departments
on employees.department_id = departments.department_id;

-- Вывести имена, фамилии, зарплаты, название департаментов сотрудников, 
-- которые из департаментов 'Sales', 'Shipping', 'IT'.
select emp.first_name, emp.last_name, emp.salary, dep.department_name
from employees emp
join departments dep
on emp.department_id = dep.department_id
where dep.department_name in ('Sales', 'Shipping', 'IT');

-- Вывести имена и фамилии сотрудников, которые работают в департаментах 'Sales', 'Shipping', 'IT'.
select emp.first_name, emp.last_name
from employees emp
join departments dep
on emp.department_id = dep.department_id
where dep.department_name in ('Sales', 'Shipping', 'IT');

-- Вывести название департаментов, которые находятся в городе 'Seattle'.
select dep.department_name
from departments as dep
join locations as loc
on dep.location_id = loc.location_id
where loc.city = 'Seattle';

-- ОШИБКИ
select first_name, last_name, department_name
from employees
join departments 
on department_id = department_id;
-- Error Code: 1052. Column 'department_id' in on clause is ambiguous

-- Решение
select first_name, last_name, department_name
from employees emp
join departments dep
on emp.department_id = dep.department_id;

select first_name, last_name, department_id, department_name
from employees emp
join departments dep
on emp.department_id = dep.department_id;
-- Error Code: 1052. Column 'department_id' in field list is ambiguous

-- Решение
select first_name, last_name, emp.department_id, department_name
from employees emp
join departments dep
on emp.department_id = dep.department_id;

select first_name, last_name, department_name
from employees emp
join departments dep;
-- Логическая ошибка

-- Решение
select first_name, last_name, department_name
from employees emp
join departments dep
on emp.department_id = dep.department_id;

select first_name, last_name, department_name
from employees emp
join departments dep
on emp.employee_id = dep.department_id;
-- Логическая ошибка

-- Решение
select first_name, last_name, department_name
from employees emp
join departments dep
on emp.department_id = dep.department_id;

select first_name, last_name, department_name as dep_name
from employees emp
join departments dep
on emp.department_id = dep.department_id
where dep_name = 'IT';
-- Error Code: 1054. Unknown column 'dep_name' in 'where clause'

-- Порядок написания запроса:
-- SELECT ..
-- FROM ...
-- JOIN ... ON ...
-- WHERE ...
-- ORDER BY ...
-- LIMIT ...

-- Порядок выполнения запроса:
-- FROM
-- JOIN ... ON ...
-- WHERE ...
-- SELECT ... 
-- ORDER BY ...
-- LIMIT ...

-- Сортировка по названиям департаментов
select first_name, last_name, department_name as dep_name
from employees emp
join departments dep
on emp.department_id = dep.department_id
order by dep_name;

-- Вывести имена, фамилии сотрудников, название их департаментов и города,  в которых находятся департаменты.
select first_name, last_name, department_name, city
from employees emp
join departments dep
on emp.department_id = dep.department_id
join locations loc
on dep.location_id = loc.location_id;

-- Вывести имена, фамилии сотрудников и города,  в которых находятся департаменты, где работают сотрудники.
select first_name, last_name, city
from employees emp
join departments dep
on emp.department_id = dep.department_id
join locations loc
on dep.location_id = loc.location_id;

-- Вывести имена и фамилии сотрудников, департаменты которых находятся в городе 'Oxford'.
select first_name, last_name
from employees emp
join departments dep
on emp.department_id = dep.department_id
join locations loc
on dep.location_id = loc.location_id
where loc.city = 'Oxford';

select * from countries;

-- Тех. описание таблиц

-- Table Employees
-- employee_id PRIMARY KEY
-- job_id FOREIGN KEY - Jobs
-- manager_id FOREIGN KEY - Employees
-- department_id FOREIGN KEY - Departments

-- Table Departments
-- department_id PRIMARY KEY
-- manager_id FOREIGN KEY - Employees
-- location_id FOREIGN KEY - Locations

-- Table Locations
-- location_id PRIMARY KEY
-- country_id FOREIGN KEY - Countries

-- Table Countries
-- country_id PRIMARY KEY
-- region_id FOREIGN KEY - Regions

-- Table Regions
-- region_id PRIMARY KEY

-- Table Jobs
-- job_id PRIMARY KEY

-- Вывести имена, фамилии сотрудников, название департаментов, в которых они работают,
-- города, в которых находятся департаменты и название стран, в которых находятся города.
select emp.first_name, emp.last_name, dep.department_name, loc.city, cnt.country_name
from employees as emp
join departments as dep
on emp.department_id = dep.department_id
join locations as loc
on dep.location_id = loc.location_id
join countries as cnt
on loc.country_id = cnt.country_id;

select emp.first_name, emp.last_name, dep.department_name, loc.city, cnt.country_name
from countries as cnt
join locations as loc
on cnt.country_id = loc.country_id
join departments as dep
on loc.location_id = dep.location_id
join employees as emp
on dep.department_id = emp.department_id;

select emp.first_name, emp.last_name, dep.department_name, loc.city, cnt.country_name
from locations as loc
join countries as cnt
on loc.country_id = cnt.country_id
join departments as dep
on loc.location_id = dep.location_id
join employees as emp
on dep.department_id = emp.department_id;

-- Вывести имена и фамилии сотрудников, департаменты которых находятся в стране 'United Kingdom'(country_name).
select emp.first_name, emp.last_name
from employees as emp
join departments as dep
on emp.department_id = dep.department_id
join locations as loc
on loc.location_id = dep.location_id
join countries as cnt
on cnt.country_id = loc.country_id
where cnt.country_name = 'United Kingdom';

-- Вывести имена и фамилии сотрудников, работающих в департаментах 'IT' и 'Shipping', с зарплатой выше 10000.
select first_name, last_name
from employees as emp
join departments as dep
on emp.department_id = dep.department_id
where dep.department_name in ('IT', 'Shipping') and salary > 10000;

select * from regions;

-- Вывести названия департаментов, расположенных в регионе 'Americas' (region_name).
select dep.department_name
from departments as dep
join locations as loc
on dep.location_id = loc.location_id 
join countries as cnt
on cnt.country_id = loc.country_id
join regions as reg
on reg.region_id = cnt.region_id
where reg.region_name = 'Americas';

select * from jobs;

-- Вывести имена, фамилии, зарплаты, названия департаментов,
-- должности сотрудников и их телефонные номера, начинающиеся с '650'.
select emp.first_name, emp.last_name, emp.salary, dep.department_name, jb.job_title, emp.phone_NUMERIC
from employees as emp
join jobs as jb
on emp.job_id = jb.job_id
join departments as dep
on dep.department_id = emp.department_id
where emp.phone_NUMERIC like '650%';

-- Вывести имена, фамилии и должности сотрудников, которые зарабатывают ровно минимальную или масимальную зарплату для должности.
select first_name, last_name, job_title
from employees as emp
join jobs as jb
on emp.job_id = jb.job_id
where emp.salary in (jb.max_salary, jb.min_salary);

-- Вывести имена, фамилии и зарплаты сотрудников, а также дополнительное поле currency (создавать его в таблице не нужно) со значением:
--   'USD', если департамент сотрудника находится в регионе 'Americas',
--   'EUR', если департамент находится в регионе 'Europe'.

select emp.first_name, emp.last_name, emp.salary, 
	case
		when reg.region_name = 'Americas' then 'USD'
        when reg.region_name = 'Europe' then 'EUR'
	end as currency
from employees as emp
join departments as dep
on emp.department_id = dep.department_id
join locations as loc
on dep.location_id = loc.location_id 
join countries as cnt
on cnt.country_id = loc.country_id
join regions as reg
on reg.region_id = cnt.region_id;
