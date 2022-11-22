
--UC1-creating Database
create database Payroll_Services

use Payroll_services
--UC2-Creating Table
create table Employee_Payroll(ID int identity(1,1)primary key,Name varchar(200),Salary bigint,Start_Date date)

--UC3-Insert values into Table
insert into Employee_Payroll values(
'Bill',50000,'03-01-2021'),
('Terisa',45000,'07-03-2022'),
('Charlie',52000,'09-06-2021')

--UC4-Retrive all data from Employee payroll table
Select * from Employee_Payroll

--UC5-Retriving perticular information from table
select salary from Employee_Payroll where name='Bill'

select Start_Date from Employee_Payroll where name='Terisa'

select * from Employee_Payroll where Start_Date between CAST ('2021-05-01' as date)and getdate();

--UC6-Add Gender to table
alter table Employee_Payroll add Gender varchar(10)

update Employee_Payroll set Gender = 'M' where Name='Bill' or Name='Charlie'
update Employee_Payroll set Gender = 'F' where Name='Terisa'

--UC7-Find Sum,average,Min,Max and number of male and female Employees
--Count
Select COUNT(ID) as TotalEmployee from Employee_Payroll

--Min
select MIN(Salary) As MinimumSalary from Employee_Payroll

--Max
Select max(Salary) as MaximumSalary from Employee_Payroll

--Avg
Select AVG(Salary)as AvarageSalary from Employee_Payroll

--Sum
Select sum(Salary)as SumOfSalary from Employee_Payroll

--Group By Name

select Sum(salary)  as "Total Salary of Males" from employee_payroll where Gender = 'M' group by Gender;
select Sum(salary)  as "Total Salary of Female" from employee_payroll where Gender = 'F' group by Gender;
select Sum(salary) as "Total Salary",Gender from employee_payroll group by Gender;
select Avg(salary) as "Average Salary",Gender from employee_payroll group by Gender;
select Min(salary) as "Minimum Salary",Gender from employee_payroll group by Gender;
select Max(salary) as "Maximum Salary",Gender from employee_payroll group by Gender;
select count(salary) as "Number of Males & Females",Gender from employee_payroll group by Gender;

--UC8-Extend Employee payroll data phone no , Address, Department
alter table Employee_Payroll add 
phoneNumber bigint,
Address varchar(200) not null default 'Address Unavailable',
Department varchar(200) not null default 'General Department'

select * from Employee_Payroll
--UC9- extend table to Basic pay,Deduction,Taxable pay,Income tax,Net pay
alter table Employee_Payroll add BasicPay money,Deduction money,TaxablePay money,IncomeTax money,NetPay money

--UC10 Make Hemant as a part of Sales and Marketing Department
insert into Employee_Payroll values
('Terisa',48000,'2022-07-13','F',8797775765,'New York','Sales and Marketing',45000.0,2000,500,500,48000)


select name as Employee_Name from employee_payroll order by name asc
select name as Employee_Name from employee_payroll order by name desc




--UC10-Creating tables for Er digram
-- Creating Department table
create table Department(Dept_ID int identity(1,1) primary key,Dept_Name varchar(200))

insert into Department values('Human Resource'),('Sales and Marketing'),('Store'),('Production'),('Quality'),('HouseKeeping');


--2)Creating Company table
create table Company(Comp_ID int identity (1,1) primary key,Company_Name varchar(200))


--Inserting Values in Company table
insert into Company values('TATA Motors'),('Mahindra and Mahindra'),('Bridgelabz'),('Microsoft'),('Infosys'),('Minda');


--3)Creating Employee Table (Columns name taken Randomly)
create table Employee
	(Emp_id int identity(1,1) primary key,
	Deptid int foreign key references Department(Dept_ID),
	Emp_Name varchar(200),
	Emp_Gender varchar(10),
	Contact bigint,
	Emp_City varchar(200),
	Company_ID int foreign key references Company(Comp_ID));

--Inserting values into Employee

insert into Employee values
	(1,'Vishal Patil','M','8997897655','Pune',1),
	(2,'Anand Sarode','M','7887756867','Solapur',2),
	(3,'Vijaya Kamble','F','8654115897','Aurangabad',3),
	(4,'Jaya Sultani','F','8432589632','Pune',4),
	(5,'Shubham Jadhav','M','9499556327','Satara',5);

	

--4)Creating payroll Table

create table Payroll
(Emp_id int foreign key references Employee(Emp_id),
    BasicPay money,                          
	Deduction money,
	TaxablePay money,
	IncomeTax money,
	NetPay money);

drop table Payroll
select * from Payroll;

--Inserting Values in the Table

insert into Payroll values
(1,65000,3000,1100,700,55000),
(2,72000,4000,1400,600,65000),
(3,39000,5000,2000,800,73000),
(4,45000,2500,1200,300,41000),
(5,55000,3500,1600,500,56000);



--UC12 Retrieve all data from the queries

--UC4 reusing to make sure it working fine

select * from Departments;
select * from Company;
select * from Employee;
select * from Payroll;

--UC5 reusing
--comparing two tables to get output for UC5
select Employee.Emp_id,Employee.Emp_name,Payroll.BasicPay,Payroll.NetPay
from Employee,Payroll
where Employee.Emp_id=Payroll.Emp_id;


--UC7 reusing

--Count function to check total count of employees present
select COUNT(Emp_id) as TotalEmployee from Employee;

--Min function 
select MIN(BasicPay) as Minimum_Basic_Pay from Payroll;

--Max function
select MAX(BasicPay) as Maximum_Basic_Pay from Payroll;

--Avg function
select AVG(BasicPay) as Average_Basic_Pay from Payroll;

--Sum function group by Gender
select SUM(BasicPay) as TotalSum from Employee,Payroll where Emp_Gender='M' group by Emp_Gender;

--Sum function grop by Employee name
select Employee.Emp_name,SUM(BasicPay) as TotalSum from Employee,Payroll group by Emp_name;



select * from Payroll;
