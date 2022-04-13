------------------------------------------------------------------------------------------------------------------------
-- Conversion Functions
-- https://docs.microsoft.com/en-us/sql/t-sql/functions/conversion-functions-transact-sql
------------------------------------------------------------------------------------------------------------------------
SET NOCOUNT ON
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
DECLARE @RESULTS TABLE([FUNCTION] NVARCHAR(MAX), [RESULT] NVARCHAR(MAX))
DECLARE @TEST_STR NVARCHAR(MAX) = 'Test'
DECLARE @TEST_FLOAT NVARCHAR(MAX) = '1.2345'
DECLARE @TEST_DT NVARCHAR(MAX) = '2022-01-01'
------------------------------------------------------------------------------------------------------------------------
-- CAST and CONVERT
-- https://docs.microsoft.com/en-us/sql/t-sql/functions/cast-and-convert-transact-sql
-- Convert an expression of one data type to another.
------------------------------------------------------------------------------------------------------------------------
-- PARSE
-- https://docs.microsoft.com/en-us/sql/t-sql/functions/parse-transact-sql
-- Returns the result of an expression, translated to the requested data type in SQL Server.
INSERT INTO @RESULTS([function], [RESULT])
	SELECT 'PARSE('+@TEST_FLOAT+' AS FLOAT USING ''en-US'')', PARSE(@TEST_FLOAT AS FLOAT USING 'en-US')
INSERT INTO @RESULTS([function], [RESULT])
	SELECT 'PARSE('+@TEST_DT+' AS DATETIME USING ''en-US'')', PARSE(@TEST_DT AS DATETIME USING 'en-US')
------------------------------------------------------------------------------------------------------------------------
-- TRY_CAST
-- https://docs.microsoft.com/en-us/sql/t-sql/functions/try-cast-transact-sql
-- Returns a value cast to the specified data type if the cast succeeds; otherwise, returns null.
INSERT INTO @RESULTS([function], [RESULT])
	SELECT 'TRY_CAST('+@TEST_STR+' AS FLOAT)', TRY_CAST(@TEST_STR AS FLOAT)
INSERT INTO @RESULTS([function], [RESULT])
	SELECT 'TRY_CAST('+@TEST_FLOAT+'  AS FLOAT)', TRY_CAST(@TEST_FLOAT AS FLOAT)
INSERT INTO @RESULTS([function], [RESULT])
	SELECT 'TRY_CAST('+@TEST_DT+'  AS DATETIME)', TRY_CAST(@TEST_DT AS DATETIME)
------------------------------------------------------------------------------------------------------------------------
-- TRY_CONVERT
-- https://docs.microsoft.com/en-us/sql/t-sql/functions/try-convert-transact-sql
-- Returns a value cast to the specified data type if the cast succeeds; otherwise, returns null.
INSERT INTO @RESULTS([function], [RESULT])
	SELECT 'TRY_CONVERT(FLOAT, '+@TEST_STR+')', TRY_CONVERT(FLOAT, @TEST_STR)
INSERT INTO @RESULTS([function], [RESULT])
	SELECT 'TRY_CONVERT(FLOAT, '+@TEST_FLOAT+')', TRY_CONVERT(FLOAT, @TEST_FLOAT)
INSERT INTO @RESULTS([function], [RESULT])
	SELECT 'TRY_CONVERT(DATETIME, '+@TEST_DT+')', TRY_CONVERT(DATETIME, @TEST_DT)
------------------------------------------------------------------------------------------------------------------------
-- TRY_PARSE
-- https://docs.microsoft.com/en-us/sql/t-sql/functions/try-parse-transact-sql
-- Returns the result of an expression, translated to the requested data type, or null if the cast fails in SQL Server. 
-- Use TRY_PARSE only for converting from string to date/time and number types.
INSERT INTO @RESULTS([function], [RESULT])
	SELECT 'TRY_PARSE('+@TEST_STR+' AS FLOAT USING ''en-US'')', TRY_PARSE(@TEST_STR AS FLOAT USING 'en-US')
INSERT INTO @RESULTS([function], [RESULT])
	SELECT 'TRY_PARSE('+@TEST_FLOAT+' AS FLOAT USING ''en-US'')', TRY_PARSE(@TEST_FLOAT AS FLOAT USING 'en-US')
INSERT INTO @RESULTS([function], [RESULT])
	SELECT 'TRY_PARSE('+@TEST_DT+' AS DATETIME USING ''en-US'')', TRY_PARSE(@TEST_DT AS DATETIME USING 'en-US')
------------------------------------------------------------------------------------------------------------------------
SELECT [FUNCTION], RESULT FROM @RESULTS
SET NOCOUNT OFF
------------------------------------------------------------------------------------------------------------------------
