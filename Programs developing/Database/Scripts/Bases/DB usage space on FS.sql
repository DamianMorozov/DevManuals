------------------------------------------------------------------------------------------------------------------------
-- DB USAGE SPACE ON FS
DECLARE @USE_DATABASE_FILES BIT = 1
DECLARE @USE_MASTER_FILES BIT = 0
DECLARE @USE_SP_SPACEUSED  BIT = 0
DECLARE @USE_SP_HELPDB BIT = 0
DECLARE @USE_SP_DATABASES BIT = 0
------------------------------------------------------------------------------------------------------------------------
IF (@USE_DATABASE_FILES = 1) BEGIN
	-- USE [DB_NAME]
	SELECT
		 [NAME] [DB_NAME]
		,[SIZE] [DB_SIZE]
		,[SIZE] * 8 / 1024 [DB_SIZE_MB]
		,[MAX_SIZE]
		,[MAX_SIZE] * 8 / 1024 [MAX_SIZE_MB]
	FROM [SYS].[DATABASE_FILES]
END
------------------------------------------------------------------------------------------------------------------------
IF (@USE_MASTER_FILES = 1) BEGIN
	SELECT DISTINCT
		  SERVERPROPERTY('MACHINENAME') [MACHINE_NAME]
		 ,ISNULL(SERVERPROPERTY('INSTANCENAME'), 'MSSQLSERVER') [INSTANCE_NAME]
		 ,[MF].[NAME] [DB_NAME]
		 ,[MF].[SIZE] [DB_SIZE]
		 ,[MF].[SIZE] * 8 / 1024 [DB_SIZE_MB]
		 ,[MF].[MAX_SIZE] [DB_MAX_SIZE]
		 --,CASE WHEN [MF].[MAX_SIZE] > 0 THEN [MF].[MAX_SIZE] * 8 / 1024 ELSE [MF].[MAX_SIZE] END [DB_MAX_SIZE_MB]
		 ,[VS].[VOLUME_MOUNT_POINT] [VOLUMENAME]
		 ,[VS].LOGICAL_VOLUME_NAME [VOLUMELABEL]
		 ,[VS].TOTAL_BYTES [VOLUMECAPACITY]
		 ,[VS].AVAILABLE_BYTES [VOLUMEFREESPACE]
		 ,CAST ([VS].[AVAILABLE_BYTES] * 100.0 / [VS].[TOTAL_BYTES] AS DECIMAL(5, 2)) PERCENTAGEFREESPACE
	FROM [SYS].[MASTER_FILES] [MF]
	CROSS APPLY [SYS].[DM_OS_VOLUME_STATS]([MF].DATABASE_ID, [MF].[FILE_ID]) [VS]
END
------------------------------------------------------------------------------------------------------------------------
IF (@USE_SP_SPACEUSED = 1) BEGIN
	--USE [DB_NAME]
	EXEC SP_SPACEUSED
	--EXEC SP_SPACEUSED N'DBO.TABLE'
END
------------------------------------------------------------------------------------------------------------------------
IF (@USE_SP_HELPDB = 1) BEGIN
	EXEC SP_HELPDB
	--EXEC SP_HELPDB N'DBNAME'
END
------------------------------------------------------------------------------------------------------------------------
IF (@USE_SP_DATABASES = 1) BEGIN
	EXEC SP_DATABASES
END
------------------------------------------------------------------------------------------------------------------------
