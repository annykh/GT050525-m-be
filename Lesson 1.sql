-- comment
/*
comment1
comment2
*/

-- Выборки

/* select * 
from table_name;

select column1, column2, column3, ... 
from table_name;
*/

/* SELECT column1, column2
FROM table_name; */

-- Вывести таблицу customers
/* select *
from customers; */

/* select *
from Customers; */

-- Вывести имена и фамилии пользователей из customers.
/* select first_name, last_name
from customers; */

-- Вывести поля first_name, age, country из customers.
/* select first_name, age, country
from customers; */


-- Ошибки
/* selet first_name, last_name
from customers; */
-- Error: near "selet": syntax error

/* select firstname, last_name
from customers; */
-- Error: no such column: firstname

/* select first_name, last_name
from employees; */
-- Error: no such table: employees

/* select first_name, last_name
from customers

select first_name, last_name
from customers */
-- Error: near "select": syntax error

-- Вывеси пользователей, которым больше 30.
/* select *
from customers
where age > 30; */

-- 1. from 
-- 2. where 
-- 3. select 

-- Вывеси пользователей, которым больше 40.
/* select *
from customers
where age > 40; */
-- SQL query successfully executed. However, the result set is empty.

-- Вывести имена и фамилии пользователей, которые из USA.
/* select first_name, last_name
from customers
where country = 'USA';

select first_name, last_name
from customers
where country = "USA";

select first_name, last_name
from customers
where country like 'usa'; 

select first_name, last_name
from customers
where country in ('USA'); */

-- Вывести имена и фамилии пользователей, которые не из USA.
/* select first_name, last_name
from customers
where country != 'USA';

select first_name, last_name
from customers
where country <> 'USA';

select first_name, last_name
from customers
where country not like 'usa'; 

select first_name, last_name
from customers
where country not in ('USA');
*/

-- Вывести пользователей, которым от 25 до 30.(вкл)
/* select *
from customers
where age >= 25 and age <= 30;

select *
from customers
where age between 25 and 30; */

-- Вывести пользователей, которым меньше 25 или больше 30.
/* select *
from customers
where age < 25 or age > 30;

select *
from customers
where age not between 25 and 30; */

-- Вывести пользователей, которые из USA или из UK.
-- Вывести пользователей из USA и UK.
/* select *
from customers
where country = 'USA' or country = 'UK';

select *
from customers
where country in ('USA', 'UK'); */

-- Вывести пользователей не из USA и UK.
/* select *
from customers
where country not in ('USA', 'UK');

select *
from customers
where country != 'USA' and country != 'UK';

select *
from customers
where not (country = 'USA' or country = 'UK'); */

-- Вывести пользователей, которым либо 25, либо 30, либо 28.
/* select *
from customers
where age in (25, 30, 28); */

-- LIKE
-- where column like 'шаблон'
-- % - любое кол/во любых символов
-- _ - один символ(любой)

-- Вывести пользователей, у которых имя начинается на букву 'b'.
/* select *
from customers
where first_name like 'b%'; */

-- Вывести пользователей, у которых имя начинается на 'jo'
/* select *
from customers
where first_name like 'jo%'; */

-- Вывести пользователей, у которых в имени есть 'b'.
/* select *
from customers
where first_name like '%b%'; */


-- Вывести пользователей, у которых вторая буква в имени 'o'.
/* select * 
from customers
where first_name like '_o%'; */

-- Вывести пользователей, у которых предпоследняя буква в имени 'r'.
/* select * 
from customers
where first_name like '%r_'; */

-- Вывести пользователей, у которых вторая буква в имени 'o', а предпоследняя буква 'h'.
/* select * 
from customers
where first_name like '_o%h_'; */

-- Вывести пользователей, у которых имя состоит из 4 букв.
/* select * 
from customers
where first_name like '____'; */

-- Вывести пользователей, у которых имя не начинается на букву 'b'.
/* select *
from customers
where first_name not like 'b%'; */

/* Вывести заказы, где сумма(amount) больше 1000.
Вывести заказы, где сумма от 400 до 600.
Вывести заказы, где название товара(item) не Mouse.
Вывести заказы, где название товара или Keyboard, или Monitor.
Вывести заказы, где название товара не начинается на 'M'.
Вывести заказы, где название товара содержит подстроку 'ou', а сумма меньше 300. */
