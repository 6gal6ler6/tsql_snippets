/*
THIS QUERY DELETES ALL INFORMATION ABOUT LOG FILE
*/

USE master ;  
ALTER DATABASE DatabaseName SET RECOVERY Simple;

USE DatabaseName;
CHECKPOINT;
GO
CHECKPOINT; -- run twice to ensure file wrap-around
GO
DBCC SHRINKFILE(DatabaseName_log, 100); -- unit is set in MBs
GO
