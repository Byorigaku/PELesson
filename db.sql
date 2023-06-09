USE [PhysicalStudies]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 19.04.2023 23:00:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[type] [int] NOT NULL,
	[login] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Занятия]    Script Date: 19.04.2023 23:00:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Занятия](
	[ID занятия] [int] NOT NULL,
	[Дисциплина] [varchar](50) NOT NULL,
	[Учитель] [int] NOT NULL,
	[Ученик] [int] NOT NULL,
	[Время_проведения] [datetime] NOT NULL,
 CONSTRAINT [PK_Занятия] PRIMARY KEY CLUSTERED 
(
	[ID занятия] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ученики]    Script Date: 19.04.2023 23:00:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ученики](
	[ID_ученика] [int] NOT NULL,
	[ФИО] [varchar](50) NOT NULL,
	[Возраст] [int] NOT NULL,
	[Класс] [int] NOT NULL,
	[Учитель] [int] NOT NULL,
	[ФИО учителя] [varchar](150) NOT NULL,
	[Дисциплина] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Ученики] PRIMARY KEY CLUSTERED 
(
	[ID_ученика] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Учителя]    Script Date: 19.04.2023 23:00:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Учителя](
	[ID_учителя] [int] NOT NULL,
	[ФИО] [varchar](50) NOT NULL,
	[Возраст] [int] NOT NULL,
	[Номер_телефона] [varchar](20) NOT NULL,
	[Дисциплина] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Учителя] PRIMARY KEY CLUSTERED 
(
	[ID_учителя] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Users] ([type], [login], [password]) VALUES (1, N'admin', N'admin')
ALTER TABLE [dbo].[Занятия]  WITH CHECK ADD  CONSTRAINT [FK_Занятия_Ученики] FOREIGN KEY([Ученик])
REFERENCES [dbo].[Ученики] ([ID_ученика])
GO
ALTER TABLE [dbo].[Занятия] CHECK CONSTRAINT [FK_Занятия_Ученики]
GO
ALTER TABLE [dbo].[Занятия]  WITH CHECK ADD  CONSTRAINT [FK_Занятия_Учителя] FOREIGN KEY([Учитель])
REFERENCES [dbo].[Учителя] ([ID_учителя])
GO
ALTER TABLE [dbo].[Занятия] CHECK CONSTRAINT [FK_Занятия_Учителя]
GO
ALTER TABLE [dbo].[Ученики]  WITH CHECK ADD  CONSTRAINT [FK_Ученики_Учителя] FOREIGN KEY([Учитель])
REFERENCES [dbo].[Учителя] ([ID_учителя])
GO
ALTER TABLE [dbo].[Ученики] CHECK CONSTRAINT [FK_Ученики_Учителя]
GO
