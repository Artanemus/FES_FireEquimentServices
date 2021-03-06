USE [IDFES]
GO
/****** Object:  UserDefinedFunction [dbo].[GetSiteAddrSingleLine]    Script Date: 16/01/2022 1:04:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Ben Ambrose
-- Create date: 25/12/2021
-- Description:	Get pretty site address SINGLE LINE
-- returns MAX 96 CHARs
-- =============================================
CREATE OR ALTER    FUNCTION [dbo].[GetSiteAddrSingleLine] (
	-- Add the parameters for the function here
	@SiteID INT
	-- default : display suburb, state and postcode
	,@DoPostCode BIT = 1
	)
RETURNS NVARCHAR(96)
AS
BEGIN
	-- Used to strip-out line returns used in customer address
	DECLARE @NewLine CHAR(2);
	-- Declare the return variable here
	-- Don't forget to assign the size of the NVARCHAR else result will only hold one charcter 
	DECLARE @Result NVARCHAR(96)

	SET @NewLine = CHAR(13) + CHAR(10);
	SET @Result = '';

	-- TRAP BAD CUSTOMER ID
	IF @SiteID IS NULL
		OR @SiteID = 0
		RETURN @Result;


	SELECT TOP 1 @Result = (
			CASE 
				WHEN @DoPostCode = 1
					THEN SUBSTRING(CONCAT (
								SUBSTRING(REPLACE(Site.Address, @NewLine, ' '), 1, 64)
								,' '
								,Postcode.Suburb
								,', '
								,Postcode.STATE
								,' '
								,Postcode.Postcode
								), 1, 96)
				ELSE SUBSTRING(REPLACE(Site.Address, @NewLine, ' '), 1, 96)
				END
			)
	FROM Site
	INNER JOIN Postcode ON Site.PostcodeID = Postcode.PostcodeID
	WHERE Site.SiteID = @SiteID
		AND Site.Address IS NOT NULL

	-- Return the result of the function
	RETURN @Result
END
GO
