USE [IDFES]
GO

/****** Object:  UserDefinedFunction [dbo].[GetHRNumber]    Script Date: 01/04/24 10:03:12 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Ben Ambrose
-- Create date: 25/12/2021
-- Description:	Returns the 'best' customer AddressID
-- =============================================
CREATE OR ALTER FUNCTION [dbo].[GetHRNumber]
(
    -- Add the parameters for the function here
    @HRID INT
)
RETURNS NVARCHAR(64)
AS
BEGIN
    -- Declare the return variable here
    -- Don't forget to assign the size of the NVARCHAR else result will only hold one charcter 
    DECLARE @Result NVARCHAR(64)

    -- DEFAULT :: NULLSTRING
    SET @Result = '';

    -- TRAP BAD CUSTOMER ID
    IF @HRID IS NULL
       OR @HRID = 0
        RETURN @Result;

    -- CTE table - TmpA 
    WITH TmpA
    AS (SELECT dbo.HRNumber.HRNumberID
             , dbo.HRNumber.HRID
             , dbo.HRNumber.SortList
             , dbo.HRNumber.NumberTypeID
             , dbo.HRNumber.CreatedOn
             , dbo.HRNumber.Number
             , dbo.HRNumber.IsArchived
        FROM dbo.HRNumber
        WHERE (
                  (dbo.HRNumber.HRID = @HRID)
                  AND (dbo.HRNumber.Number IS NOT NULL)
                  AND (dbo.HRNumber.IsArchived <> 1)
              ))
    -- Add the T-SQL statements to compute the return value here
    SELECT TOP 1
           @Result = (TmpA.Number)
    FROM TmpA
    ORDER BY
        -- GROUP ON HR - REDUNDANT
        HRID ASC
      -- User custom sorts the contact numbers by priority NULL LAST
      , CASE
            WHEN SortList IS NULL THEN
                0
            ELSE
                1
        END DESC
      , SortList ASC
      -- The primary number has preference NULL LAST
      , CASE
            WHEN NumberTypeID IS NULL THEN
                0
            ELSE
                1
        END DESC
      , NumberTypeID ASC
      -- Last resort - date created
      , CreatedOn DESC

    -- Return the result of the function
    RETURN @Result
END
GO


