USE [BookStoreDatabase]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 17/06/1399 12:20:34 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 17/06/1399 12:20:34 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NULL,
	[Page] [int] NOT NULL,
	[PublisherId] [int] NULL,
	[CategoryId] [int] NULL,
 CONSTRAINT [PK_Books] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 17/06/1399 12:20:34 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Publishers]    Script Date: 17/06/1399 12:20:34 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Publishers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[Telephone] [nvarchar](max) NULL,
 CONSTRAINT [PK_Publishers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 17/06/1399 12:20:34 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1000) NOT NULL,
	[Username] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[Fullname] [nvarchar](max) NOT NULL,
	[Age] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200901104412_Init', N'3.1.7')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200901105045_AddTable_Books', N'3.1.7')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200901105343_DropMainAndSubTitle_Books', N'3.1.7')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200901105744_AddTable_Categories', N'3.1.7')
GO
SET IDENTITY_INSERT [dbo].[Books] ON 
GO
INSERT [dbo].[Books] ([Id], [Title], [Page], [PublisherId], [CategoryId]) VALUES (1, N'Batman: Dark knight', 800, 1, 1)
GO
INSERT [dbo].[Books] ([Id], [Title], [Page], [PublisherId], [CategoryId]) VALUES (2, N'LOR: Start', 54554, 1, 2)
GO
INSERT [dbo].[Books] ([Id], [Title], [Page], [PublisherId], [CategoryId]) VALUES (3, N'Hello World', 4000, 2, 3)
GO
SET IDENTITY_INSERT [dbo].[Books] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 
GO
INSERT [dbo].[Categories] ([Id], [Title]) VALUES (1, N'Story')
GO
INSERT [dbo].[Categories] ([Id], [Title]) VALUES (2, N'Art')
GO
INSERT [dbo].[Categories] ([Id], [Title]) VALUES (3, N'Computer')
GO
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Publishers] ON 
GO
INSERT [dbo].[Publishers] ([Id], [Title], [Address], [Telephone]) VALUES (1, N'Noor', NULL, NULL)
GO
INSERT [dbo].[Publishers] ([Id], [Title], [Address], [Telephone]) VALUES (2, N'Kosar.e.Iranin', NULL, NULL)
GO
INSERT [dbo].[Publishers] ([Id], [Title], [Address], [Telephone]) VALUES (3, N'Tehran', NULL, NULL)
GO
INSERT [dbo].[Publishers] ([Id], [Title], [Address], [Telephone]) VALUES (6, N'Nasr', NULL, NULL)
GO
INSERT [dbo].[Publishers] ([Id], [Title], [Address], [Telephone]) VALUES (7, N'NamakAbrood Sofla', NULL, NULL)
GO
INSERT [dbo].[Publishers] ([Id], [Title], [Address], [Telephone]) VALUES (8, N'Negah', NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Publishers] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([Id], [Username], [Password], [Fullname], [Age]) VALUES (1, N'peyman', N'827ccb0eea8a706c4c34a16891f84e7b', N'Peyman Majidi', 31)
GO
INSERT [dbo].[Users] ([Id], [Username], [Password], [Fullname], [Age]) VALUES (1001, N'keywan', N'01cfcd4f6b8770febfb40cb906715822', N'Keywan Majidi', 29)
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_Categories]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_Publishers_PublisherId] FOREIGN KEY([PublisherId])
REFERENCES [dbo].[Publishers] ([Id])
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_Publishers_PublisherId]
GO
