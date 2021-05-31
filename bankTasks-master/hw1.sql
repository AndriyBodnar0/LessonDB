SELECT * FROM bank.application;
-- 1. +Вибрати усіх клієнтів, чиє ім'я має менше ніж 6 символів. 
select * from client where length(firstname) <6;
-- 2. +Вибрати львівські відділення банку.+
select * from department where DepartmentCity = 'Lviv';
-- Вибрати клієнтів з вищою освітою та посортувати по прізвищу.
select * from client where Education = 'high' order by LastName; 
-- 4. +Виконати сортування у зворотньому порядку над таблицею Заявка і вивести 5 останніх елементів.
select * from application order by idApplication desc limit 5; 
-- 5. +Вивести усіх клієнтів, чиє прізвище закінчується на OV чи OVA.
select * from client where LastName like '%ov' or LastName like '%ova';
-- 6. +Вивести клієнтів банку, які обслуговуються київськими відділеннями.

select FirstName, LastName, DepartmentCity from client c
        join department d on c.Department_idDepartment = d.idDepartment
        where DepartmentCity = 'Kyiv';
        
select * from client
        where Department_idDepartment in (select idDepartment from department where DepartmentCity = 'Kyiv' );
	
-- 7. +Вивести імена клієнтів та їхні номера телефону, погрупувавши їх за іменами.   
 SELECT FirstName FROM client ORDER BY FirstName;
-- 8. +Вивести дані про клієнтів, які мають кредит більше ніж на 5000 тисяч гривень  

select * from client join application on  client.idClient = application.idApplication where CreditState = 'Not returned' and Currency = 'Gryvnia' and sum > 5000;

-- 9. +Порахувати кількість клієнтів усіх відділень та лише львівських відділень.

SELECT idDepartment,
       DepartmentCity,
       count(idClient)
FROM client
JOIN department ON department_iddepartment= iddepartment
GROUP BY iddepartment; 

SELECT idDepartment,
       DepartmentCity,
       count(idClient)
FROM client
JOIN department ON department_iddepartment= iddepartment
where DepartmentCity like 'Lviv'
GROUP BY iddepartment; 


-- 10. Знайти кредити, які мають найбільшу суму для кожного клієнта окремо.

select max(SUM),
FirstName,
LastName
from client
join application ON idClient=Client_idClient
group by Client_idClient;


-- 11. Визначити кількість заявок на крдеит для кожного клієнта. 

 select idClient,
 FirstName,
 LastName,
 count(idApplication) from application
 join client on idClient = Client_idClient
 group by idClient;


-- 12. Визначити найбільший та найменший кредити.
 select max(Sum), min(Sum) from application;
-- 13. Порахувати кількість кредитів для клієнтів,які мають вищу освіту
select
	idClient,
	FirstName,
	Education,
	count(idClient)
 from client
join application on idClient = Client_idClient
 where Education = 'high'
 group by idclient;
-- 14. Вивести дані про клієнта, в якого середня сума кредитів найвища.
	select
	idClient,
	FirstName,
	avg(sum) as avgsum
 from client
join application on idClient = Client_idClient

 group by idClient
 order by avgsum desc
 limit 1;
 
-- 15. Вивести відділення, яке видало в кредити найбільше грошей

select 
	idApplication,
    idDepartment,
	sum(sum) as maxsum
from department
join client on idDepartment = Department_idDepartment
join application on idClient = Client_idClient
group by idDepartment
order by  maxsum desc
limit 1;


-- 16. Вивести відділення, яке видало найбільший кредит.

select 
    idDepartment,
    DepartmentCity,
	Max(sum) 
from department
join client on idDepartment = Department_idDepartment
join application on idClient = Client_idClient
group by idDepartment
limit 1;

-- 17. Усім клієнтам, які мають вищу освіту, встановити усі їхні кредити у розмірі 6000 грн.


UPDATE application
        JOIN
    client ON idClient = Client_idClient 
SET 
    Sum = 6000,
    Currency = 'Gryvnia'
WHERE
    Education = 'high';
 

-- 18. Усіх клієнтів київських відділень пересилити до Києва.

UPDATE client
        JOIN
    department ON idDepartment = Department_idDepartment 
SET 
    City = 'Kyiv'
WHERE
    DepartmentCity = 'Kyiv';
    

-- 19. Видалити усі кредити, які є повернені.

delete from application where CreditState = 'Returned';


-- 20. Видалити кредити клієнтів, в яких друга літера прізвища є голосною.

DELETE application FROM application
        JOIN
    client ON idClient = Client_idClient 
WHERE
    LastName LIKE '_a%'
    OR LastName LIKE '_e%'
    OR LastName LIKE '_i%'
    OR LastName LIKE '_o%'
    OR LastName LIKE '_u%'
    OR LastName LIKE '_y%';

-- Знайти львівські відділення, які видали кредитів на загальну суму більше ніж 5000






-- Знайти клієнтів, які повністю погасили кредити на суму більше ніж 5000





/* Знайти максимальний неповернений кредит.*/




/*Знайти клієнта, сума кредиту якого найменша*/




/*Знайти кредити, сума яких більша за середнє значення усіх кредитів*/



/*Знайти клієнтів, які є з того самого міста, що і клієнт, який взяв найбільшу кількість кредитів*/



#місто чувака який набрав найбільше кредитів

	
-- set sql_safe_updates = 0;
 -- set sql_safe_updates = 1;
