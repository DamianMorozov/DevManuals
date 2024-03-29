-- GUID fnGetGuid1Cv1

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

ALTER FUNCTION [fnGetGuid1C] (@ID BINARY(16)) 
RETURNS CHAR(36) 
BEGIN 
	DECLARE @CH CHAR(36) 
	DECLARE @UNIDENTIFIER CHAR(36) 
	SELECT @UNIDENTIFIER = CONVERT(CHAR(36),CAST(@ID AS UNIQUEIDENTIFIER)) 
		SELECT @CH = 
		RIGHT(@UNIDENTIFIER, 8) 
		+ SUBSTRING(@UNIDENTIFIER,24,5) 
		+ SUBSTRING(@UNIDENTIFIER,19,5) 
		+ '-' 
		+ SUBSTRING(@UNIDENTIFIER,7,2) 
		+ SUBSTRING(@UNIDENTIFIER,5,2) 
		+ '-' 
		+ SUBSTRING(@UNIDENTIFIER,3,2) 
		+ LEFT(@UNIDENTIFIER,2) 
		+ SUBSTRING(@UNIDENTIFIER,12,2) 
		+ SUBSTRING(@UNIDENTIFIER,10,2) 
		+ SUBSTRING(@UNIDENTIFIER,17,2) 
		+ SUBSTRING(@UNIDENTIFIER,15,2) 
		RETURN (@CH)
END;
