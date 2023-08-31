CREATE TRIGGER tgr_emp_af_update
ON Employee
AFTER Update
AS
BEGIN
    INSERT INTO EmployeeAudit (actionName, insertDate)
    SELECT 'Update', GETDATE() FROM inserted;
	PRINT 'Update After Trigger Executed ..!'
END;