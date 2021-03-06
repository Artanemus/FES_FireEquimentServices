USE [IDFES]
GO
/****** Object:  UserDefinedFunction [dbo].[GetCustAddrSingleLine]    Script Date: 16/01/2022 1:04:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Ben Ambrose
-- Create date: 25/12/2021
-- Description:	Get 'best' pretty customer address SINGLE LINE
-- returns MAX 96 CHARs
-- =============================================
CREATE OR ALTER FUNCTION [dbo].[GetCustAddrSingleLine] (
	-- Add the parameters for the function here
	@CustomerID INT
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
			,SUBSTRING(REPLACE(CustAddress.Address, @NewLine, ' '), 1, 64) AS xAddress
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
			CASE 
				WHEN @DoPostCode = 1
					THEN SUBSTRING(CONCAT (
								TmpA.xAddress
								,' '
								,TmpA.xPostcode
								), 1, 96)
				ELSE TmpA.xAddress
				END
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
		,TmpA.SortList ASC
		-- The primary address has preference NULL LAST
		,CASE 
			WHEN TmpA.AddressTypeID IS NULL
				THEN 0
			ELSE 1
			END DESC
		,TmpA.AddressTypeID ASC
		-- Last resort - date created
		,TmpA.CreatedOn DESC

	-- Return the result of the function
	RETURN @Result
END
GO
