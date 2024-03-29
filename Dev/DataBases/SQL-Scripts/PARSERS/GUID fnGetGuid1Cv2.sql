-- GUID fnGetGuid1Cv2

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

ALTER FUNCTION [fnGetGuid1Cv2] (@ID BINARY(16))
RETURNS NCHAR(36)
BEGIN
DECLARE @ID_STRING NCHAR(32);
SET @ID_STRING = SUBSTRING(SYS.FN_SQLVARBASETOSTR(@ID),3,32);
RETURN(
  SUBSTRING(@ID_STRING,25,8) + '-' +
  SUBSTRING(@ID_STRING,21,4) + '-' +
  SUBSTRING(@ID_STRING,17,4) + '-' +
  SUBSTRING(@ID_STRING,1,4) + '-' +
  SUBSTRING(@ID_STRING,5,12)
  );
END;
