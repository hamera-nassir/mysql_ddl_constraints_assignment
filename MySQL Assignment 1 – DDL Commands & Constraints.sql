create database employee;
show databases;
use employee;

-- departments table 

create table Departments(
   department_id int primary key auto_increment,
   department_name varchar(100) not null
   );
   
   -- location table 
   
   create table location(
     location_id int primary key auto_increment,
     location varchar(30) not null
     );
     
 -- employees table
 
 create table employees(
    employee_id int primary key auto_increment,
    employee_name varchar(50) not null,
    gender enum('M','F') not null,
    age int,
    hire_date date,
    designation varchar(100),
    department_id int,
    location_id int,
    salary decimal(10,2),
    );
    
    select * from employees;
    
    -- Table Alteration (ALTER)
    
    -- Add a new column named "email" to the Employees table 
    
    alter table employees add column email varchar(100);
    
    --  Modify the data type of the "designation" column to support a wide range of values
    
    alter table employees modify column designation varchar(300);
 
    --   Drop the “age” column from the Employees table
    
    alter table employees drop column age;
    
    --  Rename the “hire_date” column to “date_of_joining”
    
    alter table employees rename column hire_date to date_of_joining;
    
    -- Table Renaming
    
    --  Rename the "Departments" table to "Departments_Info"
    
    rename table departments to Departments_Info;
    show tables;
    
    --  Rename the "Location" table to "Locations"
    
    rename table location to Locations;
    
    -- Table Truncation (TRUNCATE)
    -- Removing all rows from employees while keeping its structure
    
    truncate table employees;
    
    --  Database & Table Dropping (DROP)
    --  dropping the employees table 
    
    drop table employees;
    show tables;
    
    -- dropping the employee database
    
    drop database employee;
    show databases;
    
    -- Constraints
    -- Database Recreation
    
    drop database if exists employee;
    create database employee;
    use employee;
    
    --  Departments Table
    
    create table departments( 
      department_id int primary key auto_increment,
      department_name varchar(100) not null unique
      );
      
	-- Location table
    
    create table location(
      location_id int primary key auto_increment,
      location_name varchar(100) not null unique
      );
      
	-- Employees Table
     
     create table employees( 
       employee_id int primary key auto_increment,
	   employee_name varchar(50) not null,
       gender enum('M','F') not null,
       age int check(age >= 18),
       hire_date date default (current_date()),
    designation varchar(100),
    department_id int,
    location_id int,
    salary decimal(10,2),
    constraint fk_employees_department
             foreign key(department_id) references departments(department_id),
    constraint fk_employees_location
             foreign key(location_id) references location(location_id)
    );
      
    