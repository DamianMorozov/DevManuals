-- Get field as string

-- Unlimited XML
DECLARE @xml XML = (SELECT CONVERT(NVARCHAR(255), [Name]) + ', ' FROM [dbo].[Account] FOR XML PATH(''))
SELECT @xml [XML], DATALENGTH(@xml) [DATALENGTH]


-- Limited string
DECLARE @str NVARCHAR(MAX) = CAST(@xml AS NVARCHAR(MAX))
SELECT RTRIM(@str) [STRING], DATALENGTH(@str) [DATALENGTH], LEN(@str) [LEN]
