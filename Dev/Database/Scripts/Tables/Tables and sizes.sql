-- Tables and sizes
SELECT
	[T].[name] [TABLE]
   ,[S].[name] [SCHEMA]
   ,SUM([A].[total_pages]) * 8 / 1024 [TOTAL_SPACE_MB]
   ,SUM([A].[used_pages]) * 8 / 1024 [USED_SPACE_MB]
   ,(SUM([A].[total_pages]) - SUM([A].[USED_PAGES])) * 8 / 1024 [UNUSED_SPACE_MB]
   ,[P].[rows] [ROW_COUNTS]
FROM [sys].[tables] [T]
INNER JOIN [sys].[indexes] [I] ON [T].[object_id] = [I].[object_id]
INNER JOIN [sys].[partitions] [P] ON [I].[object_id] = [P].[object_id] AND [I].[index_id] = [P].[index_id]
INNER JOIN [sys].[allocation_units] [A] ON [P].[partition_id] = [A].[container_id]
LEFT OUTER JOIN [sys].[schemas] [S] ON [T].[schema_id] = [S].[schema_id]
WHERE [T].[is_ms_shipped] = 0 AND [I].[object_id] > 255
GROUP BY [T].[name], S.[name], [P].ROWS
ORDER BY [TOTAL_SPACE_MB] DESC
