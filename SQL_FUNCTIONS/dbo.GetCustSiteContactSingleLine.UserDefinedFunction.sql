USE [IDFES]
GO
/****** Object:  UserDefinedFunction [dbo].[GetCustSiteContactSingleLine]    Script Date: 16/01/2022 1:04:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Ben Ambrose
-- Create date: 25/12/2021
-- Description:	Get the site's contact name and number
-- returns MAX 96 CHARs
-- =============================================
CREATE OR ALTER FUNCTION [dbo].[GetCustSiteContactSingleLine] (
	-- Add the parameters for the function here
	@CustSiteID INT
	-- default : display contact's number
	, @DoHRContactNum BIT = 1
	)
RETURNS NVARCHAR(96)
AS
BEGIN
	DECLARE @Result NVARCHAR(96);

	SET @Result = '';

	-- TRAP BAD CUSTOMER ID
	IF @CustSiteID IS NULL
		OR @CustSiteID = 0
		RETURN @Result;

	-- CTE table - TmpA 
	WITH TmpA
	AS (
		SELECT CustSite.CustSiteID
			,CustSite.SiteContactID
			,CONCAT (
				HR.FirstName
				,' '
				,UPPER(HR.LastName)
				) AS FName
			,dbo.GetHRContactNum(CustSite.SiteContactID) AS SiteContactNum
		FROM CustSite
		INNER JOIN HR ON CustSite.SiteContactID = HR.HRID
		WHERE CustSite.SiteContactID IS NOT NULL AND CustSite.CustSiteID = @CustSiteID
		)
	-- Add the T-SQL statements to compute the return value here
		SELECT TOP 1 @Result = (
				SUBSTRING(CASE 
						WHEN FName IS NULL
							THEN ''
						ELSE CASE 
								WHEN LEN(SiteContactNum) > 0
									THEN CONCAT (
											TmpA.FName
											,' '
											,IIF(@DoHRContactNum = 1, ' (' + TmpA.SiteContactNum + ')', '')
											)
								ELSE TmpA.FName
								END
						END, 1, 96)
				)

	FROM TmpA

	-- Return the result of the function
	RETURN @Result
END
GO
