-- Tables and rows [sys].[indexes]
SELECT
	[O].[name] [TABLE]
   ,FORMAT([DDPS].[row_count], '#,#') [ROWS_COUNT]
FROM [sys].[indexes] [I]
INNER JOIN [sys].[objects] [O] ON [I].[object_id] = [O].[object_id]
INNER JOIN [sys].[dm_db_partition_stats] [DDPS] ON I.OBJECT_ID = [DDPS].[object_id] AND [I].[index_id] = [DDPS].[index_id]
WHERE [I].[index_id] < 2 AND [O].[is_ms_shipped] = 0
ORDER BY [DDPS].[row_count] DESC;

-- Tables and rows [sys].[tables]
SELECT
	[T].[name] [TABLE]
   ,FORMAT([S].[row_count], '#,#') [ROWS_COUNT]
FROM [sys].[tables] [T]
JOIN SYS.DM_DB_PARTITION_STATS [S] ON [T].[object_id] = [S].[object_id] AND [T].[type_desc] = 'USER_TABLE' AND [S].[index_id] IN (0, 1)
ORDER BY [S].[row_count] DESC;
