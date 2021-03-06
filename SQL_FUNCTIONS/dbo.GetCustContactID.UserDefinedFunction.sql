USE [IDFES]
GO
/****** Object:  UserDefinedFunction [dbo].[GetCustContactID]    Script Date: 16/01/2022 1:04:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Ben Ambrose
-- Create date: 25/12/2021
-- Description:	Returns the 'best' customer's HR contact
-- =============================================
CREATE OR ALTER  FUNCTION [dbo].[GetCustContactID] (
    -- Add the parameters for the function here
    @CustomerID INT
    )
RETURNS INT
AS
BEGIN
    DECLARE @Result AS INT;
    -- DEFAULT return value
    SET @Result = NULL;

    -- TRAP BAD HR ID
    IF @CustomerID IS NULL
        OR @CustomerID = 0
        RETURN @Result;

    -- CTE table - TmpA 
    WITH TmpA
    AS (
        SELECT CustContact.HRID
			, CustContact.CustomerID
            , CustContact.CreatedOn
            , CustContact.SortList
            , CustContact.CustContactID
			, CustContact.ContactTypeID
        FROM HR
        INNER JOIN CustContact
            ON HR.HRID = CustContact.HRID
        WHERE CustContact.CustomerID = @CustomerID
            AND CustContact.IsArchived <> 1
            AND CustContact.HRID IS NOT NULL
        )
    -- Add the T-SQL statements to compute the return value here
    SELECT TOP 1 @Result = (TmpA.HRID)
    FROM TmpA
    ORDER BY 
		-- GROUP ON CUSTOMER - REDUNDANT
		TmpA.CustomerID ASC
		-- User custom sorts the addresses by priority NULL LAST
        , CASE WHEN TmpA.SortList IS NULL THEN 0 ELSE 1 END DESC, TmpA.SortList ASC
		-- The primary address has preference NULL LAST
		, CASE WHEN TmpA.ContactTypeID IS NULL THEN 0 ELSE 1 END DESC, TmpA.ContactTypeID ASC
		-- Last resort - date created
        , TmpA.CreatedOn DESC

    -- Return the result of the function
    RETURN @Result
END
GO
