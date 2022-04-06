-- Constraints default
SELECT
	 [S].[name] [SCHEMA]
	,[T].[name] [TABLE]
	,[C].[Name] [COLUMN]
	,[DC].[name] [DEFAULT_CONSTRAINT]
	,[DC].[definition] [DEFAULT_CONSTRAINT_DEFINITION]
FROM [sys].[default_constraints] [DC]
INNER JOIN [sys].[tables] [T] ON [DC].[parent_object_id] = [T].[object_id]
INNER JOIN [sys].[schemas] [S] ON [T].[schema_id] = [S].[schema_id]
INNER JOIN [sys].[all_columns] [C] ON [T].[object_id] = [C].[object_id] AND [DC].[parent_column_id] = [C].[column_id] 
ORDER BY [SCHEMA], [TABLE], [DEFAULT_CONSTRAINT]
