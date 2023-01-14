# Designing-and-Implementing-Enterprise-HR-Database-Project







## Project Overview

In this project, you will design, build, and populate a database for the Human Resources (HR) Department at the imaginary Tech XYZ Corp, a video game company. This project will start with a request from the HR Manager. From there, you will need to design a database using the foundational principals of data architecture that is best suited to the department's needs. You will go through the steps of database architecture, creating database proposals, database entity relationship diagrams (ERD), and finally creating the database itself. This project is important, as it is a scaled-down simulation of the kind of real-world assignments data architects work on every day.

## Business requirement
Tech XYZ Corp saw explosive growth with a sudden appearance onto the gaming scene with its new AI-powered video game console. As a result, they have gone from a small 10 person operation to 200 employees and 5 locations in under a year. HR is having trouble keeping up with the growth since they are still maintaining employee information in a spreadsheet. While that worked for ten employees, it has become increasingly cumbersome to manage as the company expands.

As such, the HR department has tasked you, as the new data architect, to design and build a database capable of managing their employee information.

## IT best practice recommendations:

### Security:
All database security at Tech XYZ Corp is based at the user level. Each employee in the company has a
domain authenticated username that they will use to access any database they have been authorized
access to.

To restrict access to:
#### Database: do not grant user access to the database.
#### Specific data in a database: grant user access to all tables in the database, then revoke access to
any tables holding restricted data.


### Backups:

#### All database backup schedules should be set based on priority (Standard, Archived, Critical):
* Standard: Backup schedule is a full backup 1x per week.
* Archive: Backup schedule is a full backup 1x per month.
* Critical: Backup schedule is full backup 1x per week, incremental backup daily.
### Storage:
* All databases are given a standard partition of 1 GB by the server group. Ask users about the expected
growth of data. Databases larger than or expected to exceed 10K rows of data in the next year should
ask for a large partition space.

* Databases are stored on spinning disk by default. In-memory storage is available, but only for data that
requires higher level computations (advanced analytics, machine learning applications).

### Data Ingestion:

#### Direct Feeds: If setting up a direct feed from another database, please ensure a functional username is
#### created by IT security. This will ensure an expiring username does not cause a data flow error.
#### API: If working with API, please submit the API address and information to IT security for evaluaation
#### before proceeding.
#### ETL: ETL is the current best practive for working with flat files. If the flat file will be regularly updated, an automated ETL process can be set up.
