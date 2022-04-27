-- Constraints unique
SELECT 
	 [TABLE_CATALOG]
	,[TABLE_SCHEMA]
	,[TABLE_NAME]
	,[CONSTRAINT_NAME]
	,[CONSTRAINT_CATALOG]
	,[CONSTRAINT_SCHEMA]
	,[CONSTRAINT_TYPE]
	,[IS_DEFERRABLE]
	,[INITIALLY_DEFERRED]
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS 
WHERE CONSTRAINT_TYPE = 'UNIQUE'
ORDER BY [TABLE_CATALOG], [TABLE_SCHEMA], [TABLE_NAME]
