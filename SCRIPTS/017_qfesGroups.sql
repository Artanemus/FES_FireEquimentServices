USE IDFES
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

SET IDENTITY_INSERT [IDFES].[dbo].[qfesGroup] ON 
---Portable, Electrical, WaterBase, Structure
INSERT INTO [IDFES].[dbo].[qfesGroup]
    (
    [qfesGroupID]
    , [Caption]
    )
VALUES
         ( 1, N'Portable'   )
    ,    ( 2, N'Electrical' )
    ,    ( 3, N'WaterBase'  )    
    ,    ( 4, N'Structure'  )
GO

SET IDENTITY_INSERT [IDFES].[dbo].[qfesGroup] OFF
