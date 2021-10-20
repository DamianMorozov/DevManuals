-- Parse int value from string
declare @str nvarchar(255) = N'���� ��������: 30 ����� ��� ����������� �� 0�� �� +6�� � ������������� ��������� ������� 75%-78%. ��������� ��� ��������.'
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
	,patindex('% �����%', @str) - patindex('%[0-9]%', @str)
))
-- Result
select @str [STR], @value1 [VALUE_1], @value2 [VALUE_2], @value3 [VALUE_3]
