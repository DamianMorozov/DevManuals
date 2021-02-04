-- MD5
declare @str varchar(max) = N'Some text' -- MD5: 0x9db5682a4d778ca2cb79580bdb67083f
select HashBytes('MD5', @str)
select convert(varchar(32), HashBytes('MD5', @str), 2)
select substring(master.dbo.fn_varbintohexstr(HashBytes('MD5', @str)), 3, 32)
select substring(sys.fn_sqlvarbasetostr(HASHBYTES('MD5', @str)), 3, 32)
