-- База данных - https://github.com/annykh/genTech/blob/main/store.sql
-- Тех. описание базы - https://github.com/annykh/genTech/blob/main/store_%D1%82%D0%B5%D1%85_%D0%BE%D0%BF%D0%B8%D1%81%D0%B0%D0%BD%D0%B8%D0%B5.txt

-- 1. Вывести список категорий(category_name) и товаров(product_name), которые относятся к этим категориям.
-- 2. Получить список всех товаров(product_name), включённых в заказы, с указанием их цен(price) и категорий(category_name).
-- 3. Найти заказы, содержащие товар "Laptop". Вывести order_id, order_date, first_name, last_name.
-- 4. Вывести даты заказов(order_date) и имена клиентов(first_name, last_name), которые их сделали.
-- 5. Вывести названия товаров(product_name), которые заказывал клиент с фамилией 'Smith'.
-- 6. Найти имена и фамилии клиентов, которые купили товары из категории "Electronics".
-- 7. Вывести названия товаров и их количество(quantity) в каждом заказе.
-- 8. Получить список всех товаров(product_name), включённых в заказ клиента с email 'john@example.com'.
-- 9. Вывести список всех заказанных товаров с указанием клиентов, которые их заказали.
-- 10. Получить список клиентов(first_name, last_name), которые заказали "Phone".

CREATE DATABASE store;
USE store;

-- Таблица клиентов
CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100)
);

-- Таблица товаров
CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100),
    price DECIMAL(10, 2),
    category_id INT
);

-- Таблица категорий товаров
CREATE TABLE categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(100)
);

-- Таблица заказов
CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE,
    total DECIMAL(10, 2)
);

-- Таблица деталей заказа
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10, 2)
);


-- Заполнение таблицы клиентов
INSERT INTO customers (first_name, last_name, email) VALUES
('John', 'Doe', 'john@example.com'),
('Jane', 'Smith', 'jane@example.com'),
('Alice', 'Johnson', 'alice@example.com'),
('Bob', 'Brown', 'bob@example.com'),
('Ben', 'King', 'ben@example.com'),
('Mike', 'Cors', 'mike@example.com'),
('Jack', 'Smith', 'jack@example.com'),
('Emma', 'King', 'emma@example.com');

-- Заполнение таблицы категорий товаров
INSERT INTO categories (category_name) VALUES
('Electronics'),
('Furniture'),
('Clothing'),
('Toys');

-- Заполнение таблицы товаров
INSERT INTO products (product_name, price, category_id) VALUES
('Laptop', 1000.00, 1),
('Table', 150.00, 2),
('T-shirt', 20.00, 3),
('Bed', 100.00, 2),
('Phone', 1520.00, 1),
('Skirt', 50.00, 3);

-- Заполнение таблицы заказов
INSERT INTO orders (customer_id, order_date, total) VALUES
(1, '2024-09-10', 1020.00),
(2, '2024-09-12', 170.00),
(3, '2024-09-09', 70.00),
(4, '2024-08-09', 1520.00);

-- Заполнение таблицы деталей заказа
INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
(1, 1, 1, 1000.00),
(1, 3, 1, 20.00),
(2, 2, 1, 150.00),
(2, 3, 1, 20.00),
(3, 3, 1, 20.00),
(3, 6, 1, 50.00),
(4, 5, 1, 1520.00);


select * from customers;
select * from products;
select * from orders;
select * from categories;
select * from order_items;

-- Получить список всех товаров(product_name), включённых в заказы, с указанием их цен(price) и категорий(category_name).

select distinct prod.product_name, prod.price, cat.category_name
from products as prod
join order_items as o_i
on prod.product_id = o_i.product_id
join categories as cat
on prod.category_id = cat.category_id;


-- Вывести названия товаров(product_name), которые заказывал клиент с фамилией 'Smith'.
select prod.product_name
from products as prod
join order_items as o_i
on prod.product_id = o_i.product_id
join orders as ord
on o_i.order_id = ord.order_id
join customers as cust
on ord.customer_id = cust.customer_id
where cust.last_name = 'Smith';


-- Найти имена и фамилии клиентов, которые купили товары из категории "Electronics".
select cust.first_name, cust.last_name
from customers as cust
join orders as ord
on cust.customer_id = ord.customer_id
join order_items as o_i
on ord.order_id = o_i.order_id
join products as prod
on o_i.product_id = prod.product_id
join categories as cat
on prod.category_id = cat.category_id
where cat.category_name = 'Electronics';

-- Вывести список всех заказанных товаров с указанием клиентов, которые их заказали.
select prod.product_name, cust.first_name, cust.last_name
from products as prod
join order_items as o_i
on prod.product_id = o_i.product_id
join orders as ord
on o_i.order_id = ord.order_id
join customers as cust
on ord.customer_id = cust.customer_id;

-- Получить список клиентов(first_name, last_name), которые заказали "Phone".
select cust.first_name, cust.last_name
from products as prod
join order_items as o_i
on prod.product_id = o_i.product_id
join orders as ord
on o_i.order_id = ord.order_id
join customers as cust
on ord.customer_id = cust.customer_id
where prod.product_name = 'Phone';


-- 11. Получить список всех заказов и их клиентов, отсортированный по дате заказа. Вывести first_name, last_name, order_date.
select cust.first_name, cust.last_name, ord.order_date
from customers as cust
join orders as ord
on cust.customer_id = ord.customer_id
order by ord.order_date;

-- 12. Вывести имена клиентов и даты их заказов, где общая сумма заказа(total) превышает 500. Отсортировать по имени клиента.
select cust.first_name, cust.last_name
from customers as cust
join orders as ord
on cust.customer_id = ord.customer_id
where ord.total > 500
order by cust.first_name, cust.last_name;

-- 13. Получить список товаров(product_name) из категории "Clothing", отсортированных по цене(price) по убыванию. Вывести первые 2 записи.
select prod.product_name
from products as prod
join categories as cat
on prod.category_id = cat.category_id
where cat.category_name = 'Clothing'
order by prod.price desc
limit 2;

-- 14. Найти все заказы, содержащие товары категории "Furniture". Вывести order_id и order_date.
select ord.order_id, ord.order_date
from orders as ord
join order_items as o_i
on ord.order_id = o_i.order_id
join products as prod
on o_i.product_id = prod.product_id
join categories as cat
on cat.category_id = prod.category_id
where cat.category_name = 'Furniture';

-- 15. Получить список всех заказов, где были куплены товары из категории "Clothing". Вывести order_id и order_date.
select distinct ord.order_id, ord.order_date
from orders as ord
join order_items as o_i
on ord.order_id = o_i.order_id
join products as prod
on o_i.product_id = prod.product_id
join categories as cat
on cat.category_id = prod.category_id
where cat.category_name = 'Clothing';


-- OUTER JOIN - LEFT JOIN, RIGHT JOIN

-- Второй распространенный вариант — внешнее соединение. 
-- Если внутреннее объединение имеет сходство с бинарным «и», то внешнее — несколько вариаций бинарного
-- «или». Такой JOIN более гибкий, он возвращает не только строгое пересечение между двумя таблицами, 
-- но и отдельные элементы, которые принадлежат только одному из множеств. Какому — зависит от типа.

-- Left Join. Возвращает пересечение множеств и все элементы из левой таблицы. 
-- Например, человек хочет посмотреть кино, но на русский фильм согласен, только если это боевик. 
-- Фильтр вернет ему все фильмы из множества «боевики», фильмы из подмножества «русские боевики», 
-- но других фильмов из множества «русские» там не будет.

-- Right Join. Работает по тому же принципу, но вместо левой таблицы — правая. 
-- То есть человек получит в результатах боевики, только если они русские.

-- Left Join с NULL. Возвращает данные из левой таблицы, но без пересечений с правой. 
-- Человеку покажутся все боевики, но русского кино и в частности русских боевиков среди них не будет.

-- Right Join с NULL. Соответственно, работает так же, но по отношению к «правой», второй таблице.

use hr;

select * from employees;
select * from departments;
select * from locations;

set sql_safe_updates = 0;
update employees
set department_id = 111
where employee_id = 205;

-- Вывести имена и фамилии всех сотрудников, и название департаментов, в которых они работают,
-- если департамент не указан или указан неправильно вывести null.
select emp.first_name, emp.last_name, dep.department_name
from employees as emp
left join departments as dep
on emp.department_id = dep.department_id;

-- Вариант 2 - right join
select emp.first_name, emp.last_name, dep.department_name
from departments as dep
right join employees as emp
on dep.department_id = emp.department_id;


-- Вывести тех сотрудников, у которых id департамента не указан или указан неправильно.
-- Проверку на is null лучше делать на поле primary key.
select emp.first_name, emp.last_name
from employees as emp
left join departments as dep
on emp.department_id = dep.department_id
where dep.department_id is null;

-- Вариант 2 - right join
select emp.first_name, emp.last_name
from departments as dep
right join employees as emp
on emp.department_id = dep.department_id
where dep.department_id is null;

-- Вывести департаменты, в которых никто не работает.
select dep.department_name
from departments as dep
left join employees as emp
on dep.department_id = emp.department_id
where emp.employee_id is null;

-- Вывести те города, в которых нет департаментов.
select city
from locations as loc
left join departments as dep
on loc.location_id = dep.location_id
where dep.department_id is null;

-- Вывести название(department_name) и адрес(street_address) тех департаментов, в которых никто не работает.
select dep.department_name, loc.street_address
from departments as dep
left join employees as emp
on dep.department_id = emp.department_id
join locations as loc
on loc.location_id = dep.location_id
where emp.employee_id is null;

-- select 
-- from departments
-- join locations
-- left join employees

-- select 
-- from employees
-- right join departments
-- join locations

-- select
-- from locations
-- join departments
-- left join employees

-- Вывести те страны, в которых нет департаментов.
select distinct cnt.country_name
from countries as cnt
join locations as loc
on cnt.country_id = loc.country_id
left join departments as dep
on dep.location_id = loc.location_id
where dep.department_id is null;

-- SELF JOIN = INNER JOIN/OUTER JOIN
-- employees(сотрудники) - employee_id(p_k), manager_id(f_k)
-- employees(менеджеры) - employee_id(f_k), manager_id(p_k)

-- Вывести имена и фамилии сотруников,а также имена и фамилии их менеджеров
select emp.first_name as emp_f_n, emp.last_name emp_l_n, mng.first_name as mng_f_n, mng.last_name as mng_l_n
from employees as emp 
join employees as mng
on emp.manager_id = mng.employee_id;

select mng.first_name as mng_f_n, mng.last_name as mng_l_n, emp.first_name as emp_f_n, emp.last_name as emp_l_n
from employees as emp 
join employees as mng
on emp.manager_id = mng.employee_id;

-- Вывести тех сотрудников, у которых менеджер Steven King.
select emp.first_name, emp.last_name
from employees as emp
join employees as mng
on emp.manager_id = mng.employee_id
where mng.first_name = 'Steven' and mng.last_name = 'King';

-- Вывести сотрудников, которые получают больше чем их менеджеры.
select emp.first_name, emp.last_name
from employees as emp
join employees as mng
on emp.manager_id = mng.employee_id
where emp.salary > mng.salary;

-- Вывести сотрудников, которые получают больше, чем Luis Popp.
select emp.first_name, emp.last_name
from employees as emp
join employees as temp
on temp.first_name = 'Luis' and temp.last_name = 'Popp' and emp.employee_id != temp.employee_id
where temp.salary < emp.salary;

-- Вывести сотрудников, которые работают в том же департаменте, где и Luis Popp.
select emp.first_name, emp.last_name
from employees as emp
join employees as temp
on temp.first_name = 'Luis' and temp.last_name = 'Popp' and emp.employee_id != temp.employee_id
where temp.department_id = emp.department_id;

-- Про SELF JOIN:
-- https://sky.pro/wiki/sql/osnovy-self-join-v-sql-ponyatie-i-realniy-primer-ispolzovaniya/
-- https://sky.pro/wiki/sql/self-join-v-sql-chto-eto-i-kak-ispolzovat/
