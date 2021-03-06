USE [IDFES]
GO
/****** Object:  UserDefinedFunction [dbo].[GetHRContactNum]    Script Date: 16/01/2022 1:04:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Ben Ambrose
-- Create date: 25/12/2021
-- Description:	Returns the 'best' customer AddressID
-- =============================================
CREATE OR ALTER FUNCTION [dbo].[GetHRContactNum] (
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
	AS (
		SELECT dbo.HRContactNum.HRContactNumID
			,dbo.HRContactNum.HRID
			,dbo.HRContactNum.SortList
			,dbo.HRContactNum.ContactNumTypeID
			,dbo.HRContactNum.CreatedOn
			,dbo.HRContactNum.ContactNum
			,dbo.HRContactNum.IsArchived
		FROM dbo.HRContactNum
		WHERE (
				(dbo.HRContactNum.HRID = @HRID)
				AND (dbo.HRContactNum.ContactNum IS NOT NULL)
				AND (dbo.HRContactNum.IsArchived <> 1)
				)
		)
	-- Add the T-SQL statements to compute the return value here
	SELECT TOP 1 @Result = (TmpA.ContactNum)
	FROM TmpA
	ORDER BY
		-- GROUP ON HR - REDUNDANT
		HRID ASC
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
