-- Parse int value from string
declare @str nvarchar(255) = N'Срок годности: 30 суток при температуре от 0°С до +6°С и относительной влажности воздуха 75%-78%. Упаковано под вакуумом.'
declare @value1 int
declare @value2 int
declare @value3 int
-- 1
set @value1 = substring(substring(@str, 
		patindex('%[0-9]%', @str), len(@str)), 0, patindex('%[^0-9]%', 
			substring(@str, patindex('%[0-9]%', @str), len(@str))))
-- 2
set @value2 = (select [value] from (
	select row_number() over (order by (select null)) [row], [value]
	from string_split((select substring(@str, patindex('%[0-9]%', @str), 16)), ' ')) Q
	where [row] = 1)
-- 3
set @value3 = (select substring (@str
	,patindex('%[0-9]%', @str)
	,patindex('% суток%', @str) - patindex('%[0-9]%', @str)
))
-- Result
select @str [STR], @value1 [VALUE_1], @value2 [VALUE_2], @value3 [VALUE_3]
