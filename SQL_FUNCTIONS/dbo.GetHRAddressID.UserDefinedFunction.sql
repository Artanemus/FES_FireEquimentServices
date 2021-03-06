USE [IDFES]
GO
/****** Object:  UserDefinedFunction [dbo].[GetHRAddressID]    Script Date: 16/01/2022 1:04:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Ben Ambrose
-- Create date: 25/12/2021
-- Description:	Returns the 'best' HR AddressID
-- =============================================
CREATE OR ALTER FUNCTION [dbo].[GetHRAddressID] (
    -- Add the parameters for the function here
    @HRID INT
    )
RETURNS INT
AS
BEGIN
    DECLARE @Result AS INT;
    -- DEFAULT return value
    SET @Result = NULL;

    -- TRAP BAD HR ID
    IF @HRID IS NULL
        OR @HRID = 0
        RETURN @Result;

    -- CTE table - TmpA 
    WITH TmpA
    AS (
        SELECT HR.HRID
            , HRAddress.CreatedOn
            , HRAddress.SortList
            , HRAddress.HRAddressID
			, HRAddress.AddressTypeID
        FROM HR
        INNER JOIN HRAddress
            ON HR.HRID = HRAddress.HRID
        WHERE HR.HRID = @HRID
            AND HRAddress.IsArchived <> 1
            AND HRAddress.Address IS NOT NULL
        )
    -- Add the T-SQL statements to compute the return value here
    SELECT TOP 1 @Result = (TmpA.HRAddressID)
    FROM TmpA
    ORDER BY 
		-- GROUP ON CUSTOMER - REDUNDANT
		TmpA.HRID ASC
		-- User custom sorts the addresses by priority NULL LAST
        , CASE WHEN TmpA.SortList IS NULL THEN 0 ELSE 1 END DESC, TmpA.SortList ASC
		-- The primary address has preference NULL LAST
		, CASE WHEN TmpA.AddressTypeID IS NULL THEN 0 ELSE 1 END DESC, TmpA.AddressTypeID ASC
		-- Last resort - date created
        , TmpA.CreatedOn DESC

    -- Return the result of the function
    RETURN @Result
END
GO
