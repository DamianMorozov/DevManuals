-- json_value
declare @json nvarchar(max) = '{"parents":["Parent 1","Parent 2"]}'
declare @field1 nvarchar(max) = (select json_value(dbo.[RegexReplace](@json,'\s+',' '),'$.parents[0]'))
declare @field2 nvarchar(max) = (select json_value(dbo.[RegexReplace](@json,'\s+',' '),'$.parents[1]'))
select @field1 [FIELD 1], @field2 [FIELD 2]

set @json = '{"parents":["Parent 1","Parent 2					"]}'
set @field1 = (select json_value(@json, '$.parents[0]'))
--set @field2 = (select json_value(@json, '$.parents[1]'))  -- here is error: JSON text is not properly formatted. Unexpected character '	'
select @field1 [FIELD 1], @field2 [FIELD 2]
