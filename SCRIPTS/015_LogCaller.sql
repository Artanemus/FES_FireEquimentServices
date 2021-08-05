USE [IDFES]
GO

/****** Object:  Table [dbo].[LogCaller]    Script Date: 3/08/2021 4:02:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LogCaller]') AND type in (N'U'))
DROP TABLE [dbo].[LogCaller]
GO

/****** Object:  Table [dbo].[LogCaller]    Script Date: 3/08/2021 4:02:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogCaller](
	[LogCallerID] [int] IDENTITY(1,1) NOT NULL,
	[Caption] [nvarchar](50) NULL,
 CONSTRAINT [PK242] PRIMARY KEY CLUSTERED 
(
	[LogCallerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


SET IDENTITY_INSERT [dbo].[LogCaller] ON 
GO
INSERT [dbo].[LogCaller] ([LogCallerID], [Caption]) VALUES (1, N'mdlInspect')
GO
INSERT [dbo].[LogCaller] ([LogCallerID], [Caption]) VALUES (2, N'clsInspectOrder')
GO
INSERT [dbo].[LogCaller] ([LogCallerID], [Caption]) VALUES (3, N'xDlgInspect_Begin')
GO
SET IDENTITY_INSERT [dbo].[LogCaller] OFF
GO
