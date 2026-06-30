show databases;
show tables;
select*from hr_analytics;
rename table hr_analytics to hrdata;
select * from hrdata;
alter table hrdata rename column ï»¿EmpID to EmpID;
select * from hrdata;
desc hrdata;
select count(AgeGroup) from hrdata where AgeGroup is null or AgeGroup='';
select avg(NumCompaniesWorked) from hrdata;
update hrdata set NumCompaniesWorked=3 where NumCompaniesWorked is null or NumCompaniesWorked='';
select distinct EmpID from hrdata;
select*from hrdata;
desc hrdata;
show tables;

-- Select Database
USE hr_database;

-- View Data
SELECT * FROM hr_data;

-- Remove duplicate records
DELETE t1
FROM hr_data t1
INNER JOIN hr_data t2
ON t1.EmployeeID = t2.EmployeeID
AND t1.EmployeeID > t2.EmployeeID;

-- Check for NULL values
SELECT *
FROM hr_data
WHERE Age IS NULL
   OR Department IS NULL
   OR JobRole IS NULL
   OR MonthlyIncome IS NULL;

-- Replace NULL values if required
UPDATE hr_data
SET Department = 'Unknown'
WHERE Department IS NULL;

-- Standardize text values
UPDATE hr_data
SET Gender = TRIM(Gender);

UPDATE hr_data
SET Department = TRIM(Department);

UPDATE hr_data
SET JobRole = TRIM(JobRole);

-- Remove negative salaries if any
DELETE FROM hr_data
WHERE MonthlyIncome < 0;

-- Verify cleaned data
SELECT * FROM hr_data;