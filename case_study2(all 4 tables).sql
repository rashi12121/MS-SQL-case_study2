use case_study2
create table location(
Location_ID int primary key,
City varchar(20)
);
insert into location
values
(122, 'New York'),
(123, 'Dallas'),
(124 ,'Chicago'),
(167, 'Boston');
select * from location

create table department(
Department_Id int primary key,
Name varchar(30), 
location_id int,
foreign key(location_id) references location(location_id)
);

insert into department values
(10 ,'Accounting', 122),
(20, 'Sales', 124),
(30, 'Research', 123),
(40, 'Operations', 167);
select * from department

create table job(
job_id int primary key,
designation varchar(20)
);

insert into job values
(667, 'Clerk'),
(668, 'Staff'),
(669, 'Analyst'),
(670, 'Sales Person'),
(671, 'Manager'),
(672, 'President');
 select * from job

 create table employee(
 Employee_Id int primary key,
Last_Name varchar(20),
First_Name varchar(20), 
Middle_Name varchar(20),
Job_Id int foreign key references job(job_id),
Hire_Date date,
Salary int,
Comm int, 
Department_Id int foreign key references department(Department_Id)
 );
  select * from EMPLOYEE
  INSERT INTO EMPLOYEE VALUES
  (7369, 'Smith', 'John', 'Q', 667, '17-Dec-84' ,800 ,Null, 20),
(7499, 'Allen',  'Kevin', 'J', 670 , '20-Feb-85', 1600, 300, 30),
(755, 'Doyle', 'Jean', 'K' ,671 ,'04-Apr-85' ,2850 ,Null, 30),
(756, 'Dennis', 'Lynn', 'S', 671 ,'15-May-85' ,2750, Null ,30),
(757, 'Baker' ,'Leslie', 'D' ,671 ,'10-Jun-85' ,2200 ,Null ,40),
(7521 ,'Wark', 'Cynthia', 'D', 670 ,'22-Feb-85' ,1250 ,50 ,30);


