/*
Function for cleaning a string.
*/
CREATE FUNCTION [dbo].[fn_RemoveCharacters] (@str VARCHAR(MAX),@MatchExpression VARCHAR(255))
RETURNS NVARCHAR(MAX)
/*
USAGE EXAMPLES:

	Alphabetic only:
	SELECT dbo.fn_RemoveCharacters('a1!s2@d3#f4$', '^a-z')

	Numeric only:
	SELECT dbo.fn_RemoveCharacters('a1!s2@d3#f4$', '^0-9')

	Alphanumeric only:
	SELECT dbo.fn_RemoveCharacters('a1!s2@d3#f4$', '^a-z0-9')

	Non-alphanumeric:
	SELECT dbo.fn_RemoveCharacters('a1!s2@d3#f4$', 'a-z0-9')

	Non-alphanumeric and spaces:
	SELECT dbo.fn_RemoveCharacters('a1!s2 spaces @d3# f4$', '^a-z0-9\s')
*/

AS BEGIN
	DECLARE @specialchars VARCHAR(50) = '%['+@MatchExpression+']%'
	
	WHILE PATINDEX( @specialchars, @str ) > 0
	---Remove special characters using Replace function
	SET @str = Replace(REPLACE( @str, SUBSTRING( @str, PATINDEX( @specialchars, @str ), 1 ),' '),'-',' ')

	RETURN @str

END
