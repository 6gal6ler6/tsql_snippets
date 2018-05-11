

/*--
Importing an Excel Spreadsheet into a SQL Server Database
--*/


/*--
	*Enabling SQL Server Instance to Read File

To enable this feature just use the sp_configure system stored procedure in your SQL instance to display it's Advanced Settings in show advanced options parameter and soon to follow, enable the  Ad Hoc Distributed Queries setting to enabling the use of distributed queries.

These changes in the Advanced settings only take effect after the execution of the RECONFIGURE command.
--*/


USE [master]
GO

/*--CONFIGURING SQL INSTANCE TO ACCEPT ADVANCED OPTIONS--*/
EXEC sp_configure 'show advanced options', 1
RECONFIGURE
GO

/*--ENABLING USE OF DISTRIBUTED QUERIES--*/
EXEC sp_configure 'Ad Hoc Distributed Queries', 1
RECONFIGURE
GO

/*--
	*To get permission granted to use the Data Provider through sp_MSset_oledb_prop system stored procedure to link Microsoft.ACE.OLEDB.12.0 in SQL Server using AllowInProcess parameter so we can use the resources of the Data Provider and also allow the use of dynamic parameters in queries through of DynamicParameters  parameter for our queries can use T-SQL clauses
--*/

USE [master]
GO
/*--ADD DRIVERS IN SQL INSTANCE--*/
EXEC master.dbo.sp_MSset_oledb_prop N'Microsoft.ACE.OLEDB.12.0', N'AllowInProcess', 1
GO
/*ENABLE DynamicParameters--*/
EXEC master.dbo.sp_MSset_oledb_prop N'Microsoft.ACE.OLEDB.12.0', N'DynamicParameters', 1
GO

/*--
Querying and Importing the Spreadsheet

USE THE OPENROWSET (Transact-SQL)

MORE INFORMATION:
https://docs.microsoft.com/en-us/sql/t-sql/functions/openrowset-transact-sql?view=sql-server-2017

*/


/*--EXAMPLE CODE:*/

/*

/*--CONSULTING A SPREADSHEET--*/

SELECT * FROM OPENROWSET('Microsoft.ACE.OLEDB.12.0',
'Excel 12.0; Database=C:\Microsoft\Test.xls; HDR=YES; IMEX=1',
'SELECT * FROM [Sheet$]') 
GO

*/
