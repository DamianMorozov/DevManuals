-- SSIS Environments

SELECT 
	[E].[environment_id]
   ,[E].[name]
   ,[E].[folder_id]
   ,[E].[description]
   ,[E].[created_by_sid]
   ,[E].[created_by_name]
   ,[E].[created_time]
FROM [SSISDB].[catalog].[environments] [E]

SELECT 
	[ER].[reference_id]
   ,[ER].[project_id]
   ,[ER].[reference_type]
   ,[ER].[environment_folder_name]
   ,[ER].[environment_name]
   ,[ER].[validation_status]
   ,[ER].[last_validation_time]
FROM [SSISDB].[catalog].[environment_references] [ER]

SELECT 
	[EV].[variable_id]
   ,[EV].[environment_id]
   ,[EV].[name]
   ,[EV].[description]
   ,[EV].[type]
   ,[EV].[sensitive]
   ,[EV].[value]
FROM [SSISDB].[catalog].[environment_variables] [EV]
