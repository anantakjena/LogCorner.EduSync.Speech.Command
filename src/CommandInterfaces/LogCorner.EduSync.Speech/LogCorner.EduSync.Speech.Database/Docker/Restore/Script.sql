USE [master]
GO
/****** Object:  Database [LogCorner.CatMash.Data]    Script Date: 10/6/2018 4:55:28 PM ******/
CREATE DATABASE [LogCorner.EduSync.Speech.Data]
GO
USE [LogCorner.EduSync.Speech.Data]
GO
/****** Object:  Table [dbo].[MediaFile]    Script Date: 3/1/2019 11:04:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MediaFile](
	[ID] [uniqueidentifier] NOT NULL,
	[Url] [nvarchar](250) NULL,
	[SpeechID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_MediaFile] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Speech]    Script Date: 3/1/2019 11:04:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Speech](
	[ID] [uniqueidentifier] NOT NULL,
	[Title] [nvarchar](250) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Url] [nvarchar](250) NOT NULL,
	[Type] [int] NOT NULL,
 CONSTRAINT [PK_Presentation] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[MediaFile] ADD  DEFAULT (newid()) FOR [ID]
GO
ALTER TABLE [dbo].[Speech] ADD  DEFAULT (newid()) FOR [ID]
GO
ALTER TABLE [dbo].[Speech] ADD  DEFAULT ((1)) FOR [Type]
GO
ALTER TABLE [dbo].[MediaFile]  WITH CHECK ADD  CONSTRAINT [FK_MediaFile_Speech] FOREIGN KEY([SpeechID])
REFERENCES [dbo].[Speech] ([ID])
GO
ALTER TABLE [dbo].[MediaFile] CHECK CONSTRAINT [FK_MediaFile_Speech]
GO
