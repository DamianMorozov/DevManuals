DECLARE @CodeInIs VARBINARY = 0x80BB001E6722B44911E5EC3FE65770F0
SELECT convert(uniqueidentifier, convert(varbinary(64), @CodeInIs, 1)) [CodeInIs_AsGuid]
