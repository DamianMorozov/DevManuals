# Lost sa password

## Original link
- [I lost sa password and no one has System Administrator (SysAdmin) permission](https://sqlserver-help.com/2012/02/08/help-i-lost-sa-password-and-no-one-has-system-administrator-sysadmin-permission-what-should-i-do/)

## Solution
```
If you are thinking that I am going to show you black magic to recover sa password or other login’s password then you have hit the wrong blog post. go back to search engine and search for better tool/utility. Smile

After spending many years with SQL Server product, I have seen situations where someone wants to get in to SQL Server as system administrator as someone recently left company who had System Administrator permission (or hundred other reasons). Till SQL 2000 days, it was impossible to solve such problem other than reinstalling SQL Server. Here are the typical questions I saw in forum:

Only sysadmin user is SA and I Lost SA password.
I am locked out of SQL server i.e. that no windows users are added (or removed them) as sysadmin and I forgot the password for sa
I am windows admin. How can I get sys admin privileges on SQL server express as I removed all sysadmin accounts from SQL.
Here are the various error you might see

Unable to create new database. This is generic error which means that you are not having permission.
SysAdminLost_1

TITLE: Microsoft SQL Server Management Studio
——————————
Create failed for Database ‘SQLServer-Help’.  (Microsoft.SqlServer.Smo)

For help, click: http://go.microsoft.com/fwlink?ProdName=Microsoft+SQL+Server&ProdVer=10.50.1617.0+((KJ_RTM_GDR).110422-1901+)&EvtSrc=Microsoft.SqlServer.Management.Smo.ExceptionTemplates.FailedOperationExceptionText&EvtID=Create+Database&LinkId=20476
——————————
ADDITIONAL INFORMATION:
An exception occurred while executing a Transact-SQL statement or batch. (Microsoft.SqlServer.ConnectionInfo)
——————————
CREATE DATABASE permission denied in database ‘master’. (Microsoft SQL Server, Error: 262)
For help, click: http://go.microsoft.com/fwlink?ProdName=Microsoft+SQL+Server&ProdVer=10.50.1617&EvtSrc=MSSQLServer&EvtID=262&LinkId=20476
——————————
BUTTONS:
OK
——————————

When you login to Management Studio, you would see only your own account and ‘sa’ as shown below
SysAdminLost_2

When you attempt to change password of ‘sa’ you might see below error.
SysAdminLost_3

TITLE: Microsoft SQL Server Management Studio
——————————
Change password failed for Login ‘sa’.  (Microsoft.SqlServer.Smo)
For help, click: http://go.microsoft.com/fwlink?ProdName=Microsoft+SQL+Server&ProdVer=10.50.1617.0+((KJ_RTM_GDR).110422-1901+)&EvtSrc=Microsoft.SqlServer.Management.Smo.ExceptionTemplates.FailedOperationExceptionText&EvtID=Change+password+Login&LinkId=20476
——————————
ADDITIONAL INFORMATION:
An exception occurred while executing a Transact-SQL statement or batch. (Microsoft.SqlServer.ConnectionInfo)
——————————
Cannot alter the login ‘sa’, because it does not exist or you do not have permission. (Microsoft SQL Server, Error: 15151)
For help, click: http://go.microsoft.com/fwlink?ProdName=Microsoft+SQL+Server&ProdVer=10.50.1617&EvtSrc=MSSQLServer&EvtID=15151&LinkId=20476
——————————
BUTTONS:
OK
——————————

 

All error messages appear because your account is not a System Administrator of SQL Server Instance.

So, what should you do now? Answer is simple, get yourself added as System Administrator. I know, you would say “don’t you think I have tried that as I got this error!”

SysAdminLost_4

TITLE: Microsoft SQL Server Management Studio
——————————
Add member failed for ServerRole ‘sysadmin’.  (Microsoft.SqlServer.Smo)
For help, click: http://go.microsoft.com/fwlink?ProdName=Microsoft+SQL+Server&ProdVer=10.50.1617.0+((KJ_RTM_GDR).110422-1901+)&EvtSrc=Microsoft.SqlServer.Management.Smo.ExceptionTemplates.FailedOperationExceptionText&EvtID=Add+member+ServerRole&LinkId=20476
——————————
ADDITIONAL INFORMATION:
An exception occurred while executing a Transact-SQL statement or batch. (Microsoft.SqlServer.ConnectionInfo)
——————————
User does not have permission to perform this action. (Microsoft SQL Server, Error: 15247)
For help, click: http://go.microsoft.com/fwlink?ProdName=Microsoft+SQL+Server&ProdVer=10.50.1617&EvtSrc=MSSQLServer&EvtID=15247&LinkId=20476
——————————
BUTTONS:
OK
——————————

 

Okay, here is the step by step guide to add any account as System Administrator of SQL Server. This is documented and completely supported way to gain back the rights.  To log into SQL Server as SysAdmin, you need to have Local Administrator permission on the windows which is hosting SQL Server. If you don’t have that also then you may want to check with your windows team to get access (I am not a windows guy)

Steps to login to SQL Server as System Administrator. [Provided you are having windows local administrator permissions]

Stop the SQL Server Service using ANY of below command.
Net Stop MSSQLServer (for default instance) / Net Step MSSQL$<InstanceName> If you want to know instance name, refer my earlier blog
Use SQL Server Configuration manager and stop the SQL service. [Start>Programs>Microsoft SQL Server 2005>Configuration Tools>SQL Server Configuration Manager]
Use Services console [ Start > Run > Services.msc] and locate the SQL instance you want to stop.
Start SQL Server in Single User mode. You need to use start-up parameter m to start SQL Service in single user mode. I prefer command line but its your choice.
Using command line
net start MSSQLServer /m SQLCMD        [For default instance]
net start MSSQL$<InstanceName> /m SQLCMD     [For named instance]
Using configuration Manager
Locate the service which you have stopped earlier. Go to its properties, “Advanced”, click on drop down at “Startup Parameters”  and add ;-mSQLCMD as shown below
SysAdminLost_5

You might notice that I have use SQLCMD after m. That’s not a typo. Many times, when you start SQL Server in single user mode, application grabs connection before you could. SQLCMD ensures that only SQLCMD program can connect to SQL Server when its running in single use mode. Here is the error you might see if above happens. SQLCMD should be in UPPERCASE. else that would also show same error. Please make sure there is no space between “;” and “-m”, the registry parameter parser is sensitive to such typos. You should see an entry in the SQL Server ERRORLOG file that says “SQL Server started in single-user mode.”

TITLE: Connect to Server
——————————
Cannot connect to (local)\SQL2k8R2.
——————————
ADDITIONAL INFORMATION:
Login failed for user ‘Contoso\demouser’. Reason: Server is in single user mode. Only one administrator can connect at this time. (Microsoft SQL Server, Error: 18461)
For help, click: http://go.microsoft.com/fwlink?ProdName=Microsoft+SQL+Server&EvtSrc=MSSQLServer&EvtID=18461&LinkId=20476
——————————
BUTTONS:
OK
——————————

Connect to SQL Server and add desired account in SysAdmin role.
I normally prefer to do it from SQLCMD (that’s why I added SQLCMD after m)
Open administrator command prompt. (i.e. right click on command prompt shortcut and choose “Run As Administrator”
Type sqlcmd –S <complete instance name> For example
sqlcmd –S. (for default instance)
sqlcmd –S.\MyInstance
For getting exact name, your my earlier blog
You are connected as System Administrator, because you are part of local administrator group in windows.
At this point you can add any account to sysadmin because you are connect as sysadmin. Here is the script I normally use to add local administrator group as a part of SysAdmin group in SQL Server Instance. You may want to tweak this as per your needs because I am adding all local admin as sysadmin which is not a good practise.
USE [master]
GO
CREATE LOGIN [BUILTIN\Administrators] FROM WINDOWS WITH DEFAULT_DATABASE=[master]
GO
EXEC master..sp_addsrvrolemember @loginame = N’BUILTIN\Administrators’, @rolename = N’sysadmin’
GO

Here is how it would look on sqlcmd command prompt
SysAdminLost_6

Stop SQL Server Service. You can use any method as described in first step
Start SQL Service normally. This means that you need to remove startup parameter
Here is the MSDN reference for above, just to show that its documented.

So, to conclude, I have not shown any trick to recover any password. Just showed you detailed steps to gain sysadmin access provided you have windows admin rights.

DISCLAIMER: Use the method that is described in this article only as a failure recovery mechanism
```
