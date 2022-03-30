-- Constraints default
SELECT
	 [S].[name] [SCHEMA]
	,[T].[name] [TABLE]
	,[DC].[name] [DEFAULT_CONSTRAINT]
FROM [sys].[all_columns] [AC]
INNER JOIN [sys].[tables] [T] ON [AC].[object_id] = [T].[object_id]
INNER JOIN [sys].[schemas] [S] ON [T].[schema_id] = [S].[schema_id]
INNER JOIN [sys].[default_constraints] [DC] ON [AC].[default_object_id] = [DC].[object_id]
ORDER BY [SCHEMA], [TABLE], [DEFAULT_CONSTRAINT]
