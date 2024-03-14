use gt210823;
drop table products;

-- Простые типы данных:

-- int/integer - целые числа
-- number/numeric/decimal - числовые данные
-- varchar(size) - Size максимальное кол/во символов. может хранить не более 255 символов.
-- char(size) - Size фиксированная длина


create table products(
	id int,
    title varchar(128),
    quantity int);
    
insert into products (id, title)
values (1, 'Apple'),
		(2, 'Orange'),
        (3, 'Kiwi');

-- insert into products
-- values (4, 'Pineapple'),	
-- 		(5, 'Banana');
-- Column count doesn't match value count 

insert into products
values (4, 'Pineapple', 10),	
		(5, 'Banana', 4);

select * from products;


-- Ограничения при создании таблицы 
-- NOT NULL - Значение в поле не может быть null 
-- UNIQUE - Значение в поле должно быть уникаьным
-- PRIMARY KEY - NOT NULL + UNIQUE
-- CHECK - Соответствует какому-либо условию

create table users (
	id int primary key,
	first_name varchar(128) not null,
    last_name varchar(128) not null,
    age int check(age>=18),
    email varchar(128) unique
    );
    
insert into users 
values (1, 'John', 'Smith', 12, 'john@gmail.com');
-- Check constraint 'users_chk_1' is violated.

insert into users 
values (1, 'John', 'Smith', 20, 'john@gmail.com');

insert into users
values (1, 'Bob', 'Brown', 39, 'john@gmail.com');
-- Duplicate entry '1' for key 'users.PRIMARY'

insert into users
values (2, 'Bob', 'Brown', 39, 'john@gmail.com');
-- Duplicate entry 'john@gmail.com' for key 'users.email'

insert into users
values (2, 'Bob', 'Brown', 39, 'bob@gmail.com');

select * from users;

select first_name, last_name, age
from users
where age between 10 and 100;

-- > < >= <= = !=

-- AND OR NOT

-- (NOT) LIKE
-- (NOT) BETWEEN
-- (NOT) IN
-- IS (NOT) NULL

create table workers(
	id int primary key auto_increment,
    first_name varchar(128) not null,
    gender char(1) check(gender in ('F', 'M', 'O')),
    age int check(age between 18 and 100),
    email varchar(128) check(email like '%gmail.com')
);


insert into workers(first_name, gender, age, email)
values ('John', 'M', 20, 'john@gmail.com');

insert into workers(first_name, gender, age, email)
values ('Lily', 'Female', 30, 'lily@yandex.ru');
-- Data too long for column 'gender'

insert into workers(first_name, gender, age, email)
values ('Lily', 'F', 30, 'lily@yandex.ru');
-- Check constraint 'workers_chk_3' is violated.

insert into workers(first_name, gender, age, email)
values ('Lily', 'F', 30, 'lily@gmail.com');

select * from workers; 

-- Создать таблицу staff с полями:
-- • id – integer - уникальное значение, не null, с автозаполнением 
-- • firstname - varchar - не null
-- • lastname - varchar - не null
-- • position - varchar
-- • age - integer - от 0 до 110
-- • has_child – либо Y, либо N
-- • username - varchar - уникальный

create table staff(
	id int primary key auto_increment,
    firstname varchar(128) not null,
    lastname varchar(128) not null,
    position varchar(128),
    age int check(age between 0 and 110),
    has_child char(1) check(has_child in ('Y', 'N')),
    username varchar(128) unique
);

INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
        ('Anna'
        , 'Khachaturyan'
        , 'Senior Teacher'
        , 22
        , 'N'
        , 'annakhach5'
        );
        
INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
        ('Tom'
        , 'Austin'
        , 'Junior Blogger'
        , 25
        , 'Y'
        , 'tom12345'
        );
INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
        ('Bill'
        , 'Lorentz'
        , 'Junior Web Developer'
        , 40
        , 'Y'
        , 'billt1'
        );        
INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
        ('Lily'
        , 'May'
        , 'Junior Backend Developer'
        , 25
        , 'Y'
        , 'lil12'
        );
INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
        ('Nona'
        , 'Lucky'
        , 'Junior Teacher'
        , 20
        , 'N'
        , 'LuckyNona'
        ); 
INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
        ( 'Nancy'
        , 'Greenberg'
        , 'Middle UI Designer'
        , 32
        , 'Y'
        , 'nancy1'
        );        
INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
        ('Daniel'
        , 'Faviet'
        , 'Senior UX Designer'
        , 43
        , 'Y'
        , 'favietD'
        );        
INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
        ('Ally'
        , 'Austin'
        , 'Junior UI Designer'
        , 28
        , 'N'
        , 'ally1'
        );        
INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
        ('Lily'
        , 'Chen'
        , 'Senior Teacher'
        , 25
        , 'Y'
        , 'lilychen'
        );        
INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
        ('Anna'
        , 'Austin'
        , 'Middle Teacher'
        , 34
        , 'Y'
        , 'anna28'
        );        
INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
        ('Alexander'
        , 'Lorentz'
        , 'Junior Backend Developer'
        , 25
        , 'N'
        , 'alex12345'
        );        
INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
        ('Ashley'
        , 'Lorentz'
        , 'Junior UX Designer'
        , 18
        , 'N'
        , 'lorentz99'
        );        
INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
        ('Tom'
        , 'Lucky'
        , 'Middle Blogger'
        , 34
        , 'Y'
        , 'lucky78'
        );        
INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
        ('Ashley'
        , 'Weiss'
        , 'Junior Blogger'
        , 18
        , 'N'
        , 'weiss11'
        );
INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
        ('Tom'
        , 'Weiss'
        , 'Junior UI Designer'
        , 18
        , 'N'
        , 'tom222'
        );   
INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
        ('Anna'
        , 'Bloom'
        , 'Middle UX Designer'
        , 20
        , 'N'
        , 'bloom5'
        );   
INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
        ('Tom'
        , 'Berg'
        , 'Middle Teacher'
        , 34
        , 'N'
        , 'tommy1'
        );   
INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
        ('Ashley'
        , 'Berg'
        , 'Senior Teacher'
        , 37
        , 'N'
        , 'ash89'
        );
INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
        ('Lily'
        , 'Weiss'
        , 'Middle Blogger'
        , 45
        , 'N'
        , 'lilyW1'
        );   
INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
        ('Anna'
        , 'Lorentz'
        , 'Senior UX Designer'
        , 31
        , 'N'
        , 'annlo1'
        );   
INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
        ('Ashley'
        , 'Weiss'
        , 'Middle UX Designer'
        , 18
        , 'N'
        , 'weiss1'
        );       
INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
        ('Anna'
        , 'Keren'
        , 'Junior UX Designer'
        , 34
        , 'N'
        , 'annaK1'
        );       
        
select * from staff;

-- Найти список работников, которым больше 30 лет и у них нет детей
select * from staff
where age > 30 and has_child = 'N';

-- Найти список работников, у которых имя начинается с буквы А и у них нет детей
select * from staff
where firstname like 'A%' and has_child = 'N';

-- Найти список работников, у который юзернейм заканчивается на ‘1’
select * from staff
where username like '%1';

-- Найти список работников, которым меньше 25, у них младший уровень должности(Junior) и у них нет детей
select * from staff
where age < 25 and position like 'Junior%' and has_child = 'N';

-- Найти список работников с именем Анна, у которых уровень должности либо средний(Middle), либо старший(Senior)
select * from staff
where firstname = 'Anna' and (position like 'Middle%' or position like 'Senior%');

select * from staff
where firstname = 'Anna' and position not like 'Junior%';

-- create database имя_бд;
-- drop database имя_бд;
-- drop table имя_таблицы;

-- Изменение таблиц и столбцов
-- alter table имя_таблицы 
-- add (column) имя_столбца тип_данных (ограничения)
-- drop (column) имя_столбца
-- modify (column) имя_столбца новый_тип (ограничения)
-- change (column) имя_столбца новое_имя_столбца тип_данных

select * from products;

-- Добавить новый столбец quality
alter table products
add quality int;

-- Добавить новый столбец price
alter table products
add price int default 0;

-- Удалить столбец quantity
alter table products
drop quantity;

-- Изменить тип price на decimal(3, 2)
alter table products
modify price decimal(3, 2);

-- Переименовать price на item_price
alter table products
change price item_price decimal(3, 2);

-- Добавить новое поле count тип int и удалить поле quality
alter table products
add count int,
drop quality;

-- Добавить поле description varchar(128) поле title
alter table products
add description varchar(128) after title;

-- Удалить поле id, добавить поле item_id в начало
alter table products
drop id,
add item_id int primary key auto_increment first;