# MS SQL versions
[Microsoft SQL Server Versions List](http://sqlserverbuilds.blogspot.ru/)

DB version
New version - new features ("fiches") + new elements of T-SQL syntax.
Version format: major.minor.build.revision
major - change of business name.
minor - SP
build - big update
revision - minor update

Server versions: 
-----------------------------------------------------------------------------------------------------------------
Release                | RTM (no SP)   | Latest CU                                                              |
-----------------------------------------------------------------------------------------------------------------
SQL Server 2022        | Not released  |                                                                        |
Announced              |               |                                                                        |
SQL Server 16          |               |                                                                        |
-----------------------------------------------------------------------------------------------------------------
SQL Server 2019        |   15.0.2000.5 |	CU15 (15.0.4198.2, January 2022)                                      |
SQL Server 15          |               |                                                                        |
codename Aris Seattle  |               |                                                                        |
Support end date: 2025-01-07. Ext. end date: 2030-01-08.
-----------------------------------------------------------------------------------------------------------------
SQL Server 2017        | 14.0.1000.169 | CU28 (14.0.3430.2, January 2022)
SQL Server 14          |               |                                                                        |
codename vNext         |               |                                                                        |
Support end date: 2022-10-11. Ext. end date: 2027-10-12.
-----------------------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------------------
Commercial name        | RTM (no SP)  |       SP1       |       SP2       |       SP3        |       SP4       |
----------------------------------------------------------------------------------------------------------------
SQL Server 2016        |  13.0.1601.5 |     13.0.4001.0 |                 |                  |                 |
SQL Server 13          |              |  or 13.1.4001.0 |                 |                  |                 |
Support end date: 2021-07-13. Ext. end date: 2026-07-14.
----------------------------------------------------------------------------------------------------------------
SQL Server 2014        |  12.0.2000.8 |     12.0.4100.1 |     12.0.5000.0 |      12.0.6024.0 |                 |
SQL Server 12          |              |  or 12.1.4100.1 |  or 12.2.5000.0 |   or 12.3.6024.0 |                 |
codename Hekaton SQL14 |       + CU14 |          + CU13 |          + CU18 |            + CU4 |                 |
Support end date: 2019-07-09. Ext. end date: 2024-07-09.
----------------------------------------------------------------------------------------------------------------
SQL Server 2012        | 11.0.2100.60 |     11.0.3000.0 |     11.0.5058.0 |      11.0.6020.0 |     11.0.7001.0 |
SQL Server 11          |       + CU11 |  or 11.1.3000.0 |  or 11.2.5058.0 |   or 11.3.6020.0 |  or 11.4.7001.0 |
codename Denali        |              |          + CU16 |          + CU16 |           + CU10 |                 |
Support end date: 2017-07-11. Ext. end date: 2022-07-12.
----------------------------------------------------------------------------------------------------------------
SQL Server 2008 R2     | 10.50.1600.1 |    10.50.2500.0 |    10.50.4000.0 |    10.50.6000.34 |                 |
codename Kilimanjaro   |              | or 10.51.2500.0 | or 10.52.4000.0 | or 10.53.6000.34 |                 |
----------------------------------------------------------------------------------------------------------------
SQL Server 2008        | 10.0.1600.22 |     10.0.2531.0 |     10.0.4000.0 |    10.0.5500.0   |    10.0.6000.29 |
codename Katmai        |              |  or 10.1.2531.0 | or  10.2.4000.0 | or 10.3.5500.0   | or 10.4.6000.29 |
----------------------------------------------------------------------------------------------------------------
SQL Server 2005        |  9.0.1399.06 |        9.0.2047 |        9.0.3042 |         9.0.4035 |        9.0.5000 |
codename Yukon         |              |                 |                 |                  |                 |
----------------------------------------------------------------------------------------------------------------
SQL Server 2000        |      8.0.194 |         8.0.384 |         8.0.532 |          8.0.760 |        8.0.2039 |
codename Shiloh        |              |                 |                 |                  |                 |
----------------------------------------------------------------------------------------------------------------
SQL Server 7.0         |      7.0.623 |         7.0.699 |         7.0.842 |          7.0.961 |        7.0.1063 |
codename Sphinx        |              |                 |                 |                  |                 |
----------------------------------------------------------------------------------------------------------------

Select @@version
SELECT SERVERPROPERTY('productversion'), SERVERPROPERTY ('productlevel'), SERVERPROPERTY ('edition')


Matching database versions to server versions
----------------------------------------------
Server name           | Server version | Base version 
SQL Server 7.0        | 7.00.623       | 515
SQL Server 2000       | 8.00.194       | 539
SQL Server 2005       | 9.00.1399      | 611
SQL Server 2005 SP2   | 9.00.3042      | 612
SQL Server 2008       | 10.00.1600     | 655
SQL Server 2008 SP2   | 10.00.4000     | 655/662
SQL Server 2008R2     | 10.50.1600     | 661
SQL Server 2008R2 SP1 | 10.50.2500     | 661/663
SQL Server 2012 RC0   | 11.00.1750     | 705
SQL Server 2012 RTM   | 11.00.2100     | 706

1. If when restoring/connecting the base we get a "strange" message (a message unexpected by us), regardless of its text 
our first step is to make sure that the versions of the base and the server are compatible.
There is no official matching table. Perhaps because to encourage the administrator to buy the latest version of SQL Server.
2. It is more reliable to know the version of the connected database by browsing its ninth (boot) page with the DBCC PAGE command
  dbcc traceon(3604)
  dbcc page([dbname],1,9,3)
For backups
  use master
  restore headeronly from disk=N'D:\DataBackup\DB.bak'
