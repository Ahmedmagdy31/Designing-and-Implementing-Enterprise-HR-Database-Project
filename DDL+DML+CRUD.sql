/*Create table department*/
CREATE TABLE department(department_id SERIAL PRIMARY KEY,department_nm varchar(50));

/*Create table salary*/
create table salary(salary_id serial primary key,
salary int);
    
/*Create table education_level*/
create table education_level (
education_id serial primary key,
education_level varchar(50));
    
/*Create table job*/
create table job(
job_id serial primary key,
job_title varchar(50)); 
    
/*Create table employee*/
create table employee(
employee_id varchar(50) primary key,
employee_name varchar(50),
email varchar(50),
hire_dt date);
    
/*Create table location*/
create table location(
location_id serial primary key,
location varchar(50),
city varchar(50),
state varchar(50),
address varchar(100));
    
/*Create table employment*/
create table employment(
employee_id varchar(50) references employee(employee_id),
location_id int references location(location_id),
department_id int references department(department_id),
salary_id int references salary(salary_id),
education_id int references education_level(education_id),
manager_id varchar(50) references employee(employee_id),    
job_id int references job(job_id),    
start_dt date,
end_dt date,
primary key(employee_id,job_id)    
    
);   

/*insert into department*/
insert into department(department_nm)
select distinct(department_nm) from proj_stg;

/*insert into education_level*/
insert into education_level(education_level)
select distinct(education_lvl) from proj_stg;


/*insert into employee*/
insert into employee(employee_id,employee_name,email,hire_dt)
select distinct emp_id,emp_nm,email,hire_dt from proj_stg;


/*insert into job*/
insert into job(job_title)
select distinct job_title from proj_stg;

/*insert into location*/
insert into location(location, state, city, address)
SELECT DISTINCT location, state, city, address FROM proj_stg;

/*insert into salary*/
insert into salary(salary)
select salary from proj_stg;

/*insert into employment*/
insert into employment(employee_id,job_id,location_id,department_id,start_dt,end_dt,salary_id,manager_id,education_id)
                       
SELECT  e.employee_id, j.job_id,l.location_id,d.department_id,proj.start_dt,proj.end_dt,s.salary_id,m.employee_id as manager_id,ed.education_id

               FROM proj_stg as proj
               join employee e 
               on proj.emp_id = e.employee_id
               join job as j
               on proj.job_title = j.job_title
               join location l
               on l.location = proj.location
               join department d
               on proj.department_nm = d.department_nm
               join salary s
               on proj.salary = s.salary
               left join employee m
               on m.employee_name = proj.manager
               join education_level ed
               on proj.education_lvl = ed.education_level;
    
/*CRUD*/
    /*Question 1: Return a list of employees with Job Titles and Department Names
*/
SELECT e.Employee_ID, ee.Employee_name, j.job_title, d.department_nm
FROM Employment as e
JOIN Employee as ee
on e.Employee_ID = ee.Employee_ID
Join job as j
on e.job_id = j.job_id
JOIN Department AS d
on e.department_id = d.department_id;

/* Question 2: Insert Web Programmer as a new job title
*/

insert into job(job_title)
values('Web Programmer');

/* Question 3: Correct the job title from web programmer to web developer
*/
update job
set job_title = 'Web Developer'
where job_title = 'Web Programmer';

/* Question 4: Delete the job title Web Developer from the database
*/

delete from job
where job_title = 'Web Developer';

/* Question 5: How many employees are in each department?
*/

SELECT d.department_nm, COUNT(e.employee_id) FROM employment as e
JOIN Department as d
ON e.department_id = d.department_id
GROUP BY d.department_nm;

/* Question 6: Write a query that returns current and past jobs (include employee name, job title, department, manager name, start and end date for position) for employee Toni Lembeck.
*/

SELECT e.employee_name, j.job_title, d.department_nm, ee.employee_name, em.Start_DT, em.End_DT 
FROM Employment as em
JOIN Employee as e
ON em.employee_id = e.employee_id
JOIN job as j
ON em.job_id = j.job_id
join Department as d
ON em.department_id = d.Department_ID
JOIN Employee as ee
ON em.manager_id = ee.Employee_ID
WHERE e.Employee_name = 'Toni Lembeck';

