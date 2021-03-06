USE [IDFES]
GO
/****** Object:  UserDefinedFunction [dbo].[GetHRContactSingleLine]    Script Date: 16/01/2022 1:04:23 PM ******/
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
CREATE OR ALTER FUNCTION [dbo].[GetHRContactSingleLine] (
	-- Add the parameters for the function here
	@HRID INT
	-- default : display contact's number
	, @DoHRContactNum BIT = 1
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
	SELECT  @Result = (
		SUBSTRING(CASE WHEN @DoHRContactNum = 1 THEN
			CONCAT (HR.FirstName,' ',UPPER(HR.LastName), iif(LEN(dbo.GetHRContactNum(HR.HRID)) = 0, '', ' ('+dbo.GetHRContactNum(HR.HRID)+ ')')	)
		ELSE
			CONCAT (HR.FirstName,' ',UPPER(HR.LastName))
		END, 1, 96)
		)

		FROM dbo.HR
		WHERE HR.HRID = @HRID

	-- Return the result of the function
	RETURN @Result
END
GO
