CREATE TRIGGER tgr_emp_af_delete
ON Employee
AFTER DELETE
AS
BEGIN
    INSERT INTO EmployeeAudit (actionName, insertDate)
    SELECT 'Delete', GETDATE() FROM deleted;
	PRINT 'Delete After Trigger Executed ..!'
END;