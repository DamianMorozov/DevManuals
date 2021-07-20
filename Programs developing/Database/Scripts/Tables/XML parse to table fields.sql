-- XML parse to table fields
declare @xml xml = '
<Product Category="Category" Code="Code" Description="Description" >
</Product>
'
select  
     Product.Col.value('@Category', 'nvarchar(255)') [Category]
    ,Product.Col.value('@Code', 'nvarchar(255)') [Code]
    ,Product.Col.value('@Description', 'nvarchar(255)') [Description]
from  @xml.nodes('//Product') Product(Col)  
