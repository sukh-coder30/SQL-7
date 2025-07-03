create database empview;
use emplview;
create table employee(
emp_id int primary key,
emp_name varchar(100),
department text,
salary Decimal(10,2),
status text);

insert into employee values
(1, 'Alice', 'HR', 50000, 'Active'),
(2, 'Bob', 'Engineering', 70000, 'Active'),
(3, 'Charlie', 'Engineering', 65000, 'Inactive'),
(4, 'Diana', 'Finance', 60000, 'Active');

select * from employee;
/* Creating view for active employees*/
create view active_employee as 
select emp_id, emp_name, department, salary
from employee
where status='Active';

select * from active_employee;

/* Creating view for average salary by department (only active employees)*/

create view avg_salary_by_dep2 as
select department, avg(salary)
from employee
where status='Active'
group by department;

select * from avg_salary_by_dep2;

/*Using Views for Abstraction and Security
creating as view so that user can check only hr and finance data*/

create view hr_finance as 
select emp_name, department, emp_id
from employee
where department in('HR', 'Finance');

select * from hr_finance;

/*Updating Through a View*/
update active_employee
set salary=80000
where emp_id=2;

select * from active_employee;