create database gt050525;

use gt050525;

-- Обновление данных 
-- update table1
-- set column1 = new_value
-- [where condition]

-- Удаление данных
-- delete from table1
-- [where condition]

-- truncate table table1

-- Сортировка. ORDER BY
-- select *
-- from table1
-- order by column1 asc/desc

-- Получение диапазона строк. Оператор LIMIT
-- select * from table1
-- limit N/limit M, N

-- Оператор AS(как). Псевдонимы в MYSQL
-- select first_name as name, last_name as surname
-- from table1;

-- select 'Hello' as text;


-- drop table employees;

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

-- Функции для работы с числами (int/integer, numeric/decimal)

-- ROUND: округляет число. В качестве первого параметра передается число. 
-- Второй параметр указывает на длину. Если длина представляет положительное число, 
-- то оно указывает, до какой цифры после запятой идет округление. 
-- Если длина представляет отрицательное число, то оно указывает, 
-- до какой цифры с конца числа до запятой идет округление

select round(12.34) as result;
select round(1234.3415738, 2) as result;
select round(1234.3415738, -2) as result;

-- Вывести има и фамилии сотрудников, а также их текущие зарплаты и зарплаты+15%.
select first_name, last_name, salary, round(salary+(salary*15/100), 1) as new_salary
from employees;

-- TRUNCATE: оставляет в дробной части определенное количество символов
select truncate(12.34567, 2) as result;

-- CEILING: возвращает наименьшее целое число, которое больше или равно текущему значению.
select ceiling(12.34567); -- 13
select ceiling(12.1); -- 13
select ceiling(12.9); -- 13
select ceiling(-12.9); -- -12
select ceiling(-12.1); -- -12

-- FLOOR: возвращает наибольшее целое число, которое меньше или равно текущему значению.
select floor(12.34567); -- 12
select floor(12.1); -- 12
select floor(12.9); -- 12
select floor(-12.1); -- -13
select floor(-12.9); -- -13

-- ABS: возвращает абсолютное значение числа.
select abs(-12); -- 12
select abs(12); -- 12
select abs(-12.346); -- 12.346

-- POWER: возводит число в определенную степень.
select power(3, 2); -- 9
select pow(4, 3); -- 64

-- SQRT: получает квадратный корень числа.
select sqrt(225); -- 15

-- SIGN: возвращает -1, если число меньше 0, и возвращает 1, если число больше 0. Если число равно 0, то возвращает 0.
select sign(-12); -- -1
select sign(12); -- 1
select sign(0); -- 0

-- RAND: генерирует случайное число с плавающей точкой в диапазоне от 0 до 1.
select rand();
select round(rand()*10); -- 0 - 10 целые числа
select round(rand()*3 + 5); -- 5-8


-- Функции для работы со строками (все типы данных)
-- CONCAT: объединяет строки. 
-- В качестве параметра принимает от 2-х и более строк, которые надо соединить:
select concat('John', ' ', 'Smith') as result;

select concat(first_name, ' ', last_name) as full_name
from employees;

select concat('salary=', salary) as salary
from employees;

-- CONCAT_WS: также объединяет строки, но в качестве первого параметра принимает разделитель, который будет соединять строки:
select concat_ws(' ', first_name, last_name, salary) as info
from employees;

-- LENGTH: возвращает количество символов в строке. В качестве параметра в функцию передается строка, для которой надо найти длину:
select length('Hello');
select email, length(email) as email_lenght
from employees;

-- LTRIM: удаляет начальные пробелы из строки. В качестве параметра принимает строку:
select ltrim('  John   '); -- 'John   '

-- RTRIM: удаляет конечные пробелы из строки. В качестве параметра принимает строку:
select rtrim('  John   '); -- '  John'

-- TRIM: удаляет начальные и конечные пробелы из строки. В качестве параметра принимает строку:
select trim('  John   '); -- 'John'

-- LOCATE(find, search [, start]): возвращает позицию первого вхождения подстроки find в строку search. Дополнительный параметр start позволяет установить позицию в строке search, с которой начинается поиск подстроки find. Если подстрока search не найдена, то возвращается 0:
select email, locate('ER', email, 4)
from employees;

select email, locate('ER', email)
from employees;

select locate('ll', 'Hello'); -- 3

-- LEFT: вырезает с начала строки определенное количество символов. Первый параметр функции - строка, а второй - количество символов, которые надо вырезать с начала строки:
select left('john@gmail.com', 4); -- 'john'

-- RIGHT: вырезает с конца строки определенное количество символов. Первый параметр функции - строка, а второй - количество символов, которые надо вырезать с конца строки:
select right('john@gmail.com', 3); -- 'com'

-- Получить строку где будет первая бука фамилии, точка и потом имя.
-- 'L. FirstName'

select concat(left(last_name, 1), '. ', first_name) as full_name
from employees;

-- SUBSTRING(str, start [, length]): вырезает из строки str подстроку, начиная с позиции start. 
-- Третий необязательный параметр передает количество вырезаемых символов:
select substring('john@gmail.com', 5); -- '@gmail.com'
select substring('john@gmail.com', 5, 1); -- '@'

-- REPLACE(search, find, replace): заменяет в строке search подстроку find на подстроку replace. Первый параметр функции - строка, второй - подстрока, которую надо заменить, а третий - подстрока, на которую надо заменить:
select replace('john@gmail.com', 'gmail.com', 'mail.ru') as result; -- 'john@mail.ru'

select replace(department, 'Human Resources', 'HR')
from employees;

-- INSERT(str, start, length, insert): вставляет в строку str, заменяя length символов с позиции start подстрокой insert. 
-- Первый параметр функции - строка, второй - позиция, с которой надо заменить, третий - сколько символов с позиции start надо заменить вставляемой подстрокой, четвертый параметр - вставляемая подстрока:
select insert('iphone pro max', 7, 1, '16 ');

-- REVERSE: переворачивает строку наоборот:
select reverse('John'); -- 'nhoJ'

-- LOWER: переводит строку в нижний регистр:
select lower('Hello'); -- 'hello'

select lower(email)
from employees;

-- UPPER: переводит строку в верхний регистр
select upper('Hello'); -- 'HELLO'

-- SUBSTRING_INDEX(str, delimiter, count): вырезает из строки str подстроку. 
-- Параметр delimiter определяет разделитель внутри строки. 
-- А параметр count определяет, до какого вхождения разделителя надо вырезать подстроку. 
-- Если count положительный, то подстрока вырезается с начала, если count отрицательный, 
-- то с конца строки str:
select substring_index('john@gmail.com', '@', 1); -- 'john'
select substring_index('iphone 16 pro max', ' ', 1); -- 'iphone'
select substring_index('iphone 16 pro max', ' ', 2); -- 'iphone 16'
select substring_index('iphone 16 pro max', ' ', 3); -- 'iphone 16 pro'
select substring_index('iphone 16 pro max', ' ', -2); -- 'pro max'

-- pro, 3rd substring
select substring_index(substring_index('iphone 16 pro max', ' ', -2), ' ', 1); 
select substring_index(substring_index('iphone 16 pro max', ' ', 3), ' ', -1); 

-- 'boB brOwN' -> 'Bob Brown'
-- 'john smith' -> 'John Smith'
-- 'JOHN SMITH' -> 'John Smith'

select substring_index('boB brOwN', ' ', 1); -- first_name
select substring_index('boB brOwN', ' ', -1); -- last_name
select upper(left(substring_index('boB brOwN', ' ', 1), 1)); -- Первая буква в верхнем регистре
select lower(substring(first_name, 2)); -- имя без первой буквы в нижнем регистре
select concat(upper(left(substring_index('boB brOwN', ' ', 1), 1)), lower(substring(substring_index('boB brOwN', ' ', 1), 2)));

select concat(upper(left(substring_index('boB brOwN', ' ', 1), 1)), 
		lower(substring(substring_index('boB brOwN', ' ', 1), 2)),
        ' ',
        upper(left(substring_index('boB brOwN', ' ', -1), 1)),
        lower(substring(substring_index('boB brOwN', ' ', -1), 2))
        ) as full_name;


-- Функции CASE, IF, IFNULL, COALESCE

-- Функция CASE проверяет истинность набора условий и в зависимости от 
-- результата проверки может возвращать тот или иной результат. 

-- CASE
--     WHEN условие_1 THEN результат_1
--     WHEN условие_2 THEN результат_2
--     .................................
--     WHEN условие_N THEN результат_N
--     [ELSE альтернативный_результат]
-- END


-- Вывести имена, фамилии, зарплаты сотрудников, и поле salary_cat, где:
-- Если зарплата меньше 7000, то значение low
-- Если зарплата меньше 15000, то значение mid
-- Если зарплата больше/равна 15000, то значение high
-- Если зарплата указана неправильно, то значение undefined

select first_name, last_name, salary, 
		case
			when salary < 7000 then 'low'
            when salary < 15000 then 'mid'
            when salary >= 15000 then 'high'
            else 'undefined'
        end as salary_cat
from employees;


alter table employees
add column salary_cat varchar(64);

set sql_safe_updates = 0;

-- Вариант 1

update employees
set salary_cat = 'low'
where salary < 7000;

update employees
set salary_cat = 'mid'
where salary >= 7000 and salary < 15000;

update employees
set salary_cat = 'high'
where salary >= 15000;

-- Вариант 2

update employees
set salary_cat = case 		
						when salary < 7000 then 'low'
                        when salary < 15000 then 'mid'
                        when salary >= 15000 then 'high'
                        else 'undefined'
				  end;

-- Обновить зарплаты сотрудников:
-- если salary_cat равен low, увеличить зарплату на 10%
-- если salary_cat равен mid, увеличить зарплату на 5%

update employees 
set salary =
				case
						when salary_cat = 'low' then salary * 1.10
						when salary_cat = 'mid' then salary * 1.05
                        else salary
				  end;

select * from employees;

-- Функция IF

-- Функция IF в зависимости от результата условного выражения возвращает одно из двух значений. Общая форма функции выглядит следующим образом:
-- IF(условие, значение_1, значение_2)

select first_name, last_name, salary, if(salary >= 15000, 'high', 'low') as salary_cat2
from employees;

update employees
set salary = null
where employee_id in (4, 7, 10);

-- Функция IFNULL
-- Функция IFNULL проверяет значение некоторого выражения. Если оно равно NULL, то функция возвращает значение, которое передается в качестве второго параметра:
-- IFNULL(выражение, значение)

select salary, ifnull(salary, 0)
from employees;

update employees
set salary = ifnull(salary, 0);

-- COALESCE
-- Функция COALESCE принимает список значений и возвращает первое из них, которое не равно NULL:

-- COALESCE(выражение_1, выражение_2, выражение_N)

-- coalesce(email, phone, 'undefined');
-- coalesce(null, '+743427934', 'undefined'); -- '+743427934'
-- coalesce('john@gmail.com', null, 'undefined'); -- 'john@gmail.com'
-- coalesce('john@gmail.com', '+743427934', 'undefined'); -- 'john@gmail.com'
-- coalesce(null, null, 'undefined'); -- 'undefined'
