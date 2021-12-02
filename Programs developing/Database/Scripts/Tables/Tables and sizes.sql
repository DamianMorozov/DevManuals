-- Tables and sizes
SELECT
	[T].[Name] [TABLE]
   ,[S].[Name] [SCHEMA]
   ,SUM([A].[total_pages]) * 8 [TOTALSPACEKB]
   ,SUM([A].[used_pages]) * 8 [USEDSPACEKB]
   ,(SUM([A].[total_pages]) - SUM([A].[used_pages])) * 8 [UNUSEDSPACEKB]
   ,SUM([A].[total_pages]) * 8 / 1024 [TOTALSPACEMB]
   ,SUM([A].[used_pages]) * 8 / 1024 [USEDSPACEMB]
   ,(SUM([A].[total_pages]) - SUM([A].[used_pages])) * 8 / 1024 [UNUSEDSPACEMB]
   ,[P].rows [ROWCOUNTS]
FROM sys.tables [T]
INNER JOIN sys.indexes [I]
	ON [T].[object_id] = [I].[object_id]
INNER JOIN sys.partitions [P]
	ON [I].[object_id] = [P].[object_id]
		AND [I].[index_id] = [P].[index_id]
INNER JOIN sys.allocation_units [A]
	ON [P].[partition_id] = [A].container_id
LEFT OUTER JOIN sys.schemas [S]
	ON [T].[schema_id] = [S].[schema_id]
WHERE
--[t].[Name] not like 'dt%'
[T].[is_ms_shipped] = 0
AND [I].[object_id] > 255
GROUP BY [T].[Name]
		,S.[Name]
		,[P].rows
ORDER BY [TOTALSPACEKB] DESC
