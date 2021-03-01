-- Working With SQL Notification
-- https://www.c-sharpcorner.com/UploadFile/87b416/working-with-sql-notification/

-- Set Broker enable
alter database [DbName] set enable_broker 
-- View Broker enablad
select [Name], [Database_id] [Id], [is_broker_enabled] from sys.databases
