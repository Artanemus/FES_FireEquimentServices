USE [IDFES]
GO
/****** Object:  UserDefinedFunction [dbo].[GetCustContactNum]    Script Date: 16/01/2022 1:04:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Ben Ambrose
-- Create date: 25/12/2021
-- Description:	Returns the 'best' customer AddressID
-- =============================================
CREATE OR ALTER  FUNCTION [dbo].[GetCustContactNum] (
	-- Add the parameters for the function here
	@CustomerID INT
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
	IF @CustomerID IS NULL
		OR @CustomerID = 0
		RETURN @Result;

	-- CTE table - TmpA 
	WITH TmpA
	AS (
		SELECT dbo.CustContactNum.CustContactNumID
			,dbo.CustContactNum.CustomerID
			,dbo.CustContactNum.SortList
			,dbo.CustContactNum.ContactNumTypeID
			,dbo.CustContactNum.CreatedOn
			,dbo.CustContactNum.ContactNum
			,dbo.CustContactNum.IsArchived
		FROM dbo.CustContactNum
		WHERE (
				(dbo.CustContactNum.CustomerID = @CustomerID)
				AND (dbo.CustContactNum.ContactNum IS NOT NULL)
				AND (dbo.CustContactNum.IsArchived <> 1)
				)
		)
	-- Add the T-SQL statements to compute the return value here
	SELECT TOP 1 @Result = (TmpA.ContactNum)
	FROM TmpA
	ORDER BY
		-- GROUP ON Cust - REDUNDANT
		CustomerID ASC
		-- User custom sorts the contact numbers by priority NULL LAST
		,CASE 
			WHEN SortList IS NULL
				THEN 0
			ELSE 1
			END DESC
		,SortList ASC
		-- The primary number has preference NULL LAST
		,CASE 
			WHEN ContactNumTypeID IS NULL
				THEN 0
			ELSE 1
			END DESC
		,ContactNumTypeID ASC
		-- Last resort - date created
		,CreatedOn DESC

	-- Return the result of the function
	RETURN @Result
END
GO
