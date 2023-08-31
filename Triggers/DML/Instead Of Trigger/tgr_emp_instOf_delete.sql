CREATE TRIGGER tgr_emp_instOf_delete
ON Employee
INSTEAD OF DELETE
AS
BEGIN
    UPDATE Employee
    SET isActive = 0
    WHERE EmployeeId IN (SELECT EmployeeId FROM Deleted);

	Print ' Insead of Delete Trigger Executed ..! '
END;