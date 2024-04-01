USE [IDFES]
GO

/****** Object:  UserDefinedFunction [dbo].[GetHRSingleLine]    Script Date: 01/04/24 10:22:51 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		Ben Ambrose
-- Create date: 25/12/2021
-- Description:	Get the FULL NAME and contact number of the HR
-- returns MAX 96 CHARs
-- =============================================
CREATE OR ALTER FUNCTION [dbo].[GetHRSingleLine]
(
    -- Add the parameters for the function here
    @HRID INT
  -- default : display contact's number
  , @DoHRNumber BIT = 1
)
RETURNS NVARCHAR(96)
AS
BEGIN
    DECLARE @Result NVARCHAR(96);

    SET @Result = '';

    -- TRAP BAD CUSTOMER ID
    IF @HRID IS NULL
       OR @HRID = 0
        RETURN @Result;

    -- CTE table - TmpA 
    SELECT @Result
        = (SUBSTRING(
                        CASE
                            WHEN @DoHRNumber = 1 THEN
                                CONCAT(
                                          HR.FirstName
                                        , ' '
                                        , UPPER(HR.LastName)
                                        , CASE
                                              WHEN LEN(dbo.GetHRNumber(HR.HRID)) = 0 THEN
                                                  ''
                                              ELSE
                                                  ' (' + dbo.GetHRNumber(HR.HRID) + ')'
                                          END
                                      )
                            ELSE
                                CONCAT(HR.FirstName, ' ', UPPER(HR.LastName))
                        END
                      , 1
                      , 96
                    )
          )
    FROM dbo.HR
    WHERE HR.HRID = @HRID

    -- Return the result of the function
    RETURN @Result
END
GO


