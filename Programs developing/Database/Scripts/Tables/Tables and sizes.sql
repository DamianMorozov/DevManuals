-- Tables and sizes
select
   [t].[Name]                                            [Table]
  ,[s].[Name]                                            [Schema]
  ,sum([a].[total_pages])*8                              [TotalSpaceKB]
  ,sum([a].[used_pages])*8                               [UsedSpaceKB]
  ,(sum([a].[total_pages])-sum([a].[used_pages]))*8      [UnusedSpaceKB]
  ,sum([a].[total_pages])*8 / 1024                       [TotalSpaceMB]
  ,sum([a].[used_pages])*8 / 1024                        [UsedSpaceMB]
  ,(sum([a].[total_pages])-sum([a].[used_pages]))*8/1024 [UnusedSpaceMB]
  ,[p].Rows                                              [RowCounts]
from
  sys.tables [t]
  inner join sys.indexes [i] ON [t].[object_id] = [i].[object_id]
  inner join sys.partitions [p] ON [i].[object_id] = [p].[object_id] and [i].[index_id] = [p].[index_id]
  inner join sys.allocation_units [a] ON [p].[partition_id] = [a].container_id
  left outer join sys.schemas [s] ON [t].[schema_id] = [s].[schema_id]
where
  --[t].[Name] not like 'dt%'
   [t].[is_ms_shipped] = 0
  and [i].[object_id] > 255
group by
  [t].[Name], s.[Name], [p].Rows
order by
  [TotalSpaceKB] desc
