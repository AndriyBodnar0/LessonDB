SELECT * FROM students;
select * from students where gender = 'female';
select * from students where gender = 'male' and age between 25 and 40;
select * from students where gender = 'female' and age > 30 and name like '_a%a';
select avg(age) from students where gender = 'male';
select
    name,
    max(age)
from students where gender ='female';
select * from students order by id desc limit 3 ;
select count(*) as count, gender
from students
group by gender;
update students set gender = 'female' where name like 'a%';
update students set name = 'Antonina' where name ='Anton' ;
update students set age = 10 where gender ='female' and  name not like '%a';
delete from students  where age between 25 and 40;

