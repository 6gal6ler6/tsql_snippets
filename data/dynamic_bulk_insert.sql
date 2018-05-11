/*
For importing data from *.txt files.
*/




CREATE PROCEDURE [dbo].[stp_LoadData_TDA__ImportRawData]
(@TargetTable  nvarchar(MAX)
,@Filename nvarchar(MAX)
,@FROW VARCHAR(10)
,@RowTerm VARCHAR(15)
,@FldTerm VARCHAR(15))
AS BEGIN

/*-- VARIABLES:
	*@TargetTable ==> Destination Table. Where Data will be stored
	*@Filename ==> Full file path. Example: 'F:\DataImport\datafile.txt'
	*@FROW Indicates FIRSTROW
	*@RowTerm ROWTERMINATOR
		Examples:
			Tab ==>	'\t'
			Newline character ==> '\n'
			Carriage return/line feed ==> '\r'
			Import File from Unix?
			Hexadecimal Code CR LF ==> '0x0a'
	*@FldTerm FIELDTERMINATOR
		INFO https://docs.microsoft.com/en-us/sql/relational-databases/import-export/specify-field-and-row-terminators-sql-server
*/

SET NOCOUNT ON;
	/*--Bulk Insert the data to temp table--*/
	BEGIN
	DECLARE @BulkImport NVARCHAR(MAX) = N'
		BULK INSERT '+@TargetTable+'
		FROM  '''+@Filename+'''
		WITH(
		FIRSTROW = '+@FROW+'
		,FIELDTERMINATOR  = '''+@FldTerm+'''
		,ROWTERMINATOR  = '''+@RowTerm+'''
		)'
		EXEC(@BulkImport)
	END
END
