USE [POKEDEX_DB]
GO
/****** Object:  Table [dbo].[USERS]    Script Date: 12/19/2024 11:25:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USERS](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](50) NULL,
	[pass] [varchar](50) NULL,
	[nombre] [varchar](50) NULL,
	[apellido] [varchar](50) NULL,
	[fechaNacimiento] [smalldatetime] NULL,
	[admin] [bit] NULL,
	[imagenPerfil] [varchar](30) NULL,
 CONSTRAINT [PK_USERS] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[USERS] ON 

INSERT [dbo].[USERS] ([id], [email], [pass], [nombre], [apellido], [fechaNacimiento], [admin], [imagenPerfil]) VALUES (1, N'prueba', N'123', N'Santi', N'Correa2', CAST(N'1997-02-01T00:00:00' AS SmallDateTime), 0, N'profile-1.jpg')
INSERT [dbo].[USERS] ([id], [email], [pass], [nombre], [apellido], [fechaNacimiento], [admin], [imagenPerfil]) VALUES (2, N'prueba2', N'1233', N'santu', N'correa', CAST(N'1997-01-01T00:00:00' AS SmallDateTime), 1, N'profile-2.jpg')
INSERT [dbo].[USERS] ([id], [email], [pass], [nombre], [apellido], [fechaNacimiento], [admin], [imagenPerfil]) VALUES (3, N'correasanti1997@gmail.com', N'santi123', NULL, NULL, NULL, 0, N'')
INSERT [dbo].[USERS] ([id], [email], [pass], [nombre], [apellido], [fechaNacimiento], [admin], [imagenPerfil]) VALUES (4, N'correasanti1997@gmail.com', N'santi123', NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[USERS] ([id], [email], [pass], [nombre], [apellido], [fechaNacimiento], [admin], [imagenPerfil]) VALUES (5, N'correasanti1997@gmail.com', N'365214', NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[USERS] ([id], [email], [pass], [nombre], [apellido], [fechaNacimiento], [admin], [imagenPerfil]) VALUES (6, N'correasanti@gmail.com', N'789', NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[USERS] ([id], [email], [pass], [nombre], [apellido], [fechaNacimiento], [admin], [imagenPerfil]) VALUES (7, N'pepe@pepito.com', N'peponidas', N'pepe', NULL, NULL, 0, N'')
INSERT [dbo].[USERS] ([id], [email], [pass], [nombre], [apellido], [fechaNacimiento], [admin], [imagenPerfil]) VALUES (8, N'pepe@pepitoprueba.com', N'pruieba', NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[USERS] ([id], [email], [pass], [nombre], [apellido], [fechaNacimiento], [admin], [imagenPerfil]) VALUES (9, N'pepe@pepito.com', N'123135', NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[USERS] ([id], [email], [pass], [nombre], [apellido], [fechaNacimiento], [admin], [imagenPerfil]) VALUES (10, N'pepe@pepito.com', N'AWS', NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[USERS] ([id], [email], [pass], [nombre], [apellido], [fechaNacimiento], [admin], [imagenPerfil]) VALUES (11, N'santutu', N'123456', NULL, NULL, NULL, 0, NULL)
SET IDENTITY_INSERT [dbo].[USERS] OFF
GO
