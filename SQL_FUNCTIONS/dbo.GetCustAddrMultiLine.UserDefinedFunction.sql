USE [IDFES]
GO
/****** Object:  UserDefinedFunction [dbo].[GetCustAddrMultiLine]    Script Date: 16/01/2022 1:04:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Ben Ambrose
-- Create date: 25/12/2021
-- Description:	Get 'best' pretty customer address - MULTI-LINE
-- returns MAX 128 CHARs
-- =============================================
CREATE OR ALTER FUNCTION [dbo].[GetCustAddrMultiLine] (
	-- Add the parameters for the function here
	@CustomerID INT
	)
RETURNS NVARCHAR(128)
AS
BEGIN
	-- Used to strip-out line returns used in customer address
	DECLARE @NewLine CHAR(2);
	-- Declare the return variable here
	-- Don't forget to assign the size of ALL NVARCHARs else default is one charcter 
	DECLARE @Result NVARCHAR(128)

	SET @NewLine = CHAR(13) + CHAR(10);
	-- DEFAULT :: returns NULL string
	SET @Result = '';

	-- TRAP BAD CUSTOMER ID
	IF @CustomerID IS NULL
		OR @CustomerID = 0
		RETURN @Result;

	-- CTE table - TmpA 
	WITH TmpA
	AS (
		SELECT Customer.CustomerID
			,CustAddress.CreatedOn
			,CustAddress.SortList
			,CustAddress.AddressTypeID
			,SUBSTRING(CustAddress.Address, 1, 64) AS xAddress
			,CONCAT (
				Postcode.Suburb
				,', '
				,Postcode.STATE
				,' '
				,Postcode.Postcode
				) AS xPostcode
		FROM Customer
		INNER JOIN CustAddress ON Customer.CustomerID = CustAddress.CustomerID
		INNER JOIN Postcode ON CustAddress.PostcodeID = Postcode.PostcodeID
		WHERE Customer.CustomerID = @CustomerID
			AND CustAddress.IsArchived <> 1
			AND CustAddress.Address IS NOT NULL
		)
	-- Add the T-SQL statements to compute the return value here
	SELECT TOP 1 @Result = (
			SUBSTRING(CONCAT (
					TmpA.xAddress
					,@NewLine
					,TmpA.xPostcode
					), 1, 128)
			)
	FROM TmpA
	ORDER BY
		-- GROUP ON CUSTOMER - REDUNDANT
		TmpA.CustomerID ASC
		-- User custom sorts the addresses by priority NULL LAST
		,CASE 
			WHEN TmpA.SortList IS NULL
				THEN 0
			ELSE 1
			END DESC
		,TmpA.SortList DESC
		-- The primary address has preference NULL LAST
		,CASE 
			WHEN TmpA.AddressTypeID IS NULL
				THEN 0
			ELSE 1
			END DESC
		,TmpA.AddressTypeID DESC
		-- Last resort - date created
		,TmpA.CreatedOn DESC

	-- Return the result of the function
	RETURN @Result
END
GO
