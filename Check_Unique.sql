

--delete Employee
--ALTER TABLE Employee add constraint CH_Employee_Salary CHECK(Salary > 2000 AND Salary < 4000)

--ALTER TABLE Employee add constraint CH_Employee_Salary CHECK(Salary > 2000 AND Salary < 4000)


ALTER TABLE Employee add constraint UK_Employee_Email Unique(Email)
SELECT * FROM Employee

delete from Employee where EmployeeId = 11