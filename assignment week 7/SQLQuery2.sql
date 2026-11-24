USE EraaSoftTask;
GO

ALTER TABLE Employees
ADD Salary DECIMAL(10, 2);

INSERT INTO Employees (ID, Name, DeptName, Salary)
VALUES
    (1, 'Ali Hassan', 'IT', 35000.00),
    (2, 'Mona Adel', 'HR', 42000.00),
    (3, 'Omar Khaled', 'Finance', 48000.00),
    (4, 'Sara Samir', 'IT', 55000.00),
    (5, 'Youssef Tarek', 'Sales', 62000.00),
    (6, 'Nourhan Magdy', 'HR', 45000.00),
    (7, 'Karim Ashraf', 'Finance', 59000.00);

-- 1. Select all columns from Employees
SELECT *
FROM Employees;

-- 2. Select only Name and Salary columns
SELECT Name, Salary
FROM Employees;

-- 3. Select distinct values of DeptName
SELECT DISTINCT DeptName
FROM Employees;

-- 4. Select top 5 records
SELECT TOP 5 *
FROM Employees;

-- 5. Select all records ordered by Salary descending
SELECT *
FROM Employees
ORDER BY Salary DESC;

-- 6. Select first 10 records starting from the 3rd record
SELECT *
FROM Employees
ORDER BY ID
OFFSET 2 ROWS FETCH NEXT 10 ROWS ONLY;

-- 7. Select average salary
SELECT AVG(Salary) AS AverageSalary
FROM Employees;

-- 8. Select maximum and minimum salaries
SELECT MAX(Salary) AS MaxSalary,
       MIN(Salary) AS MinSalary
FROM Employees;

-- 9. Select top 3 highest salaries
SELECT TOP 3 Salary
FROM Employees
ORDER BY Salary DESC;

-- 10. Select all records ordered by Name ascending
SELECT *
FROM Employees
ORDER BY Name ASC;

-- 11. Select first 5 records starting from the 2nd record, ordered by Salary descending
SELECT *
FROM Employees
ORDER BY Salary DESC
OFFSET 1 ROW FETCH NEXT 5 ROWS ONLY;

-- 12. Select sum of all salaries
SELECT SUM(Salary) AS TotalSalaries
FROM Employees;

-- 13. Select records where Salary is between 40000 and 60000, ordered by Salary ascending
SELECT *
FROM Employees
WHERE Salary BETWEEN 40000 AND 60000
ORDER BY Salary ASC;