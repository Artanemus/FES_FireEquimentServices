USE [IDFES]
GO

--
 -- remove duplicant  KIM GRIGGS
--

DELETE FROM [dbo].[HRAddress]
      WHERE HRID = 2
GO


DELETE FROM [dbo].[HREmail]
      WHERE HRID = 2
GO

DELETE FROM [dbo].[HRContactNum]
      WHERE HRID = 2
GO

	-- remove association to customer

DELETE FROM [dbo].[CustContact]
      WHERE HRID = 2
GO 

DELETE FROM [dbo].[HR]
      WHERE HRID = 2
GO


--
 -- remove duplicant OLIVA HUH
--

DELETE FROM [dbo].[HRAddress]
      WHERE HRID = 10
GO


DELETE FROM [dbo].[HREmail]
      WHERE HRID = 10
GO

DELETE FROM [dbo].[HRContactNum]
      WHERE HRID = 10
GO

	-- remove association to customer

DELETE FROM [dbo].[CustContact]
      WHERE HRID = 10
GO 

DELETE FROM [dbo].[HR]
      WHERE HRID = 10
GO

--
 -- remove duplicant TONY LEE
--

DELETE FROM [dbo].[HRAddress]
      WHERE HRID = 1
GO


DELETE FROM [dbo].[HREmail]
      WHERE HRID = 1
GO

DELETE FROM [dbo].[HRContactNum]
      WHERE HRID = 1
GO

	-- remove association to customer

DELETE FROM [dbo].[CustContact]
      WHERE HRID = 1
GO 

DELETE FROM [dbo].[HR]
      WHERE HRID = 1
GO


