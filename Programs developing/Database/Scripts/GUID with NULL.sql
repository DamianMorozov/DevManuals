-- GUID with NULL

if exists (select 1 from [INFORMATION_SCHEMA].[TABLES] where [TABLE_TYPE] = 'BASE TABLE' and [TABLE_NAME] = 'Table_2')
	drop table [dbo].[Table_2]
if exists (select 1 from [INFORMATION_SCHEMA].[TABLES] where [TABLE_TYPE] = 'BASE TABLE' and [TABLE_NAME] = 'Table_1')
	drop table [dbo].[Table_1]

CREATE TABLE [dbo].[Table_1](
	[UID] [uniqueidentifier] PRIMARY KEY DEFAULT NEWID(),
	[NAME] [nchar](10) NOT NULL
) ON [PRIMARY]

CREATE TABLE [dbo].[Table_2](
	[UID] [uniqueidentifier] NULL,
	[TABLE_1_UID] [uniqueidentifier] NULL FOREIGN KEY REFERENCES [dbo].[Table_1]([UID]),
	[NAME] [nchar](10) NOT NULL
) ON [PRIMARY]

INSERT INTO [dbo].[Table_1]([UID],[NAME]) VALUES(newid(), 'name 1')
INSERT INTO [dbo].[Table_1]([UID],[NAME]) VALUES(newid(), 'name 2')
declare @uid uniqueidentifier = (select [UID] from [dbo].[Table_1] where [NAME] = 'name 1')
INSERT INTO [dbo].[Table_2]([UID],[TABLE_1_UID],[NAME]) VALUES(newid(), @uid,'name 3')
INSERT INTO [dbo].[Table_2]([UID],[TABLE_1_UID],[NAME]) VALUES(newid(), NULL,'name 4')
set @uid = (select [UID] from [dbo].[Table_1] where [NAME] = 'name 2')
INSERT INTO [dbo].[Table_2]([UID],[TABLE_1_UID],[NAME]) VALUES(newid(), @uid,'name 5')
INSERT INTO [dbo].[Table_2]([UID],[TABLE_1_UID],[NAME]) VALUES(newid(), NULL,'name 6')

select * from [dbo].[Table_1]
select * from [dbo].[Table_2]
