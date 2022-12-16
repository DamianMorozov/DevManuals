-- Constraints check
SELECT
	 [S].[name] [SCHEMA]
	,[T].[name] [TABLE]
	,[C].[Name] [COLUMN]
	,[CC].[name] [CHECK_CONSTRAINT]
	,[CC].[definition] [CHECK_CONSTRAINT_DEFINITION]
FROM [sys].[check_constraints] [CC]
INNER JOIN [sys].[tables] [T] ON [CC].[parent_object_id] = [T].[object_id]
INNER JOIN [sys].[schemas] [S] ON [T].[schema_id] = [S].[schema_id]
INNER JOIN [sys].[all_columns] [C] ON [T].[object_id] = [C].[object_id] AND [CC].[parent_column_id] = [C].[column_id] 
ORDER BY [SCHEMA], [TABLE], [CHECK_CONSTRAINT]
