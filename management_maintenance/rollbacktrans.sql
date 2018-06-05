/*
* To rollback all uncommitted transactions
*/
ALTER DATABASE DatabaseName

SET SINGLE_USER

WITH ROLLBACK IMMEDIATE;

ALTER DATABASE DatabaseName

SET MULTI_USER;
