-- Select last changed goods

-- Drop table
if (exists (select 1 from [INFORMATION_SCHEMA].[TABLES] where [TABLE_SCHEMA] = 'dbo' and [TABLE_NAME] = 'Prices')) begin
	drop table [dbo].[Prices]
end
-- Create data
set ansi_nulls on
set quoted_identifier on
create table [dbo].[Prices](
	[Id] [int] identity(1,1) not null,
	[Good] [nvarchar](255) not null,
	[ChangeDate] [Datetime] not null,
	[Price] decimal(10,2) not null,
primary key clustered ([Id] asc)
with (pad_index = off, statistics_norecompute = off, ignore_dup_key = off, allow_row_locks = on, allow_page_locks = on, optimize_for_sequential_key = off) on [PRIMARY]
) on [PRIMARY]
go
-- Insert data
insert into [dbo].[Prices]([Good], [ChangeDate], [Price]) values (N'Good 1','2021-01-01 11:00:00', 100.00)
insert into [dbo].[Prices]([Good], [ChangeDate], [Price]) values (N'Good 1','2021-02-01 11:00:00', 110.00)
insert into [dbo].[Prices]([Good], [ChangeDate], [Price]) values (N'Good 1','2021-03-01 11:00:00', 105.00)
insert into [dbo].[Prices]([Good], [ChangeDate], [Price]) values (N'Good 2','2021-04-01 11:00:00', 300.00)
insert into [dbo].[Prices]([Good], [ChangeDate], [Price]) values (N'Good 2','2021-04-01 11:00:00', 310.00)
insert into [dbo].[Prices]([Good], [ChangeDate], [Price]) values (N'Good 2','2021-05-01 11:00:00', 305.00)
insert into [dbo].[Prices]([Good], [ChangeDate], [Price]) values (N'Good 3','2021-06-01 11:00:00', 200.00)
insert into [dbo].[Prices]([Good], [ChangeDate], [Price]) values (N'Good 3','2021-07-01 11:00:00', 250.00)
insert into [dbo].[Prices]([Good], [ChangeDate], [Price]) values (N'Good 3','2021-08-01 11:00:00', 220.00)
insert into [dbo].[Prices]([Good], [ChangeDate], [Price]) values (N'Good 4','2021-09-01 11:00:00', 200.00)
insert into [dbo].[Prices]([Good], [ChangeDate], [Price]) values (N'Good 4','2021-10-01 11:00:00', 250.00)
insert into [dbo].[Prices]([Good], [ChangeDate], [Price]) values (N'Good 4','2021-11-01 11:00:00', 220.00)
insert into [dbo].[Prices]([Good], [ChangeDate], [Price]) values (N'Good 4','2021-12-01 11:00:00', 220.00)
-- Select all data
select * from [dbo].[Prices] order by [Good],[ChangeDate]
-- Select last changed goods
select [P2].[Id], [P2].[Good], [P2].[ChangeDate], [P2].[Price]
from [dbo].[Prices] [P2]
join (
	select [Good], max([ChangeDate]) [ChangeDate]
	from [dbo].[Prices]
	group by [Good]
) [P1] on [P1].[Good] = [P2].[Good] and [P1].[ChangeDate] = [P2].[ChangeDate]
order by [P2].[Good]
