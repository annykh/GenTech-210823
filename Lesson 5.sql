use gt210823;

create table phones(
	id int primary key auto_increment,
    product_name varchar(128) not null,
    product_count int, 
    starting_price int
);

insert into Phones(Product_Name, Product_Count, Starting_Price) 
	values('iPhone X', 3, 680),
	 ('iPhone XR', 2, 700),
	 ('iPhone XS', 10, 720),
	 ('iPhone 11', 1, 790),
	 ('iPhone 11 Pro', 12, 850),
	 ('iPhone 11 Pro Max', 2, 890),
	 ('iPhone SE', 1, 850),
	 ('iPhone 12 Mini', 15, 890),
	 ('iPhone 12', 20, 910),
	 ('iPhone 12 Pro', 5, 950),
	 ('iPhone 12 Pro Max', 13, 1000);
     
-- Оператор AS(alias) - как
select * from phones;

-- Вывести поля product_name, starting_price
select product_name, starting_price
from phones;

-- Вывести поля product_name как title, starting_price как price
select product_name as title, starting_price as price
from phones;

-- Вывести новое поле product_count*starting_price 
select product_name, product_count*starting_price as total_sum
from phones;

-- Создать новое поле total_sum
alter table phones
add total_sum int default 0;

-- Заполнить поле total_sum формулой product_count*starting_price
set sql_safe_updates = 0;

update phones
set total_sum = product_count*starting_price;

-- оператор CASE (if-else if-else) используют с select, update

-- CASE
-- 		When условие1 then результат1 (if ..)
--     When условие2 then результат2 (else if)
--     When условие3 then результат3 (else if)
--     ...
--     Else альтернативный результат (else)
-- END

-- Вывести product_name, product_count, новое временное поле count_info, заполнить ее: 
-- Если Product_Count меньше/равно 2, count_info = 'Товар заканчивается',
-- Если Product_Count меньше/равно 5, count_info = 'Мало товара',
-- Если Product_Count меньше/равно 10, count_info = 'Есть в наличии',
-- В остальных случаях count_info ='Много товара';

select product_name, product_count, case
										when product_count <= 2 then 'Товар заканчивается'
										when product_count <= 5 then 'Мало товара'
                                        when product_count <= 10 then 'Есть в наличии'
                                        else 'Много товара'
									end as count_info
from phones;

-- Создать новое поле count_info
alter table phones
add count_info varchar(128);

-- Заполнить поле count_info
update phones
set count_info = case
					when product_count <= 2 then 'Товар заканчивается'
					when product_count <= 5 then 'Мало товара'
					when product_count <= 10 then 'Есть в наличии'
					else 'Много товара'
				end;

select * from phones;

-- Вывести product_name как name, starting_price как price и новое временное поле tax 
-- Заполнить поле tax
-- Если начальная цена меньше/равно 700, tax = null,
-- если больше 700 и меньше 850, tax = 15,
-- если больше или равно 850, tax = 25

select product_name as name, starting_price as price, case
															when starting_price<=700 then null
                                                            when starting_price<850 then 15
                                                            else 25
														end as tax
from phones;

-- Создать новое поле tax целое число
-- Заполнить поле tax
-- Если начальная цена меньше 700, tax = null,
-- если больше либо равно 700 и меньше 850, tax = 15,
-- если больше или равно 850, tax = 25

alter table phones
add tax int default 0;

update phones
set tax = case
			when starting_price<=700 then null
			when starting_price<850 then 15
			else 25
		end;

select * from phones;

-- Посчитать конечную цену и представить его как Final_price(starting_price + starting_price*tax/100)
select product_name, starting_price, tax, starting_price + starting_price*tax/100 as final_price
from phones;

select product_name, starting_price, tax, 
										case
											when tax is null then starting_price
                                            else starting_price + starting_price*tax/100
                                        end as final_price
from phones;

-- Оператор COALESCE
-- COALESCE принимает список значений и возвращает первое из них, которое не равно NULL:
-- coalesce(value1, value2, value3...)

select product_name, starting_price, tax, 
coalesce(starting_price + starting_price*tax/100, starting_price) as final_price
from phones;

-- Создать поле final_price и заполнить по формуле starting_price + starting_price*tax/100
alter table phones
add final_price decimal(10, 3);

update phones
set final_price = coalesce(starting_price + starting_price*tax/100, starting_price);

create table users1(
	id int primary key auto_increment,
    first_name varchar(128),
    last_name varchar(128),
    phone varchar(128),
    email varchar(128));
    
insert into users1(first_name, last_name, phone, email)
values ('Tom', 'Smith', '+1234567', null),
		('Bob', 'Brown', '+1255432', 'brown@gmail.com'),
        ('John', 'Whatson', null, 'john@gmail.com'),
        ('Ally', 'Chavchavadze', null, 'ally@gmail.com');
        
-- Высести новое поле contacts(либо phone, либо email)
select first_name, last_name, case
									when phone is null then email
                                    else phone
								end as contacts
from users1;

select first_name, last_name, coalesce(phone, email) as contacts
from users1;

insert into users1(first_name, last_name, phone, email)
values ('Armen', 'Ayvazyan', null, null);

select * from users1;

select first_name, last_name, coalesce(phone, email, 'не определено') as contacts
from users1;

-- Создать поле contacts и заполнить phone/email/'не определено'
alter table users1
add contacts varchar(128);

update users1
set contacts = coalesce(phone, email, 'не определено');


-- Функции для работы с числами

-- ABS: возвращает абсолютное значение числа.
select abs(-123);

-- round: округляет число. В качестве первого параметра передается число. Второй параметр указывает на длину. 
-- Если длина представляет положительное число, то оно указывает, до какой цифры после запятой идет округление
select round(123.34); 
select round(123.34235, 2); 

-- ceiling: возвращает наименьшее целое число, которое больше или равно текущему значению.
select ceiling(123.34); 

-- floor: возвращает наибольшее целое число, которое меньше или равно текущему значению.
select floor(123.34); 

-- power:  возводит число в определенную степень.
select power(5, 3);

select product_name, round(final_price) as final_price1
from phones;

-- sqrt: получает квадратный корень числа.
select sqrt(225);

-- Функции для работы со строками

-- concat: объединяет строки. В качестве параметра принимает от 2-х и более строк, которые надо соединить:
select concat('Tom', ' ', 'Smith');

select * from users1;

select concat(first_name, ' ', last_name) as full_name
from users1;

select concat(firstname, ' ', lastname, ' ', age) as information
from staff;

-- concat_ws: также объединяет строки, но в качестве первого параметра принимает разделитель, 
-- который будет соединять строки:
select concat_ws(' ', firstname, lastname, age) as information
from staff;

-- length:возвращает количество символов в строке. В качестве параметра в функцию передается строка, 
-- для которой надо найти длину:
select lastname, length(lastname) as length
from staff;

-- trim: удаляет начальные и конечные пробелы из строки. В качестве параметра принимает строку:
select trim('   Tom   ');

-- ltrim: удаляет начальные пробелы из строки. В качестве параметра принимает строку:
select ltrim('   Tom   ');

-- rtrim: удаляет конечные пробелы из строки. В качестве параметра принимает строку:
select rtrim('   Tom   ');

-- left: вырезает с начала строки определенное количество символов. 
-- Первый параметр функции - строка, а второй - количество символов, которые надо вырезать с начала строки:
select left('Anastasia', 5);

-- right: вырезает с конца строки определенное количество символов. 
-- Первый параметр функции - строка, а второй - количество символов, которые надо вырезать с конца строки:
select right('Anastasia', 5);


-- substring(str, start, [length]): вырезает из строки str подстроку, начиная с позиции start. 
-- Третий необязательный параметр передает количество вырезаемых символов:
select substring('iPhone 15 pro max', 8);
select substring('iPhone 15 pro max', 8, 2);

-- replace(search, find, replace): заменяет в строке search подстроку find на подстроку replace. 
-- Первый параметр функции - строка, второй - подстрока, которую надо заменить, 
-- а третий - подстрока, на которую надо заменить:
select replace('iPhone 15 pro max', '15', '14');

-- reverse: переворачивает строку наоборот:
select reverse('abcd');

-- lower: переводит строку в нижний регистр:
select lower('APPLE');

-- upper: переводит строку в верхний регистр
select upper('apple');