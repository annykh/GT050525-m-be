-- Таблица students:

create table students (
    student_id int primary key auto_increment,
    first_name varchar(128) not null,
    last_name varchar(128) not null,
    age int,
    grade varchar(10),
    city varchar(128)
);

insert into students(first_name, last_name, age, grade, city) values
("Anna", "Petrova", 20, "A", "Berlin"),
("Ivan", "Sidorov", 22, "B", "Munich"),
("Maria", "Ivanova", 19, "C", "Hamburg"),
("Dmitry", "Smirnov", 21, "A", "Berlin"),
("Olga", "Kuznetsova", 23, "B", "Cologne"),
("Nikolay", "Popov", 20, "C", "Frankfurt"),
("Elena", "Volkova", 22, "A", "Berlin"),
("Sergey", "Morozov", 19, "B", "Stuttgart"),
("Irina", "Sokolova", 21, "C", "Dresden"),
("Pavel", "Lebedev", 20, "A", "Leipzig");

-- Задания:

-- 1. Найдите самого старшего студента.
-- 2. Найдите самого младшего студента.
-- 3. Выведите первых двух студентов из города Berlin, отсортировав по возрасту.
-- 4. Выведите трёх студентов, которым больше 20 лет, но пропустите первых двух из списка.
-- 5. Выведите список уникальных городов, в которых живут студенты.
-- 6. Выведите имена и фамилии студентов, отсортировав их по возрасту по возрастанию.
-- 7. Выведите студентов с оценкой "A", отсортировав по фамилии.
-- 8. Выведите студентов младше 21 года, отсортировав их по имени по алфавиту.
-- 9. Измените фамилию студента Maria Ivanova на Petrova.
-- 10. Всем студентам из города Berlin увеличьте возраст на 1 год.
-- 11. Переведите студента Ivan Sidorov в группу с оценкой "A".
-- 12. Всем студентам с оценкой "C" измените оценку на "B".
-- 13. Удалите студента Pavel Lebedev.
-- 14. Удалите всех студентов из города Hamburg.
-- 15. Очистите таблицу students.
