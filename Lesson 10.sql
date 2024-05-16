create database test1;

use test1;

create table table1(
	id int primary key auto_increment,
    title varchar(128) not null,
    price int default 0,
    quantity int check(quantity>0)
);

insert into table1 
(title, price, quantity)
values ('ipad', 1000, 2);

-- ЗАДАЧИ
-- 1. Создать базу данных tasks.
create database tasks;

-- 2. Переключится на бд tasks.
use tasks;

-- 3. Создать таблицу с названием Employees, которая будет содержать информацию о сотрудниках компании. Таблица должна иметь следующие поля:

-- employee_id - уникальный идентификатор сотрудника (Primary Key, автозаполнение)
-- first_name - имя сотрудника (Not Null)
-- last_name - фамилия сотрудника (Not Null)
-- email - адрес электронной почты сотрудника (Unique, Not Null)
-- age - возраст сотрудника (больше или равно 18)

create table Employees(
	employee_id int primary key auto_increment,
    first_name varchar(128) not null,
    last_name varchar(128) not null,
    email varchar(128) unique not null,
    age int check(age>=18)
);

-- 4. Заполнить таблицу данными с помощью следующих записей:

-- Сотрудник с именем "John", фамилией "Doe", адресом электронной почты "john.doe@example.com" и возрастом 30 лет.
-- Сотрудник с именем "Jane", фамилией "Smith", адресом электронной почты "jane.smith@example.com" и возрастом 25 лет.
-- Сотрудник с именем "Michael", фамилией "Johnson", адресом электронной почты "michael.johnson@example.com" и возрастом 22 года.
-- Сотрудник с именем "Emily", фамилией "Brown", адресом электронной почты "emily.brown@example.com" и возрастом 19 лет.

insert into Employees(first_name, last_name, email, age)
values 
('John', 'Doe', 'john.doe@example.com', 30),
('Jane', 'Smith', 'jane.smith@example.com', 25),
('Michael', 'Johnson', 'michael.johnson@example.com', 22),
('Emily', 'Brown', 'emily.brown@example.com', 19);


select * from employees;

select first_name, last_name 
from employees
where age > 20;

-- (not) like 'a%' '%k' '_o%' 
-- (not) between min and max - between 20 and 30 - [20; 30]
-- (not) in (value1, value1, value3...)
-- is null, is not null 

select * from employees
where first_name in ('John', 'Bob', 'Jane');

-- 5. Найти всех сотрудников в возрасте от 20 до 30 лет.
select * from employees
where age between 20 and 30;

-- 6. Найти сотрудников с именами "John", "Jane" и "Michael".
select * from employees
-- where first_name in ('John', 'Michael', 'Jane');
where first_name = 'John' or first_name = 'Michael' or first_name  = 'Jane';

-- 7. Найти всех сотрудников, у которых адрес электронной почты заканчивается на ".com".
select * from employees
where email like '%.com';

-- alter table
-- add
-- drop
-- modify
-- rename/change

alter table employees
add manager varchar(128);

alter table employees
drop age;

alter table employees
modify email char(40);

alter table employees
change first_name firstname varchar(128);

-- 8. Добавить столбец salary, тип int, где значение по умолчанию будет 0.
alter table employees
add salary int default 0;

-- 9. Удалить столбец email, который больше не нужен.
alter table employees
drop email;

-- 10. Изменить тип данных столбца salary на DECIMAL(10,2), чтобы хранить зарплату с точностью до двух знаков после запятой.
alter table employees
modify salary decimal(10, 2);

update employees
set age = 40
where last_name = 'Smith';

-- You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column.  To disable safe mode, toggle the option in Preferences -> SQL Editor and reconnect.	0.016 sec

set sql_safe_updates = 0;

update employees
set age = 40
where last_name = 'Smith';

-- 11. Обновить возраст сотрудника с именем "John" на 32 года.
update employees
set age = 32
where first_name = 'John';

-- 12. Изменить фамилию сотрудника с именем "Emily" на "Jameson".
update employees
set last_name = 'Jameson'
where first_name = 'Emily';

-- 13. Обновить имя и фамилию сотрудника с именем "Jane" и фамилией "Smith" на "Jessica" и "Williams" соответственно.
update employees
set first_name = 'Jessica', last_name = 'Williams'
where first_name = 'Jane' and last_name = 'Smith';

-- case
-- 	when ... then ...
--     when ... then ...
--     else ...
-- end

-- 14. Создать столбец status (int)
alter table employees
add status int;

-- 15. Изменить тип данных столбца на varchar(128)
alter table employees
modify status varchar(128);

-- 16. Обновить столбец status для сотрудников в зависимости от их возраста. Если возраст сотрудника меньше 25, 
-- установить статус "Junior", иначе установить статус "Senior".
update employees
set status = case
				when age < 25 then 'Junior'
                else 'Senior'
			end;

select * from employees;

-- concat(firstname, lastname)
-- lenght(firstname)
-- left('Apple', 3) -- App
-- right('Apple', 3) -- ple
-- replace(email, '.com', '.net')
-- reverse('string') -- gnirts
-- lower('APPLE') -- apple
-- upper('apple') -- APPLE

-- round(12.123, 2) -- 12.12
-- abs(-12) -- 12
-- power(5, 2) -- 25
-- sqrt(225) -- 15
-- rand() 0-1

-- 17. Создать столбец full_name, который содержит полное имя сотрудника в формате "Имя Фамилия".
alter table employees
add full_name varchar(128);

update employees
set full_name = concat(first_name, ' ', last_name);

select * from employees;

-- 18. Удалить таблицу employees
drop table employees;

-- 19. Удалить базу данных tasks.
drop database tasks;

-- 20. Создать базу данных shop
-- https://github.com/NelliEfr/MySQL_databases/blob/main/shop.txt

drop database shop;
CREATE DATABASE shop;

USE shop;

CREATE TABLE SELLERS(
       SELL_ID    INTEGER, 
       SNAME   VARCHAR(20), 
       CITY    VARCHAR(20), 
       COMM    NUMERIC(2, 2),
             BOSS_ID  INTEGER
);
                                            
CREATE TABLE CUSTOMERS(
       CUST_ID    INTEGER, 
       CNAME   VARCHAR(20), 
       CITY    VARCHAR(20), 
       RATING  INTEGER
);

CREATE TABLE ORDERS(
       ORDER_ID  INTEGER, 
       AMT     NUMERIC(7,2), 
       ODATE   DATE, 
       CUST_ID    INTEGER,
       SELL_ID    INTEGER 
);

INSERT INTO SELLERS VALUES(201,'Олег','Москва',0.12,202);
INSERT INTO SELLERS VALUES(202,'Лев','Сочи',0.13,204);
INSERT INTO SELLERS VALUES(203,'Арсений','Владимир',0.10,204);
INSERT INTO SELLERS VALUES(204,'Екатерина','Москва',0.11,205);
INSERT INTO SELLERS VALUES(205,'Леонид ','Казань',0.15,NULL);


INSERT INTO CUSTOMERS VALUES(301,'Андрей','Москва',100);
INSERT INTO CUSTOMERS VALUES(302,'Михаил','Тула',200);
INSERT INTO CUSTOMERS VALUES(303,'Иван','Сочи',200);
INSERT INTO CUSTOMERS VALUES(304,'Дмитрий','Ярославль',300);
INSERT INTO CUSTOMERS VALUES(305,'Руслан','Москва',100);
INSERT INTO CUSTOMERS VALUES(306,'Артём','Тула',100);
INSERT INTO CUSTOMERS VALUES(307,'Юлия','Сочи',300);


INSERT INTO ORDERS VALUES(101,18.69,'2022-03-10',308,207);
INSERT INTO ORDERS VALUES(102,5900.1,'2022-03-10',307,204);
INSERT INTO ORDERS VALUES(103,767.19,'2022-03-10',301,201);
INSERT INTO ORDERS VALUES(104,5160.45,'2022-03-10',303,202);
INSERT INTO ORDERS VALUES(105,1098.16,'2022-03-10',308,207);
INSERT INTO ORDERS VALUES(106,75.75,'2022-04-10',304,202); 
INSERT INTO ORDERS VALUES(107,4723,'2022-05-10',306,201);
INSERT INTO ORDERS VALUES(108,1713.23,'2022-04-10',302,203);
INSERT INTO ORDERS VALUES(109,1309.95,'2022-06-10',304,203);
INSERT INTO ORDERS VALUES(110,9891.88,'2022-06-10',306,201);

use shop;

-- inner join
-- left join
-- right join
-- self join 

-- Вывести имя покупателя и сумму его заказа
select t1.cname, t2.amt
from customers t1
inner join orders t2
on t1.CUST_ID = t2.CUST_ID;

-- 21. Получить информацию о заказах, включая имена продавцов и их города. ORDER_ID, AMT, ODATE, SNAME, CITY
select t1.ORDER_ID, t1.AMT, t1.ODATE, t2.SNAME, t2.CITY
from orders t1
join sellers t2
on t1.SELL_ID = t2.SELL_ID;

-- 22. Вывести имя покупателя(CNAME), даты его заказа(ODATE) и имя продавца товара(SNAME).
select t1.CNAME, t2.ODATE, t3.SNAME
from customers t1
join orders t2
on t1.cust_id = t2.cust_id
join sellers t3
on t2.sell_id = t3.sell_id;

-- Вывести имя покупателя(CNAME), даты его заказа(ODATE) и имя продавца товара(SNAME). 
-- Вывести данные тех заказов где сумма заказа больше 2000.

select t1.CNAME, t2.ODATE, t3.SNAME
from customers t1
join orders t2
on t1.cust_id = t2.cust_id
join sellers t3
on t2.sell_id = t3.sell_id
where amt > 2000;

-- count()
-- min()
-- max()
-- sum()
-- avg()

-- Найти сумму всех заказов.
select sum(amt) as total
from orders;

-- group by

-- Вывести сумму заказа всех покупателей
select t1.cname, sum(t2.amt) as total
from customers t1
join orders t2
on t1.cust_id = t2.cust_id
group by t1.cname;

-- 23. Вывести кол/во продавцов.
select count(*) as sellers_count
from sellers;

-- 24. Найти общее количество продавцов в каждом городе. Вывести город и кол/во.
select city, count(*) as sellers_count
from sellers
group by city;

-- 25. Получить среднюю комиссию для продавцов в каждом городе.
select city, avg(comm) as avg_comm
from sellers
group by city;
