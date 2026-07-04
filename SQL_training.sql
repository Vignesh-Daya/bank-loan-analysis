create database student;
Use student;
CREATE TABLE Persons_details (
    PersonID int,
    LastName varchar(255),
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255)
);
SHOW DATABASES;
DROP DATABASE student;
CREATE DATABASE student;
SHOW DATABASES;
use sakila;
show tables;
select * from Persons_details; 
use student;
Insert into Persons_details values (01, 'Dayalan', 'Vignesh', 'Kumaran street', 'Puducherry');
Insert into Persons_details values (02, 'Surya', 'shan', 'Kumaran street', 'Puducherry');
Insert into Persons_details values (03, 'Vijay', 'Kumar', 'Kumaran street', 'Puducherry');
Insert into Persons_details values (04, 'Suresh', 'David', 'Kumaran street', 'Puducherry');
Insert into Persons_details values (05, 'Kamalesh', 'Ajay', 'Kumaran street', 'Puducherry');
create database Bank;
create table Bank_Inventory(
Product varchar(10),
Quantity int,
Price int,
Purchase_Cost int,
Sale_Price float);
desc Bank_Inventory;
select * from Bank_Inventory;
insert into Bank_Inventory values ('PayCard', 2 , 300.45, 8000.95, '9000.56');
insert into Bank_Inventory values ('PayPoints', 4 , 200.89, 4500.45, '7700.56');
alter table Bank_Inventory;
select product from Bank_Inventory where price > 200;
update Bank_Inventory set product = 'visaCard' where Quantity = '2';
set sql_safe_updates=0;
update Bank_Inventory set Quantity = 10 where Product = 'visaCard';
alter table Bank_Inventory add Holiday varchar(50);
select * from Bank_Inventory where product = 'visacard';  
use Bank_Inventory;
select * from customer;
select count(*) from customer;
select distinct (count(first_name)) from customer;
show tables;
alter table Bank_Inventory modify column Purchase_Cost float;
update Bank_Inventory  set sale_price = sale_price + 15/100 where quantity >=4;
alter table bank_inventory add estimated_sale_price float; 
insert into bank_inventory values ('DailCard', 2 , 380.0, 8500.87, 9000.0, 10000.58);
alter table bank_inventory drop column holiday;
update bank_inventory set estimated_sale_price = estimated_sale_price + 1000;
delete from bank_inventory where (estimated_sale_price - Purchase_cost) < (5/100*estimated_sale_price);
UPDATE Bank_Inventory SET product = 'data_card' WHERE Quantity = '10';
select product, quantity from Bank_Inventory where estimated_sale_price is null;
desc sakila;

select * from payment;
select amount from payment order by amount desc limit 5;
select distinct(amount) from payment order by amount desc limit 5;
select amount as price from payment;
select * from country;
select distinct(count(*)) from country;
SELECT * FROM country WHERE country_id not in (1);
select * from country where country_id between 104 and 106;
select * from country where country_id order by country desc; 
show tables;
select * from actor;
select * from film_category;

use sakila;
CREATE TABLE student_marks (
    subject varchar(50),
    name varchar(255),
    marks int
);

Insert into student_marks values ('Maths', 'Dayalan', 100);
Insert into student_marks values ('Maths', 'sureh', 100);
Insert into student_marks values ('science', 'ramesh', 56);
Insert into student_marks values ('science', 'ajesh', 86);
Insert into student_marks values ('Biology', 'ramu', 43);
Insert into student_marks values ('Biology', 'somu', 43); 
Insert into student_marks values ('Social', 'kumar', 89);
Insert into student_marks values ('Social', 'ajith', 45);
Insert into student_marks values ('Social', 'vijay', 34);
use sakila;
select subject, name, marks, dense_rank() over (partition by subject order by marks desc) as 'result1' from student_marks;
desc student_marks;

select max(marks) from student_marks;
select marks from student_marks order by marks asc limit 3,1;

select subject, max(marks) from student_marks group by subject;
select * from student_marks order by subject limit 3;
select name from student_marks where name like '__j__';
select lower(name) from student_marks;
show tables;
select * from actor;
select * from actor_info;
SELECT Actress.first_name, Actress.last_name, Actress_info.info FROM Actress INNER JOIN Actress_info ON Actress.actor_id = actor_info.actor_id
CREATE TABLE Actress (
    Actress_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100)
);
select * from Actress;
INSERT INTO Actress (Actress_id, first_name, last_name, email) VALUES
(1, 'Emma', 'Stone', 'emma.stone@example.com'),
(2, 'Scarlett', 'Johansson', 'scarlett.j@example.com'),
(3, 'Natalie', 'Portman', 'n.portman@example.com'),
(4, 'Jennifer', 'Lawrence', 'jennifer.l@example.com'),
(5, 'Anne', 'Hathaway', 'anne.h@example.com');

select concat(first_name, ' ', last_name) as full_name from Actress;

CREATE TABLE actress_info (
    info_id INT,
    actress_id INT,
    birth_date DATE,
    nationality VARCHAR(50),
    biography TEXT,
    FOREIGN KEY (actress_id) REFERENCES Actress(Actress_id)
);
INSERT INTO actress_info (info_id, actress_id, birth_date, nationality, biography) VALUES
(89, 1, '1988-11-06', 'American', 'Emma Stone is known for her roles in La La Land and Easy A.'),
(27, 2, '1984-11-22', 'American', 'Scarlett Johansson starred as Black Widow in the Marvel series.'),
(45, 3, '1981-06-09', 'Israeli-American', 'Natalie Portman is famous for her roles in Black Swan and Star Wars.'),
(36, 4, '1990-08-15', 'American', 'Jennifer Lawrence gained fame with The Hunger Games and Silver Linings Playbook.'),
(17, 5, '1982-11-12', 'American', 'Anne Hathaway is known for The Devil Wears Prada and Les Misérables.');
select * from actress_info;
SELECT Actress.first_name, Actress.last_name, Actress_info.info_id FROM Actress INNER JOIN Actress_info ON Actress.Actress_id = Actress_info.Actress_id;

select concat(actress.first_name, ' ', actress.last_name), actress_info.actress_id, actress_info.nationality from actress join actress_info on actress.actress_id=actress_info.actress_id where actress_info.actress_id>2;
select * from payment limit 2;
CREATE TABLE Department
(
  ID INT PRIMARY KEY,
  Name VARCHAR(50)
);
select department.id, department.name, employee.gend0er, employee.dob, employee.salary, employee.deptid from department join employee on department.id = employee.id;

select department.name from department where department.name = 'hr' union all select employee.name, employee.salary from employee where salary > 25000;

INSERT INTO Department VALUES(1, 'IT');
INSERT INTO Department VALUES(2, 'HR');
INSERT INTO Department VALUES(3, 'Sales');
select * from department;
CREATE TABLE Employee
(
  ID INT PRIMARY KEY,
  Name VARCHAR(50),
  Gender VARCHAR(50),
  DOB DATETIME,
  Salary DECIMAL(18,2),
  DeptID INT
);
INSERT INTO Employee VALUES(1, 'Pranaya', 'Male','1996-02-29 10:53:27.060', 25000, 1);
INSERT INTO Employee VALUES(2, 'Priyanka', 'Female','1995-05-25 10:53:27.060', 30000, 2);
INSERT INTO Employee VALUES(3, 'Anurag', 'Male','1995-04-19 10:53:27.060',40000, 2);
INSERT INTO Employee VALUES(4, 'Preety', 'Female','1996-03-17 10:53:27.060', 35000, 3);
INSERT INTO Employee VALUES(5, 'Sambit', 'Male','1997-01-15 10:53:27.060', 27000, 1);
INSERT INTO Employee VALUES(6, 'Hina', 'Female','1995-07-12 10:53:27.060', 33000, 2);
INSERT INTO Employee VALUES(7, '  vignesh  ', 'Female','1995-07-12 10:53:27.060', 33000, 2);
INSERT INTO Employee VALUES(8, '  shan  ', 'Female','1995-07-12 10:53:27.060', 33000, 2);

create view employee_department_details as select department.id, department.name, employee.gender, employee.dob, employee.salary, employee.deptid from department join employee on department.id = employee.id;
select * from employee_department_details;
desc employee_department_details;
select * from employee where name like '_r%';

select ascii(name) from employee;
create view asci_name1 as select ascii(name) as numeric_name from employee;
select * from asci_name1;
select char(name) from employee;
select rtrim(name) from employee;
select * from employee;
select rtrim(name) from employee;
select right(name, 2) from employee;
select length(name) from employee;
select charindex(a, name) from employee;
select replace(name, 'a', 'v') from employee;
select stuff(name, 2, 4, 'ab') from employee;
select isdate(dob) from employee;
select year(dob) from employee;
select	datepart(year, dob) from employee;
select date_add(dob, interval 10 day) from employee;
select datediff(year, '1999-07-08', '1997-08-19')as date_differ;
SELECT TIMESTAMPDIFF(month, '1997-08-19', '1999-07-08') AS date_differ;

use sakila;
show databases;
use student;
show tables;
select * from bank_inventory;
select product, quantity,
case 
when  quantity = 10 then 'maximum quantity'
else 'quantity is less'
end as quantity_details 
from bank_inventory;

SELECT OrderID, Quantity,
CASE
    WHEN Quantity > 30 THEN 'The quantity is greater than 30'
    WHEN Quantity = 30 THEN 'The quantity is 30'
    ELSE 'The quantity is under 30'
END AS QuantityText
FROM OrderDetails;

create table Person_data (
Person_ID int primary key,
first_name varchar(23),
last_name varchar(20),
Age int
);
INSERT INTO Person_data VALUES ((10, 'surya', 'daneil', 30), 
(20, 'surya', 'daneil', 25), 
(30, 'surya', 'daneil', 42),
(40, 'surya', 'daneil', 58));

# Step 1 : Create table as below.
create database inclass_3;
use inclass_3;
create table Bank_Inventory_pricing(
Product varchar(15),
Quantity int,
Price float,
purchase_cost decimal(6,2),
Estimated_sale_price float,
Months int);
 Insert into Bank_Inventory_pricing values ( 'PayCard'   , 2 , 300.45, 8000.87, 9000.56, 1 ) ;
 Insert into Bank_Inventory_pricing values ( 'PayCard'   , 2 , 800.45, 5000.80, 8700.56, 1 ) ;
 Insert into Bank_Inventory_pricing values ( 'PayCard'   , 2 , 500.45, 6000.47, 7400.56, 1 ) ;
 Insert into Bank_Inventory_pricing values ( 'PayPoints' , 4 , 390.87, 7000.67, 6700.56, 2)  ;
 Insert into Bank_Inventory_pricing values ( 'SmartPay' , 5  , 290.69, 5600.77, 3200.12 , 1)  ;
 Insert into Bank_Inventory_pricing values ( 'MaxGain',    3 , NULL, 4600.67, 3233.11 , 1 ) ;
 Insert into Bank_Inventory_pricing values ( 'MaxGain',    6 , 220.39, 4690.67, NULL , 2 ) ;
 Insert into Bank_Inventory_pricing values ( 'SuperSave', 7 , 290.30, NULL, 3200.13 ,1 ) ;
 Insert into Bank_Inventory_pricing values ( 'SuperSave', 6 , 560.30, NULL, 4200.13 ,1 ) ;
 Insert into Bank_Inventory_pricing values ( 'SuperSave', 6 , NULL, 2600.77, 3200.13 ,2 ) ;
 Insert into Bank_Inventory_pricing values ( 'SuperSave', 9 , NULL, 5400.71, 9200.13 ,3 ) ;
 Insert into Bank_Inventory_pricing values ( 'SmartSav',   3 , 250.89, 5900.97, NULL ,1 ) ;
 Insert into Bank_Inventory_pricing values ( 'SmartSav',   3 , 250.89, 5900.97, 8999.34 ,1 ) ;
 Insert into Bank_Inventory_pricing values ( 'SmartSav',   3 , 250.89, NULL , 5610.82 , 2 ) ;
 Insert into Bank_Inventory_pricing values ( 'EasyCash',   3 , 250.89, NULL, 5610.82 ,1 ) ;
 Insert into Bank_Inventory_pricing values ( 'EasyCash',   3 , 250.89, NULL, 5610.82 , 2 ) ;
 Insert into Bank_Inventory_pricing values ( 'EasyCash',   3 , 250.89, NULL, 5610.82 , 3 ) ;
 Insert into Bank_Inventory_pricing values ( "BusiCard"  ,  1, 3000.99 , NULL, 3500, 3) ; 
 Insert into Bank_Inventory_pricing values ( "BusiCard"  ,  1, 4000.99 , NULL, 3500, 2) ; 
select * from Bank_Inventory_pricing;

Create table Bank_branch_PL
(Branch   varchar(15),
  Banker   Int,
  Product varchar(15) ,
  Cost  Int,
  revenue Int,
  Estimated_profit Int,   
  month  Int);
Insert into Bank_branch_PL values ( 'Delhi', 99101, 'SuperSave', 30060070, 50060070,  20050070, 1 ) ;
Insert into Bank_branch_PL values ( 'Delhi', 99101, 'SmartSav',   45060070, 57060070, 30050070, 2) ;
Insert into Bank_branch_PL values ( 'Delhi', 99101, 'EasyCash',   66660070, 50090090, 10050077, 3) ;
Insert into Bank_branch_PL values ( 'Hyd', 99101, 'SmartSav',   66660070, 79090090, 10050077, 3) ;
Insert into Bank_branch_PL values ( 'Banglr', 77301, 'EasyCash',   55560070, 61090090, 9950077, 3) ;
Insert into Bank_branch_PL values ( 'Banglr', 77301, 'SmartSav',   54460090, 53090080, 19950077, 3) ;
Insert into Bank_branch_PL values ( 'Hyd', 77301, 'SmartSav',   53060090, 63090080, 29950077, 3) ;
Insert into Bank_branch_PL values ( 'Hyd', 88201, 'BusiCard',  	40030070, 60070080, 10050070,1) ;
Insert into Bank_branch_PL values ( 'Hyd', 88201, 'BusiCard',  	70030070, 60070080, 25060070,1) ;
Insert into Bank_branch_PL values ( 'Hyd', 88201, 'SmartSav', 	40054070, 60070080, 20050070, 2) ;
Insert into Bank_branch_PL values ( 'Banglr', 99101, 'SmartSav',   88660070, 79090090, 10050077, 3) ;

#1
select sum(purchase_cost), avg(estimated_sale_price) from Bank_inventory_pricing where Months = 2;
#2
select round(avg(estimated_sale_price), 2) from bank_inventory_pricing;
#3
select Product from bank_inventory_pricing where months = 1 group by product having count(product) > 1;







