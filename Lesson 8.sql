create database test;

use test;

create table Students(
	id int primary key auto_increment,
    name varchar(128) not null,
    age int
);

create table Teachers(
	id int primary key auto_increment,
    name varchar(128) not null,
    age int
);

create table Competencies(
	id int primary key auto_increment,
    title varchar(128) not null
);


create table Teachers2Competencies(
	id int primary key auto_increment,
    teacher_id int,
    competencies_id int
);

create table Courses(
	id int primary key auto_increment,
    teacher_id int, 
    title varchar(128) not null,
    headman_id int
    );

create table Students2Courses(
	id int primary key auto_increment,
    student_id int,
    course_id int
);

insert into Students (name, age)
values ('Анатолий', 29),
	('Олег', 25),
    ('Семен', 27),
    ('Олеся', 28),
    ('Ольга', 31),
    ('Иван', 22);

insert into teachers (name, age) values ('Петр', 39);
insert into teachers (name, age) values ('Максим', 35);
insert into teachers (name, age) values ('Антон', 37);
insert into teachers (name, age) values ('Всеволод', 38);
insert into teachers (name, age) values ('Егор', 41);
insert into teachers (name, age) values ('Светлана', 32);

insert into Competencies (title) values ('Математика');
insert into Competencies (title) values ('Информатика');
insert into Competencies (title) values ('Программирование');
insert into Competencies (title) values ('Графика');

insert into Teachers2Competencies (teacher_id, competencies_id) values (1, 1);
insert into Teachers2Competencies (teacher_id, competencies_id) values (2, 1);
insert into Teachers2Competencies (teacher_id, competencies_id) values (2, 3);
insert into Teachers2Competencies (teacher_id, competencies_id) values (3, 2);
insert into Teachers2Competencies (teacher_id, competencies_id) values (4, 1);
insert into Teachers2Competencies (teacher_id, competencies_id) values (5, 3);

insert into courses (teacher_id, title, headman_id) values (1, 'Алгебра логики', 2);
insert into courses (teacher_id, title, headman_id) values (2, 'Математическая статистика', 3);
insert into courses (teacher_id, title, headman_id) values (4, 'Высшая математика', 5);
insert into courses (teacher_id, title, headman_id) values (5, 'Javascript', 1);
insert into courses (teacher_id, title, headman_id) values (5, 'Базовый Python', 1);

insert into students2courses (student_id, course_id) values (1, 1);
insert into students2courses (student_id, course_id) values (2, 1);
insert into students2courses (student_id, course_id) values (3, 2);
insert into students2courses (student_id, course_id) values (3, 3);
insert into students2courses (student_id, course_id) values (4, 5);


-- Вывести имена студентов и курсы, которые они проходят

select t2.name, t3.title
from students2courses t1
join students t2
on t1.student_id = t2.id
join courses t3
on t1.course_id = t3.id;

-- Вывести имена всех студентов и курсов, если они есть
select t1.name, t2.course_id
from students t1
left join students2courses t2
on t1.id = t2.student_id;

select t1.name, t2.course_id
from students t1
right join students2courses t2
on t1.id = t2.student_id;

-- Вывести преподавателей(name), у которых нет компетенций
select t1.name
from teachers t1
left join teachers2competencies t2
on t1.id = t2.teacher_id
where competencies_id is null;

select t2.name
from teachers2competencies t1
right join teachers t2
on t1.teacher_id = t2.id
where competencies_id is null;

-- Найти курсы(title), которые не посещает ни один студент
select t1.title
from courses t1
left join students2courses t2
on t1.id = t2.course_id
where student_id is null;

-- Найти компетенции(title), которых нет ни у одного преподавателя
select t1.title
from competencies t1
left join teachers2competencies t2
on t1.id = t2.competencies_id
where teacher_id is null;

select t1.title, competencies_id
from competencies t1 
left join teachers2competencies t2
on t1.id = t2.competencies_id
where competencies_id is null;

-- Агрегации 

-- count - кол/во строк(not null)
-- max - максимальное значение
-- min - минимальное значение
-- avg - среднее значние
-- sum - сумма значений

use hr;

select * from employees;

-- Найти максимальную зарпалту по компании
select max(salary)
from employees;

-- Найти минимальную зарпалту по компании
select min(salary)
from employees;

-- Найти среднее значние зарплаты 
select avg(salary)
from employees;

-- Найти сумму всех зарплат
select sum(salary)
from employees;

-- Найти кол/во сотрудников в компании
select count(employee_id)
from employees;

-- Найти кол/во строк в таблице employees
select count(*)
from employees;

-- Найти кол/во строк из таблицы jobs
select count(*)
from jobs;

-- Найти среднее значние поля min_salary
select avg(min_salary)
from jobs;

-- Подзапросы 

-- select <column_nam>, ...
-- from (
-- 		select * from <table_name>
-- 	)

-- Найти сотрудников с зарплатой выше 10.000
select *
from employees
where salary > 10000;

-- Найти средную зарплату среди сотрудников с зарплатой выше 10.000
select avg(t1.salary)
from (
		select *
		from employees
		where salary > 10000
	) t1;
    
-- select <column_name>,...
-- from <table_name>
-- where <column_name> =(> < !=) (
-- 	select агрегация(<column_name> from <table_name>
-- )    

-- Найти сотрудников с зарплатой выше среднего. Вывести имя, фамилию и зарплату

-- 1. Найти средную зарплату
select avg(salary) 
from employees;

-- 2. Вывести имя, фамилию и зарплату всех сотрудников
select first_name, last_name, salary
from employees;

-- 3. Решение задачи
select first_name, last_name, salary
from employees
where salary > (
		select avg(salary) 
		from employees
    );
    
-- Вывести сотрудника/ов с максимальной зарплатой.

select max(salary)
from employees;

select first_name, last_name, salary
from employees;

select first_name, last_name, salary
from employees
where salary = (
		select max(salary)
		from employees
	);
    
create database homework;
use homework;