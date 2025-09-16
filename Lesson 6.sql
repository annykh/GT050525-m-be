-- Повторение
-- Функции

select * from employees;

-- Для сотурдников 'Diana' 'Lorentz', 'Bruce' 'Ernst' и 'Lex' 'De Haan' изменить значение 
-- зарплаты на NULL.

set sql_safe_updates = 0;

update employees
set salary = null
where (first_name = 'Diana' and last_name = 'Lorentz') or (first_name = 'Bruce' and last_name = 'Ernst')
	or (first_name = 'Lex' and last_name = 'De Haan');
    
    
-- Повысить зарплаты для отдела sales на 20%, для finance 15%, для shipping 10%, для marketing 25%, 
-- для Human Resources 20% и для IT 35%. 
-- Записать данные в новое поле new_salary. Поле создавать не нужно, используем AS.

select first_name, last_name, salary, 
		case
			when department = 'Sales' or department = 'Human Resources' then salary + salary * 20 / 100
            when department = 'Finance' then salary + salary * 15 / 100
			when department = 'Shipping' then salary + salary * 10 / 100
            when department = 'Marketing' then salary + salary * 25 / 100
            when department = 'IT' then salary + salary * 35 / 100
        end as new_salary
from employees;


-- Написать запрос, который выведет имя, фамилию и зарплату каждого сотрудника.
-- Если зарплата NULL, замените ее на 5000.     

select first_name, last_name, 
		case
			when salary is null then 5000
            else salary 
        end as salary
from employees;   

select first_name, last_name, coalesce(salary, 5000) as salary
from employees;

select first_name, last_name, ifnull(salary, 5000) as salary
from employees;

select first_name, last_name, if(salary is null, 5000, salary) as salary
from employees;

-- Написать запрос, который выведет имя, фамилию, зарплату и флаг (Да или Нет), 
-- указывающий, получает ли сотрудник в отделе "IT" зарплату выше 12000.
-- Вывести сотрудников из отдела "IT".
select first_name, last_name, salary, if(salary > 12000, 'Yes', 'No') as flag
from employees
where department = 'IT';


-- Соединение таблиц

-- Joins

-- employees - employee_id(primary key), first_name, last_name, salary, email, department_id(foreign key)
-- departments - id(primary key), department_name, location, manager_id(foreign key), description
-- manager - id(primary key), first_name, last_name, phone, email

-- Union/Union All

-- users_bremen - first_name, last_name, phone, email, bonuces
-- users_berlin - first_name, last_name, phone, email, bonuces


-- Вертикальное соединение 
-- UNION/UNION ALL

-- Оператор UNION позволяет обединить две однотипных выборки. 
-- Эти выборки могут быть из разных таблиц или из одной и той же таблицы.

-- select column1, column2, column3 from table1
-- union/union all
-- select column1, column2, column3 from table2

-- select * from table1
-- union/union all
-- select * from table2

create table user_bremen(
	id int primary key auto_increment,
    first_name varchar(128),
    last_name varchar(128),
    age int, 
    phone varchar(128),
    email varchar(128)
);

create table user_berlin(
	id int primary key auto_increment,
    first_name varchar(128),
    last_name varchar(128),
    age int,
    email varchar(128)
);

truncate table user_bremen;

insert into user_bremen (first_name, last_name, age, email, phone)
values ('John', 'Smith', 34, 'jsmith@gmail.com', '+1234890765'),
		('Linda', 'Jonson', 23, 'ljonson@gmail.com', '+37412345676'),
        ('Barbarra', 'Thomas', 45, 'bthomas@gmail.com', '+13427774568'),
        ('Ben', 'King', 54, 'bking@gmail.com', '+1009456888'),
		('Lucas', 'Jameson', 36, 'lujameson@gmail.com', '+1789098567');
        
insert into user_berlin (first_name, last_name, age, email)
values ('Carol', 'Robson', 35, 'crobson@gmail.com'),
		('Bob', 'Brown', 54, 'bbrown@gmail.com'),
        ('Barbarra', 'Thomas', 45, 'bthomas@gmail.com'),
        ('Mellissa', 'Wans', 20, 'mwans@gmail.com'),
        ('Laura', 'Smith', 34, 'lsmith@gmail.com');    
        
select * from user_berlin;
select * from user_bremen;

select * from user_berlin
union
select * from user_bremen;
-- Error Code: 1222. The used SELECT statements have a different number of columns


select first_name, last_name, age, email
from user_bremen
union
select first_name, last_name, age, email
from user_berlin;

select first_name, last_name, age, email
from user_bremen
union all
select first_name, last_name, age, email
from user_berlin;

-- Вывести имена, фамилии, возраст, эл. адресса и телефонные номера пользователей из двух магазинов. 
-- Если телефонный номер не указан, вывести null
select first_name, last_name, age, email, null as phone
from user_berlin
union 
select first_name, last_name, age, email, phone
from user_bremen;

-- Плохая практика

select first_name, last_name, age
from user_berlin
union
select first_name, last_name, salary
from employees;

select first_name, age
from user_berlin
union 
select first_name, email
from user_bremen;

select first_name, email
from user_berlin
union 
select first_name, age
from user_bremen;


-- Из таблицы user_berlin вывести пользователей, которым больше 30, соеденить с таблцей user_bremen, где пользователи которым меньше 30, и добавить  всех сотрудников из եմպլօըեես
select first_name, last_name, age
from user_berlin
where age > 30
union
select first_name, last_name, age
from user_bremen
where age < 30
union
select first_name, last_name, 0 as age
from employees;

-- Вывести сотрудников из employees которые получают больше 10000 или которые работают в IT
select * from employees
where salary > 10000
union all
select * from employees
where department = 'IT';

select * from employees
where salary > 10000 or department = 'IT';

-- Выведите имена, фамилии и телефонные номера пользователей из таблицы user_bremen.
-- Дополнительно выведите временное поле tel_number_code, в котором:
	-- Значение "USA" устанавливается, если номер телефона начинается с +1.
	-- Значение "Armenia" устанавливается, если номер телефона начинается с +374.

select first_name, last_name, phone, 
				case
					when phone like '+1%' then 'USA'
                    when phone like '+374%' then 'Armenia'
				end as tel_number_code
from user_bremen;

select first_name, last_name, phone, 'USA' as tel_number_code
from user_bremen
where phone like '+1%'
union
select first_name, last_name, phone, 'Armenia' as tel_number_code
from user_bremen
where phone like '+374%';



-- 1. Создать и заполнить таблицы products1 и products2.

create table products1(
	id int primary key,
    name varchar(50),
    quantity int check(quantity > 0 and quantity < 10),
    in_stock char(1) check(in_stock in ('Y', 'N'))
);

create table products2(
	id int primary key,
    name varchar(50),
    quantity int check(quantity > 0 and quantity < 10),
    price int check(price > 0),
    in_stock char(1) check(in_stock in ('Y', 'N'))
);

insert into products1
values (1, 'Велосипед', 2, 'Y'), 
		(2, 'Скейт', 4, 'Y'), 
		(3, 'Самокат', 2, 'Y'), 
		(4, 'Сноуборд', 7, 'N'), 
		(5, 'Санки', 1, 'Y'), 
		(6, 'Коньки', 3, 'N'), 
		(7, 'Ролики', 5, 'Y');

insert into products2 
values (1, 'Тюбинг', 5, 1000, 'Y'), 
		(2, 'Санки', 2, 1500, 'Y'), 
		(3, 'Снегокат', 2, 900, 'Y'), 
		(4, 'Сноуборд', 7, 700, 'N'), 
		(5, 'Клюшка', 8, 300, 'Y'), 
		(6, 'Коньки', 3, 350, 'N'), 
		(7, 'Форма', 9, 450, 'Y');
        
-- 2. Вывести названия товаров из обеих таблиц без дубликатов.
-- 3. Вывести названия товаров из обеих таблиц, включая дубликаты.
-- 4. Объединить данные из двух таблиц, указав price, где это возможно, где нет - указать null.
-- 5. Вывести все товары из обеих таблиц и добавить дополнительное поле source,
-- которое будет содержать 'P1' для товаров из products1 и 'P2' для товаров из products2.
-- Вывести название и source.
