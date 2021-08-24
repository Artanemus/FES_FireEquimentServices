USE IDFES
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

SET IDENTITY_INSERT [IDFES].[dbo].[TestResult] ON 
---FILL NEW TABLE ....TEST RESULTS
INSERT INTO [IDFES].[dbo].[TestResult]
    (
    [TestResultID], [Caption], [ShortCaption]
    )
VALUES
         ( 1, N'-', N'-' )
    ,    ( 2, N'F', N'FAILED' )
    ,    ( 3, N'P', N'PASSED')    
GO

SET IDENTITY_INSERT [IDFES].[dbo].[TestResult] OFF


SET IDENTITY_INSERT [IDFES].[dbo].[CoreGroup] ON 
---FILL NEW TABLE ....CORE GROUP
INSERT INTO [IDFES].[dbo].[CoreGroup]
    (
    [CoreGroupID]
    , [Caption]
    )
VALUES
         ( 1, N'Portable'   )
    ,    ( 2, N'Electrical' )
    ,    ( 3, N'WaterBase'  )    
    ,    ( 4, N'Structure'  )
GO

SET IDENTITY_INSERT [IDFES].[dbo].[CoreGroup] OFF

SET IDENTITY_INSERT [IDFES].[dbo].[HydrantType] ON 
---FILL NEW TABLE .... HYDRANT TYPES
INSERT INTO [dbo].[HydrantType]
	
           ([HydrantTypeID]
		   ,[Caption]
           ,[ShortCaption])
     VALUES
           (1 ,N'Hydrant',N'HYD')
		   ,(2 ,N'Double Hydrant',N'D/HYD')
		   ,(3 ,N'Pillar Hydrant',N'P/HYD')
GO 

SET IDENTITY_INSERT [IDFES].[dbo].[HydrantType] OFF 

GO

SET IDENTITY_INSERT [dbo].[LogCaller] ON 
GO
INSERT [dbo].[LogCaller] ([LogCallerID], [Caption]) VALUES (3, N'xDlgInspect_Begin')
INSERT [dbo].[LogCaller] ([LogCallerID], [Caption]) VALUES (4, N'mdlCheck')
INSERT [dbo].[LogCaller] ([LogCallerID], [Caption]) VALUES (5, N'mdlEnable')
GO
SET IDENTITY_INSERT [dbo].[LogCaller] OFF
GO


UPDATE [dbo].[LogCaller]
   SET [Caption] = N'mdlInspect'
 WHERE LogCallerID = 1
GO

UPDATE [dbo].[LogCaller]
   SET [Caption] = N'clsInspectOrder'
 WHERE LogCallerID = 2
GO

