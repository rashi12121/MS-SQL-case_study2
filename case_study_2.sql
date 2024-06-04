use case_study2
--1. List all the employee details.
select * from employee

--2. List all the department details.
SELECT * FROM DEPARTMENT

--3.  List all job details.
SELECT * FROM JOB

--4. List all the locations
SELECT * FROM LOCATION
.
--5. List out the First Name, Last Name, Salary, Commission for all Employees.
SELECT FIRST_NAME, LAST_NAME, SALARY, COMM FROM EMPLOYEE

--6. List out the Employee ID, Last Name, Department ID for all employees anD alias Employee ID as "ID of the Employee", Last Name as "Name of the
--Employee", Department ID as "Dep_id".
select employee_id, last_name as name_of_the_employee, department_id as id_of_the_employee from employee

--7. List out the annual salary of the employees with their names only
select first_name, salary from employee
------------------------------------------------------------------------------------------------------------------------------------------------------

--1. List the details about "Smith".
select * from employee where last_name ='smith'

--2. List out the employees who are working in department 20.
select first_name from employee where department_id = 20

--3. List out the employees who are earning salary between 2000 and 3000.
select * from employee where salary between 2000 and 3000

--4. List out the employees who are working in department 10 or 20.
select * from employee where department_id = 10 or department_id = 20

--5. Find out the employees who are not working in department 10 or 30.
select * from employee where not department_id in (10,30)

--. List out the employees whose name starts with 'L'.
 select * from employee where first_name like 'L%'

-- 7. List out the employees whose name starts with 'L' and ends with 'E'.
SELECT * FROM employee where first_name like 'L%E'

--8. List out the employees whose name length is 4 and start with 'J'.
SELECT * FROM EMPLOYEE WHERE LEN(FIRST_NAME) = 4 AND FIRST_NAME LIKE 'J%'

--9. List out the employees who are working in department 30 and draw the salaries more than 2500.
select * from employee where department_id = 30 and salary > 2500

--10. List out the employees who are not receiving commissioN
select * from employee where comm is null

----------------------------------------------------------------------------------------------------------------------------------------------------

--1. List out the Employee ID and Last Name in ascending order based on the Employee ID.
select employee_id, first_name from employee 
order by employee_id

--2. List out the Employee ID and Name in descending order based on salary
select employee_id, first_name ,salary from employee
order by salary desc

--3. List out the employee details according to their Last Name in ascending-order
select * from employee order by last_name

--4. List out the employee details according to their Last Name in ascending order and then Department ID in descending order.
select * from employee 
order by department_id desc, last_name

-----------------------------------------------------------------------------------------------------------------------------------------------------

--1. List out the department wise maximum salary, minimum salary and average salary of the employees.
select department_id, max(salary) as max_salary, min(salary) as min_salary, avg(salary) as avg_salary
from employee group by department_id

--2. List out the job wise maximum salary, minimum salary and average salary of the employees.
select j.designation, max(e.salary) as max_sal, min(e.salary) as min_sal, avg(e.salary) as avg_sal
from employee e
inner join job j
on e.job_id = j.job_id
group by j.designation

select designation from job

--3. List out the number of employees who joined each month in ascending order.
select datename(month,hire_date) as month, count(employee_id) as no_of_employees from employee
group by datename(month,hire_date)
order by datename(month,hire_date)

--4. List out the number of employees for each month and year in ascending order based on the year and month.
select year(hire_date) as year, month(hire_date) as month, datename(month,hire_date) as montgh_name, count(employee_id) as no_of_employee from employee 
group by year(hire_date), month(hire_date), datename(month, hire_date)
order by year,month

--5 List out the Department ID having at least four employees.
select department_id ,count(*) as no_of_employee from employee
group by department_id
having count(*)>=4;

--6. How many employees joined in February month.
select count(*) as no_of_feb_emp from employee
where month(hire_date) =2

--7. How many employees joined in May or June month.
select count(*) as no_of__emp from employee
where month(hire_date) in (5,6)

---. How many employees joined in 1985?
select count(*) as emp_join from employee
where year(hire_date) = 1985

---9. How many employees joined each month in 1985?
select  month(hire_date) as month, datename(month,hire_date) as month_name, count(employee_id) as no_of_emp from employee
where year(hire_date) = 1985
group by month(hire_date), datename(month,hire_date)
order by month

--10. How many employees were joined in April 1985?
select count(*) as emp_april from employee 
where month(hire_date) = 4 and year(hire_date) = 1985

--11. Which is the Department ID having greater than or equal to 3 employees joining in April 1985?
select department_id, count(*) as employeed_joined from employee
where month(hire_date) = 4 and year(hire_date) = 1985
group by department_id
having count(*) >=3;

------------------------------------------------------------------------------------------------------------------------------------------------------------
--1. List out employees with their department names.
select e.first_name, d.department_id, d.name from employee e
join department d
on e.department_id = d.department_id

select * from department

--2. Display employees with their designations.
select e.employee_id, e.first_name, j.designation from employee e
inner join job j
on e.job_id = j.job_id

select * from job
select * from employee
select * from location
select * from department

--3. Display the employees with their department names and city.
select e.employee_id, e.first_name, d.name, l.city from employee e
join department d
on e.department_id = d.department_id
join location l
on d.location_id = l.location_id


--4. How many employees are working in different departments? Display with department names.
select e.department_id, d.name, count(e.employee_id) as no_of_emp from employee e
join department d
on e.department_id = d.department_id
group by d.name, e.department_id
order by no_of_emp desc;

--5. How many employees are working in the sales department?
select count(*) as sale_emp from employee e
join department d
on e.department_id = d.department_id
where d.name = 'sales'

--6. Which is the department having greater than or equal to 3 employees and display the department names in ascending order
select d.name, count(e.employee_id) as no_of_emp from employee e
inner join  department d
on e.department_id = d.department_id
group by d.name
having count(e.employee_id) >=3

--7. How many employees are working in 'Dallas'?
select l.city, count(e.employee_id) as emp_in_dallas from employee e
join department d
on e.department_id = d.department_id
join location l
on d.location_id = l.location_id
where l.city = 'dallas'
group by l.city;


--8. Display all employees in sales or operation departments.

select e.first_name, d.name from employee e
inner join department d
on e.department_id = d.department_id
where d.name in ('operations', 'sales')

------------------------------------------------------------------------------------------------------------------------------------------------------


--1. Display the employee details with salary grades. Use conditional statement to create a grade column.
select e.employee_id, e.first_name, e.last_name, e.middle_name, e.salary, e.hire_date, j.designation,
l.city,  d.name as department_name, case
										when e.salary >2500 then 'A'
										when e.salary >2000 and e.salary<2500 then 'B'
										when e.salary>1500 and e.salary<2000 then 'C'
										when e.salary>1000 and e.salary<1500 then 'D'
										else 'E'
									end as salary_grade
from employee e
join job j
on e.job_id = j.job_id
join department d
on e.department_id = d.department_id
join location l
on d.location_id = l.location_id
order by salary_grade

--2. List out the number of employees grade wise. Use conditional statement to create a grade column.

select case
			when salary >2500 then 'A'
			when salary >2000 and salary<2500 then 'B'
			when salary>1500 and salary<2000 then 'C'
			when salary>1000 and salary<1500 then 'D'
			else 'E'
			end as grade,
count(*) as no_of_emp
from employee e
group by case
			when salary >2500 then 'A'
			when salary >2000 and salary<2500 then 'B'
			when salary>1500 and salary<2000 then 'C'
			when salary>1000 and salary<1500 then 'D'
			else 'E'
			end;
			
--3. Display the employee salary grades and the number of employees between 2000 to 5000 range of salary

select case
			when salary >4000 then 'A'
			when salary >3000 and salary<4000 then 'B'
			when salary>2000 and salary<3000 then 'C'
			when salary>1000 and salary<2000 then 'D'
			else 'E'
			end as grade,
count(*) as no_of_emp
from employee
where salary between 2000 and 5000
group by case
			when salary >4000 then 'A'
			when salary >3000 and salary<4000 then 'B'
			when salary>2000 and salary<3000 then 'C'
			when salary>1000 and salary<2000 then 'D'
			else 'E'
			end;

------------------------------------------------------------------------------------------------------------------------------------------------

---1. Display the employees list who got the maximum salary.

select * from employee 
where salary = (select max(salary) as max_salary from employee);

--2. Display the employees who are working in the sales department.

select * from employee e
where e.department_id = (select d.department_id from department d where d.name = 'sales');
--(MAKE SURE THAT THE SUBQUEREY SHOULD RETURN ONLY ONE VALUE NOT THE WHOLE TABLE HENCE GIVE SPECIFIES COLUMN NAME NOT THE * AFTER SELECT)

--3. Display the employees who are working as 'Clerk'.

 select * from employee e
 where e.job_id = (select job_id from job j where j.designation ='clerk');

--4. Display the list of employees who are living in 'Boston'.

select * from employee 
where department_id in (select department_id from department 
					where location_id in (select location_id from location 
											where city = 'boston'));

--5. Find out the number of employees working in the sales department.

select count(*) as sales_emp from employee 
where department_id = (select department_id from department where name = 'sales');

--6. Update the salaries of employees who are working as clerks on the basis of 10%

begin transaction
update employee set salary = salary*1.10 
where job_id =(select job_id from job 
				where designation ='clerk');
				select * from employee
rollback
---7. Display the second highest salary drawing employee details.
 select min(salary) as hig_salary from employee 
 where salary in (select top 2 salary from employee order by salary)

 employee_id, last_name, first_name, middle_name, job_id, hire_date

--8. List out the employees who earn more than every employee in department 30.

select * from employee
where salary=  (select max(salary) from employee where department_id = 30)

--9. Find out which department has no employees.

select 

--10. Find out the employees who earn greater than the average salary for their department.

select * from job
select * from employee
select * from location
select * from department
 