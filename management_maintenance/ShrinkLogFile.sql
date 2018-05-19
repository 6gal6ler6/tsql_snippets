/*
THIS QUERY DELETES ALL INFORMATION ABOUT LOG FILE

USE WITH PRECAUTION!!! All Log will be lost..

Recommended to perform a Log File Backup.
*/

USE master ;  
ALTER DATABASE [DataBaseName] SET RECOVERY SIMPLE

USE DataBaseName;
CHECKPOINT;
GO
CHECKPOINT; -- run twice to ensure file wrap-around
GO
USE [DataBaseName]
GO
DBCC SHRINKFILE (N'DataBaseName_log' , 700, TRUNCATEONLY)
GO
USE [DataBaseName]
GO
DBCC SHRINKFILE (N'DataBaseName_log' , 700)
GO
