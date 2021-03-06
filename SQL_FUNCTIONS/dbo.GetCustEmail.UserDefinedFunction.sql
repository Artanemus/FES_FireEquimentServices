USE [IDFES]
GO
/****** Object:  UserDefinedFunction [dbo].[GetCustEmail]    Script Date: 16/01/2022 1:04:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Ben Ambrose
-- Create date: 25/12/2021
-- Description:	Returns the 'best' customer email Address
-- =============================================
CREATE  OR ALTER FUNCTION [dbo].[GetCustEmail] (
	-- Add the parameters for the function here
	@CustomerID INT
	)
RETURNS NVARCHAR(128)
AS
BEGIN
	DECLARE @Result NVARCHAR(128)

	-- DEFAULT :: NULLSTRING
	SET @Result = '';

	-- TRAP BAD CUSTOMER ID
	IF @CustomerID IS NULL
		OR @CustomerID = 0
		RETURN @Result;

	-- CTE table - TmpA 
	WITH TmpA
	AS (
		SELECT dbo.CustEmail.CustEmailID
			,dbo.CustEmail.CustomerID
			,dbo.CustEmail.SortList
			,dbo.CustEmail.EmailTypeID
			,dbo.CustEmail.CreatedOn
			,dbo.CustEmail.Email
			,dbo.CustEmail.IsArchived
		FROM dbo.CustEmail
		WHERE (
				(dbo.CustEmail.CustomerID = @CustomerID)
				AND (dbo.CustEmail.Email IS NOT NULL)
				AND (dbo.CustEmail.IsArchived <> 1)
				)
		)
	-- Add the T-SQL statements to compute the return value here
	SELECT TOP 1 @Result = (TmpA.Email)
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
			WHEN EmailTypeID IS NULL
				THEN 0
			ELSE 1
			END DESC
		,EmailTypeID ASC
		-- Last resort - date created
		,CreatedOn DESC

	-- Return the result of the function
	RETURN @Result
END
GO
