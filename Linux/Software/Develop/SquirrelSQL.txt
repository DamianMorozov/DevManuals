# --------------------------------------------------------------------------------------------------
# Configuring SquirrelSQL and MS SQL
# https://gist.github.com/willist/2775454
# --------------------------------------------------------------------------------------------------
# 1. Install Squirrel SQL.
# http://squirrel-sql.sourceforge.net/#installation
# 2. Download Microsoft JDBC Driver for SQL Server.
# https://docs.microsoft.com/en-US/sql/connect/jdbc/download-microsoft-jdbc-driver-for-sql-server?view=sql-server-2017
# 3. Unpack JDBC Driver to a known location.
# 4. Open Squirrel SQL.
# 5. From the menu bar, select Drivers > New Driver.
# For the purpose of this example, [...] indicates a button.
Name: MSSQL
Example URL: jdbc:sqlserver://<url>:<port>;databaseName=<db name>;
Website URL: http://msdn.microsoft.com/en-us/library/ms378428(SQL.90).aspx
# Add the JDBC driver
[Extra Class Path] > [Add]
   <JDBC Driver Location>/enu/sqljdbc4.jar
   [Choose]
Class Name: com.microsoft.sqlserver.jdbc.SQLServerDriver
[OK]
# --------------------------------------------------------------------------------------------------

