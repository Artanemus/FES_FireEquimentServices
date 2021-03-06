USE [IDFES]
GO
/****** Object:  UserDefinedFunction [dbo].[GetHRAddrMultiLine]    Script Date: 16/01/2022 1:04:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Ben Ambrose
-- Create date: 25/12/2021
-- Description:	Get 'best' pretty HR address - MULTI-LINE
-- returns MAX 128 CHARs
-- =============================================
CREATE OR ALTER FUNCTION [dbo].[GetHRAddrMultiLine] (
	-- Add the parameters for the function here
	@HRID INT
	)
RETURNS NVARCHAR(128)
AS
BEGIN
	-- Used to strip-out line returns used in HR address
	DECLARE @NewLine CHAR(2);
	-- Declare the return variable here
	-- Don't forget to assign the size of ALL NVARCHARs else default is one charcter 
	DECLARE @Result NVARCHAR(128)

	SET @NewLine = CHAR(13) + CHAR(10);
	-- DEFAULT :: returns NULL string
	SET @Result = '';

	-- TRAP BAD CUSTOMER ID
	IF @HRID IS NULL
		OR @HRID = 0
		RETURN @Result;

	-- CTE table - TmpA 
	WITH TmpA
	AS (
		SELECT HR.HRID
			,HRAddress.CreatedOn
			,HRAddress.SortList
			,HRAddress.AddressTypeID
			,SUBSTRING(HRAddress.Address, 1, 64) AS xAddress
			,CONCAT (
				Postcode.Suburb
				,', '
				,Postcode.STATE
				,' '
				,Postcode.Postcode
				) AS xPostcode
		FROM HR
		INNER JOIN HRAddress ON HR.HRID = HRAddress.HRID
		INNER JOIN Postcode ON HRAddress.PostcodeID = Postcode.PostcodeID
		WHERE HR.HRID = @HRID
			AND HRAddress.IsArchived <> 1
			AND HRAddress.Address IS NOT NULL
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
		TmpA.HRID ASC
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
