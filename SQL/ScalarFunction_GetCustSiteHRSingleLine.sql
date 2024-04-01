USE [IDFES]
GO

/****** Object:  UserDefinedFunction [dbo].GetCustSiteHRSingleLine    Script Date: 01/04/24 10:33:00 AM ******/
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
CREATE FUNCTION [dbo].GetCustSiteHRSingleLine
(
    -- Add the parameters for the function here
    @CustSiteID INT
  -- default: display contact's number
  , @DoHRNumber BIT = 1
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
    AS (SELECT CustSite.CustSiteID
             , CustSite.SiteContactID
             , CONCAT(HR.FirstName, ' ', UPPER(HR.LastName)) AS FName
             , dbo.GetHRNumber(CustSite.SiteContactID) AS SiteContactNum
        FROM CustSite
            INNER JOIN HR
                ON CustSite.SiteContactID = HR.HRID
        WHERE CustSite.SiteContactID IS NOT NULL
              AND CustSite.CustSiteID = @CustSiteID)
    -- Compute the return value using a CASE statement
    SELECT TOP 1
           @Result = (SUBSTRING(   CASE
                                       WHEN FName IS NULL THEN
                                           ''
                                       ELSE
                                           CASE
                                               WHEN LEN(SiteContactNum) > 0 THEN
                                                   CONCAT(   TmpA.FName
                                                           , ' '
                                                           , CASE
                                                                 WHEN @DoHRNumber = 1 THEN
                                                                     ' (' + TmpA.SiteContactNum + ')'
                                                                 ELSE
                                                                     ''
                                                             END
                                                         )
                                               ELSE
                                                   TmpA.FName
                                           END
                                   END
                                 , 1
                                 , 96
                               )
                     )
    FROM TmpA;

    -- Return the result of the function
    RETURN @Result;
END
GO
