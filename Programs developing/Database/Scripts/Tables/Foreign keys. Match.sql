-- Foreign keys. Match.
declare @table_foregin nvarchar(255) = 'LOGS'
declare @table_primary nvarchar(255) = 'LOG_TYPES'
select 
	 [fk_tab].[name] [foreign_table]
	,[pk_tab].[name] [primary_table]
	,[fk].[name] [fk_constraint_name]
from [sys].[foreign_keys] [fk]
inner join [sys].[tables] [fk_tab] on [fk_tab].[object_id] = [fk].[parent_object_id]
inner join [sys].[tables] [pk_tab] on [pk_tab].[object_id] = [fk].[referenced_object_id]
where [fk_tab].[name]=@table_foregin and [pk_tab].[name]=@table_primary
