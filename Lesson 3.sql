create database gt050525_be;
use gt050525_be;

-- Тип данных 
-- varchar(max_count) 
-- char(fixed_count)

-- Ограниченния/атрибуты 
-- primary key - not null + unique
-- not null - значение в поле не может быть незаполненным
-- unique - значения в поле должны быть уникальные
-- check(условие) - соответствует какому-либо условию
-- auto_increment - авто заполнения поля целыми числами
-- default - значение по умолчанию

create table test_table1(
	id int primary key auto_increment,
    first_name varchar(128) not null,
    last_name varchar(128) not null,
	user_name varchar(128) unique not null,
    age int check(age > 16) not null
);


-- Создать таблицу students
-- id целое число, уникальное значение, не null, автозаполнение 
-- firstname varchar not null
-- lastname varchar not null
-- class integer от 1 до 10 (вкл)
-- subject_name varchar not null
-- mark integer от 0 до 5 (вкл)
-- school_no integer по умолч. 0
-- checked char(1) значение Y либо N


create table students(
	id int primary key auto_increment,
    firstname varchar(128) not null,
    lastname varchar(128) not null,
    class int check(class between 1 and 10),
    subject_name varchar(128) not null,
    mark int check(mark between 0 and 5),
    school_no int default 0,
    checked char(1) check(checked in ('Y', 'N'))    
);

--  Создать таблицу staff с полями:
-- • id – целое число - первичный ключ с автозаполнением 
-- • firstname - строка максимум 60 символов не null
-- • lastname - строка максимум 100 символов не null
-- • position - строка максимум 100 символов
-- • age - целое число - от 0 до 110(вкл.)
-- • has_child – строка с одним символом - либо Y, либо N
-- • username - строка максимум 100 символов - уникальное значение не null

create TABLE staff(
id INT PRIMARY KEY AUTO_INCREMENT,
first_name VARCHAR(60) NOT NULL,
last_name VARCHAR(100) not NULL,
position VARCHAR(100),
age INT CHECK(age BETWEEN 0 and 110),
has_child CHAR(1) CHECK(has_child IN('Y', 'N')),
user_name VARCHAR(100) UNIQUE NOT NULL 
);

-- Ошибки при заполнении таблицы 
insert into staff
values ('John', 'Smith', 'Manager', 25, 'N', 'jsmith1');
-- Error Code: 1136. Column count doesn't match value count at row 1	0.016 sec

insert into staff (first_name, last_name, position, age, has_child, user_name)
values ('John', 'Smith', 'Manager', 25, 'N', 'jsmith1');


insert into staff (last_name, position, age, has_child, user_name)
values ('Smith', 'Manager', 25, 'N', 'jsmith1');
-- Error Code: 1364. Field 'first_name' doesn't have a default value	0.000 sec

insert into staff (first_name, last_name, position, age, has_child, user_name)
values ('John', 'Smith', 'Manager', 250, 'N', 'jsmith1');
-- Error Code: 3819. Check constraint 'staff_chk_1' is violated.

insert into staff (first_name, last_name, position, age, has_child, user_name)
values ('John', 'Smith', 'Manager', 25, 'М', 'jsmith1');
-- Error Code: 3819. Check constraint 'staff_chk_2' is violated.

insert into staff (first_name, last_name, position, age, has_child, user_name)
values ('John', 'Smith', 'Manager', 25, 'N', 'jsmith1');
-- Error Code: 1062. Duplicate entry 'jsmith1' for key 'staff.user_name'

insert into staff (first_name, last_name, position, age, has_child, user_name)
values ('JohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohn', 'Smith', 'Manager', 25, 'N', 'jsmith2');
-- Error Code: 1406. Data too long for column 'first_name' at row 1

insert into staff (first_name, last_name, position, age, has_child, user_name)
values ('John', 'Smith', 'Manager', 25, 'NN', 'jsmith2');
-- Error Code: 1406. Data too long for column 'has_child' at row 1

insert into staff (firstname, last_name, position, age, has_child, user_name)
values ('John', 'Smith', 'Manager', 25, 'N', 'jsmith1');
-- Error Code: 1054. Unknown column 'firstname' in 'field list'

insert into staf (first_name, last_name, position, age, has_child, user_name)
values ('John', 'Smith', 'Manager', 25, 'N', 'jsmith1');
-- Error Code: 1146. Table 'gt050525_be.staf' doesn't exist

insert into staff (first_name, last_name, position, age, has_child, user_name)
values ('John', 'Smith', 'Manager', 'twenty-five', 'N', 'jsmith1');
-- Error Code: 1366. Incorrect integer value: 'twenty-five' for column 'age' at row 1

insert into staff (first_name, last_name, position, age, has_child, user_name)
values ('John', 'Smith', 5, 25, 'N', 'jsmith2');

insert into staff (first_name, last_name, position, age, has_child, user_name)
values ('John', 'Smith', 'Manager', '25', 'N', 'jsmith3');

insert into staff (first_name, last_name, position, age, has_child, user_name)
values ('John', null, 'Manager', '25', 'N', 'jsmith4');
-- Error Code: 1048. Column 'last_name' cannot be null

select * from staff;

-- Удаление таблицы 
drop table название_таблицы;
drop table if exists название_таблицы;

-- Удаление бд
drop database название_бд;
drop database if exists название_бд;

-- Создание бд с проверкой на наличие 
create database if not exists название_бд;



-- Изменение таблиц и столбцов 

-- alter table название таблицы 
-- add column new_column_name data_type [constraint] - добавление нового столбца (по умолч. в конец)
-- drop column dropped_column_name - удаление столбца
-- modify column modified_column_name new_data_type - изменение типа данных столбца
-- rename column current_column_name to new_column_name - переименование столбца
-- change column current_column_name new_column_name new_data_type - переименование и именение типа столбца

-- first
-- after column_name
-- before column_name

select * from students;

-- Добавить столбец age тип - целое число.
alter table students
add column age int;

-- Удалить поле age
alter table students
drop column age;

-- Добавить поле age тип - int. Вставить после lastname.
alter table students
add column age int after lastname;

-- Изменить тип поля age на decimal(5, 2)
alter table students
modify column age decimal(5, 2);

-- Переименовать поле age на user_age
alter table students
rename column age to user_age;

-- Переименовать user_age на age и изменить тип на int.
alter table students
change column user_age age int;

-- Добавить поля username (varchar(128)) и password (varchar(128)). 
-- Удалить поле school_no. 
-- Переименовать поля firstname на first_name, lastname на last_name.

alter table students
add column username varchar(128),
add column password varchar(128),
drop column school_no,
rename column firstname to first_name,
rename column lastname to last_name;

-- Создать таблицу students1 с полями
-- fname строка(60) (не null)
-- lastname строка(100) (не null)
-- avg_mark целое число (от 0 до 5 вкл.)
-- gender строка(128)

create table students1(
	fname varchar(60) not null,
    lastname varchar(100) not null,
    avg_mark int check(avg_mark between 0 and 5),
    gender varchar(128)
);

-- Добавить поле id integer primary key auto_increment в начало таблицы
-- Добавить поле age (тип целое число) после lastname
-- Поменять тип у gender на char(1)
-- Переименовать поле fname на firstname

alter table students1
add column id int primary key auto_increment first;

alter table students1
add column age int after lastname;

alter table students1
modify column gender char(1);

alter table students1
rename column fname to firstname;


drop table staff;
drop table students;
drop table students1;
drop table test_table1;


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

select * from employees;

-- Вывести сотрудников, которые получают больше 10000.
select * from employees
where salary > 10000;

-- Вывести имена и фамилии сотрудников, которые работают в департаменте IT и получают больше 10000.
select first_name, last_name
from employees
where department = 'IT' and salary > 10000;

-- Обновление данных 

-- update table_name1
-- set column_name1 = new_value, column_name2 = new_value
-- [where условие];

-- Изменить департамент сотрудника "Steven", "King" на "IT".
update employees
set department = 'IT'
where first_name = 'Steven' and last_name = 'King';
-- Error Code: 1175. You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column.  To disable safe mode, toggle the option in Preferences -> SQL Editor and reconnect.

-- Откл. безопасного режима обновления данных 
set sql_safe_updates = 0;

update employees
set department = 'IT'
where first_name = 'Steven' and last_name = 'King';

-- Увеличить зарплату сотрудников из департамента IT на 1000.
update employees
set salary = salary + 1000
where department = 'IT';

-- Увеличить зарплаты всех сотрудников на 100.
update employees
set salary = salary + 100;

-- Вкл. безопасного режима обновления данных 
-- set sql_safe_updates = 1;
