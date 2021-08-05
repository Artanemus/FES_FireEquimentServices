USE IDFES
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

SET IDENTITY_INSERT [IDFES].[dbo].[TestResult] ON 
---Portable, Electrical, WaterBase, Structure
INSERT INTO [IDFES].[dbo].[TestResult]
    (
    [TestResultID], [Caption], [ShortCaption]
    )
VALUES
         ( 1, N'-', N'Not Required' )
    ,    ( 2, N'F', N'FAILED' )
    ,    ( 3, N'P', N'PASSED')    
GO

SET IDENTITY_INSERT [IDFES].[dbo].[TestResult] OFF