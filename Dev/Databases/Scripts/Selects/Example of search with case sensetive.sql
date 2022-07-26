-- Example of search with case sensetive.
USE [AdventureWorks2017]

-- Search with case insensitive.
SELECT
	[BusinessEntityID]
   ,[FirstName]
FROM [Person].[Person]
WHERE [FirstName] LIKE 'terri%'

-- Search with case sensetive.
SELECT
	[BusinessEntityID]
   ,[FirstName]
FROM [Person].[Person]
WHERE [FirstName] COLLATE SQL_Latin1_General_CP1_CS_AS LIKE 'terri%'
