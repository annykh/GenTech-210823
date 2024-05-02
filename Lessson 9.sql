-- avg()
-- sum()
-- max()
-- min()
-- count()

use hr;

-- group by
-- having


-- select column_name, ...
-- from table_name
-- [where условие]
-- [join ... on]
-- group by столбец
-- [having условие]
-- [order by столбец]

-- Найти кол/во сотрудников в компании
select count(*) as emp_count
from employees;

-- Найти кол/во сотрудников в каждом департаменте
select department_id, count(*) as emp_count
from employees
where department_id is not null
group by department_id;

-- Найти кол/во сотрудников в каждом департаменте. Отсортировать по кол/во.
select department_id, count(*) as emp_count
from employees
where department_id is not null
group by department_id
order by emp_count;

-- Вывести департамент с максимальным кол/вом сотрудников.
select department_id, count(*) as emp_count
from employees
where department_id is not null
group by department_id
order by emp_count desc
limit 1;

-- Найти кол/во сотрудников в каждом департаменте. Вывести те департаменты, где кол/во сотрудиков больше 5.
select department_id, count(*) as emp_count
from employees
where department_id is not null
group by department_id
having emp_count > 5;

-- Найти максимальную зарплату по департаментам.
select department_id, max(salary) as max_salary
from employees
where department_id is not null
group by department_id;

-- Вывести имена и фамилии сотрудников с максимальной зарпалтой в каждом депараменте
select t1.first_name, t1.last_name, t2.max_salary, t2.department_id
from employees t1
join (select department_id, max(salary) as max_salary
		from employees
		where department_id is not null
		group by department_id) t2
on t1.department_id = t2.department_id
where t1.salary = t2.max_salary;

-- Найти среднее зарплат по департаментам. avg_salary, department_id
select avg(salary) as avg_salary, department_id
from employees
where department_id is not null
group by department_id;

-- Найти минимальную зарплату для каждой должности. Вывести min_salary, job_id
select min(salary) as min_salary, job_id
from employees
group by job_id;

-- Найти сотрудников с минимальной зарплатой для каждой должности. Вывести first_name, last_name, salary, job_id
select t1.first_name, t1.last_name, t1.salary, t1.job_id
from employees t1
join (select min(salary) as min_salary, job_id
		from employees
		group by job_id) t2
on t1.job_id = t2.job_id
where t1.salary = t2.min_salary;

-- Посчитать кол/во городов в каждой стране из таблицы locations. Вывести city_count, country_id
select count(city) as city_count, country_id
from locations
group by country_id;

-- Вывести те депатраменты, в которых максимальная зарплата выше 10000. department_id, max_salary

select max(salary) as max_salary, department_id
from employees 
group by department_id
having max_salary > 10000;

-- Найти кол/во сотрудников в каждом департаменте. Вывести имя департамента и кол/во сотрудников.
select t1.department_name, t2.emp_count
from departments t1
join (
		select department_id, count(*) as emp_count
        from employees
        where department_id is not null
        group by department_id
) t2
on t1.department_id = t2.department_id;

-- Вывести название департаментов с кол/во сотрудников больше 5. Вывести department_name.
select t1.department_name, t2.emp_count
from departments t1
join (
		select department_id, count(*) as emp_count
        from employees
        where department_id is not null
        group by department_id
        having emp_count > 5
) t2
on t1.department_id = t2.department_id;

-- Вывести название должности(job_title) и маскимальную зарплату этой должности.
select t1.job_title, t2.max_salary
from jobs t1
join (select job_id, max(salary) as max_salary
		from employees
		group by job_id) t2
on t1.job_id = t2.job_id;

-- Найти количество сотрудников у каждого менеджера. Вывести manager_id и employees_cnt
select manager_id, count(*) as employees_cnt
from employees
where manager_id is not null
group by manager_id;

-- Выведите название департамента с кол-вом сотрудников больше среднего
select t2.department_name
from departments t2
where department_id in (select department_id
						from employees
						where department_id is not null
						group by department_id
						having count(*) > (select avg(t1.emp_count) as avg_emp_count
												from (select department_id, count(*) as emp_count
														from employees
														where department_id is not null
														group by department_id) t1
						));
