use gt210823;

select * from staff;

-- Найти сотрудников с position Middle Teacher
select * from staff
where position = 'Middle Teacher';

-- Удаление из базы данных происходит с помощью команды "DELETE" (переводится с английского как "УДАЛИТЬ"). Функция удаляет не одну строку, а несколько, 
-- при этом выбирает для удаления строки по логике функции "SELECT". То есть чтобы удалить данные из базы, необходимо точно определить их.

-- Удалить из таблицы сотрудников с position Middle Teacher
delete from staff
where position = 'Middle Teacher';
-- You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column.

-- Чтобы отлючить безопасный режим обновлений 
set sql_safe_updates = 0;

delete from staff
where position = 'Middle Teacher';

-- Удалить сотрудников у которых есть дети
delete from staff
where has_child = 'Y';

-- UPDATE - ОБНОВИТЬ 
-- Изменить username пользователья с id 14 на abc123
update staff
set username = 'abc123'
where id = 14;
 
-- Изменить position на Middle Blogger для сотрудника Ashley Weiss
update staff
set position = 'Middle Blogger'
where firstname = 'Ashley' and lastname = 'Weiss';

-- Увеличить возраст на 1 всем сотрудникам
update staff
set age = age + 1;

-- Изменить position на Senior всем сотрудникам у которых position начинается на Senior
update staff
set position = 'Senior'
where position like 'Senior%';

-- Увеличить возраст на 3 сотруднику с id 15
update staff
set age = age + 3
where id = 15;

-- Увеличить возраст на 5 и поменять username на 12345 сотруднику с id 8
update staff
set age = age + 5, username = '12345'
where id = 8;


-- Создать таблицу customers
-- id целое число первичный ключ автоинкремент, 
-- first_name строка не null,
-- last_name строка не null,
-- age целое число больше 18,
-- phone integer не null,
-- order_name строка не null,
-- delivery_status целое число 1 или 0

create table customers(
	id int primary key auto_increment, 
    first_name varchar(128) not null,
    last_name varchar(128) not null,
    age int check(age>18),
    phone int not null,
    order_name varchar(128) not null, 
    delivery_status int check(delivery_status in (1, 0))
);

-- Удалить поля first_name и last_name 
alter table customers
drop column first_name,
drop column last_name;

-- Добавить поле full_name строка не null после id
alter table customers
add column full_name varchar(128) not null after id;

-- Переименовать поле id на customer_id
alter table customers
change id customer_id int auto_increment;

-- Добавить поле price целое число не null
alter table customers
add price int not null;

-- Изменить тип phone на строку 
alter table customers
modify phone varchar(128);

-- Удалить поле phone
-- Переименовать поле price на sum_price целое число не null
alter table customers
drop phone,
change price sum_price int not null;

select * from customers;


insert into customers(full_name, age, order_name, delivery_status, sum_price) 
			values( "Kris Krill" , 20 , "math_book, pen" , 0 , 9000 ) ,
				( "Kristin Brooks" , 50 , "notebook, pen, drawing_block" , 0 , 4500 ) ,
				( "Kristina Livshits" , 55 , "pencil, sharpener" , 1 , 2340 ) ,
				( "Kristina Nunez" , 43 , "math_book, eng_book, phil_book" , 1 , 18000 ) ,
				( "Kurtis Parham" , 19 , "pencil" , 1 , 350 ) ,
				( "Lai Kurtich" , 22 , "pen, sharpener" , 1 , 1200 ) ,
				( "Lakia Fitzen" , 21 , "notebook, pen" , 1 , 3500 ) ,
				( "Landon Neville" , 34 , "colored papers, pencil" , 1 , 2450 ) ,
				( "Latoria Siprasoeuth" , 32 , "pen, sharpener, rubber" , 1 , 4600 ) ,
				( "Laurice Goffredo" , 76 , "watercolors, drawing_block" , 1 , 1200 ) ,
				( "Laurice Grimstead" , 54 , "notebook" , 1 , 4500 ) ,
				( "Laurice Karl" , 19 , "colored papers" , 0 , 2250 ) ,
				( "Laveta Wida" , 34 , "pen, math_book" , 0 , 1170 ) ,
				( "Lecia Alvino" , 45 , "pencil, sharpener, notebook" , 1 , 9000 ) ,
				( "Lenore Sullivan" , 55 , "eng_book, notebook" , 1 , 175 ) ,
				( "Leon Schoepfer" , 67 , "notebook" , 0 , 600 ) ,
				( "Lexie Magee" , 54 , "watercolors, drawing_block, brushes" , 0 , 1750 ) ,
				( "Li Robleto" , 76 , "brushes, pencil, notebook" , 0 , 1225 ) ,
				( "Libby Krauss" , 78 , "brushes, watercolor" , 0 , 2300 ) ,
				( "Lillia Talbott" , 65 , "eng_book, pen, rubber" , 0 , 600 ) ,
				( "Linda Merida" , 54 , "notebook, pen, drawing_block" , 1 , 7700 ) ,
				( "Lisa Hughes" , 34 , "flag" , 1 , 5450 ) ,
				( "Lloyd Shackley" , 23 , "brushes, watercolor" , 1 , 4370 ) ,
				( "Lola Whitley" , 24 , "notebook" , 0 , 12200 ) ,
				( "Lonnie Colby" , 74 , "notepad" , 1 , 3375 ) ,
				( "Lorilee Bautista" , 24 , "pencil, sharpener" , 1 , 3800 ) ,
				( "Loris Thibadeau" , 54 , "notepad" , 1 , 4950 ) ,
				( "Lorita Koenig" , 59 , "flag" , 0 , 4425 ) ,
				( "Love Whistlehunt" , 47 , "notepad" , 1 , 5500 ) ,
				( "Lovie Ritacco" , 23 , "colored papers" , 1 , 3800 ) ,
				( "Loyd Huckeba" , 26 , "flag" , 0 , 300 ) ,
				( "Loyd Puchalla" , 25 , "notebook" , 1 , 3850 ) ,
				( "Luana Berends" , 38 , "pencil, sharpener, rubber" , 1 , 2725 ) ,
				( "Lucas Summerill" , 36 , "notepad, pen" , 0 , 2185 ) ,
				( "Luciano Lingenfelter" , 80 , "sharpener" , 1 , 6100 ) ,
				( "Lucila Heck" , 58 , "brushes, watercolor" , 1 , 1687.5 ) ,
				( "Luigi Nored" , 23 , "notepad" , 1 , 1900 ) ,
				( "Luis Pothoven" , 38 , "flag" , 1 , 2475 ) ,
				( "Luther Ardinger" , 49 , "notebook" , 1 , 2212.5 ) ,
				( "Mable Ballard" , 59 , "colored papers, pencil" , 1 , 2750 ) ,
				( "Maia Leggett" , 71 , "notepad" , 1 , 1900 ) ,
				( "Marc Domanski" , 58 , "rubber, pencil" , 1 , 4930 ) ,
				( "Marco Slivka" , 80 , "brushes, watercolor" , 1 , 2680 ) ,
				( "Margaret Bennett" , 82 , "pencil, sharpener, pen" , 1 , 1600 ) ,
				( "Marissa Pontius" , 69 , "notebook" , 1 , 9430 ) ,
				( "Markita Larner" , 58 , "notepad, flag" , 1 , 605 ) ,
				( "Martha Baker" , 38 , "colored papers, notebook" , 1 , 1030 ) ,
				( "Marvis Chou" , 27 , "pencil, sharpener" , 0 , 2180 ) ,
				( "Mary Barnes" , 28 , "brushes, watercolor" , 0 , 1655 ) ,
				( "Mary Wilson" , 78 , "notebook" , 0 , 2730 );

SELECT *
FROM customers;

-- Найти тех покупателей, у которых сумма заказа больше 4000 и меньше 8000
select * from customers
-- where sum_price > 4000 and sum_price < 8000;
where sum_price between 4001 and 7999;

-- Найти тех покупателей, которые заказывали math_book, но не eng_book. 
select * from customers
where order_name like '%math_book%' and order_name not like '%eng_book%';

--  Увеличить сумму заказа на 100 у тех покупателей, которые заказали карандаши(pencil). 
update customers
set sum_price = sum_price + 100
where order_name like '%pencil%'; 

-- Удалить записи тех покупателей, которые заказывали только тетради(notebook).
delete from customers
where order_name = 'notebook';
-- where order_name like 'notebook';

-- Поменять статус заказа на 1 для тех покупателей, у которых сумма заказа больше 1200 и статус заказа 0.
update customers
set delivery_status = 1
where sum_price > 1200 and delivery_status = 0;

 -- Удалить записи тех покупателей, у которых имя начинается на букву L, а фамилия заканчивается на O.
 delete from customers
 where full_name like 'l%o';
 
--   Сделать скидку на 10% для тех покупателей, у которых статус заказа 0. 
update customers
set sum_price = sum_price - (sum_price * 10/ 100)
where delivery_status = 0;

--  Сделать скидку на столько процентов, сколько лет покупателю, если ему меньше 30.
update customers
set sum_price = sum_price - sum_price * age/100
where age < 30;

-- Удалить записи тех покупателей, у которых статус доставки 0.
delete from customers
where delivery_status = 0;
