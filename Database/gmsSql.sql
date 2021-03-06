USE [gms2]
GO
/****** Object:  Table [dbo].[ScoreEntries]    Script Date: 23.10.2018 0:59:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ScoreEntries](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[score] [int] NOT NULL,
	[userId] [int] NOT NULL,
	[timestamp] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ScoreEntry] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 23.10.2018 0:59:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](500) NOT NULL,
	[pass] [varchar](500) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ScoreEntries] ON 

INSERT [dbo].[ScoreEntries] ([id], [score], [userId], [timestamp]) VALUES (7, 219, 7, CAST(N'2018-10-22T23:20:54.6688110' AS DateTime2))
INSERT [dbo].[ScoreEntries] ([id], [score], [userId], [timestamp]) VALUES (8, 317, 9, CAST(N'2018-10-23T00:54:37.7563811' AS DateTime2))
SET IDENTITY_INSERT [dbo].[ScoreEntries] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([id], [name], [pass]) VALUES (7, N'lof', N'bz2-9g8-nab')
INSERT [dbo].[Users] ([id], [name], [pass]) VALUES (9, N'user', N'83c-953-cqk')
SET IDENTITY_INSERT [dbo].[Users] OFF
