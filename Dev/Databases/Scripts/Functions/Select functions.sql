------------------------------------------------------------------------------------------------------------------------
-- Select functions
------------------------------------------------------------------------------------------------------------------------
SET NOCOUNT ON;
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
------------------------------------------------------------------------------------------------------------------------
SELECT *
FROM [SYS].[OBJECTS]
WHERE [TYPE] IN ( N'FN', N'IF', N'TF', N'FS', N'FT')
ORDER BY [NAME];
------------------------------------------------------------------------------------------------------------------------
