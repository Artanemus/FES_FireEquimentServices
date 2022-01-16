USE [IDFES]
GO
/****** Object:  UserDefinedFunction [dbo].[GetCustAddressID]    Script Date: 16/01/2022 1:04:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Ben Ambrose
-- Create date: 25/12/2021
-- Description:	Returns the 'best' customer AddressID
-- =============================================
CREATE OR ALTER FUNCTION [dbo].[GetCustAddressID] (
    -- Add the parameters for the function here
    @CustomerID INT
    )
RETURNS INT
AS
BEGIN
    DECLARE @Result AS INT;
    -- DEFAULT return value
    SET @Result = NULL;

    -- TRAP BAD CUSTOMER ID
    IF @CustomerID IS NULL
        OR @CustomerID = 0
        RETURN @Result;

    -- CTE table - TmpA 
    WITH TmpA
    AS (
        SELECT Customer.CustomerID
            , CustAddress.CreatedOn
            , CustAddress.SortList
            , CustAddress.CustAddressID
			, CustAddress.AddressTypeID
        FROM Customer
        INNER JOIN CustAddress
            ON Customer.CustomerID = CustAddress.CustomerID
        WHERE Customer.CustomerID = @CustomerID
            AND CustAddress.IsArchived <> 1
            AND CustAddress.Address IS NOT NULL
        )
    -- Add the T-SQL statements to compute the return value here
    SELECT TOP 1 @Result = (TmpA.CustAddressID)
    FROM TmpA
    ORDER BY 
		-- GROUP ON CUSTOMER - REDUNDANT
		TmpA.CustomerID ASC
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
