USE IDFES;

SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;

/*
IMPORTANT .......
include this line - else no records are returned by ACCESS ... random error.
Stops the message that shows the count of the number of rows affected by a Transact-SQL statement or stored procedure from being returned as part of the result set.
*/
SET NoCount ON;

DECLARE @NewLine CHAR(2);
SET @NewLine = CHAR(13) + CHAR(10);

-- Select rows from a Table or View '[TableOrViewName]' in schema '[dbo]'
SELECT SiteID
			,CONCAT (
                'SITE# '    
                ,FORMAT(Site.SiteID, '#0000')
                , @NewLine
                ,Site.Address
                , @NewLine
                ,Postcode.Suburb
				,', '
				,Postcode.STATE
				,' '
				,Postcode.Postcode
				) AS xSiteLabel
FROM [dbo].[Site]
LEFT OUTER JOIN dbo.Postcode ON site.PostcodeID = postcode.PostcodeID
GO 

