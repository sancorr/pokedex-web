use master
go 
create database POKEDEX_DB
go
use POKEDEX_DB
go
USE [POKEDEX_DB]
GO

/****** Object:  Table [dbo].[ELEMENTOS]    Script Date: 8/5/2021 9:48:22 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ELEMENTOS](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NULL,
 CONSTRAINT [PK_ELEMENTOS] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [POKEDEX_DB]
GO

/****** Object:  Table [dbo].[POKEMONS]    Script Date: 8/5/2021 9:48:29 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[POKEMONS](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Numero] [int] NULL,
	[Nombre] [varchar](50) NULL,
	[Descripcion] [varchar](50) NULL,
	[UrlImagen] [varchar](300) NULL,
	[IdTipo] [int] NULL,
	[IdDebilidad] [int] NULL,
	[IdEvolucion] [int] NULL,
	[Activo] [bit] NULL,
 CONSTRAINT [PK_POKEMONS] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[POKEMONS]  WITH CHECK ADD  CONSTRAINT [FK_POKEMONS_ELEMENTOS] FOREIGN KEY([IdTipo])
REFERENCES [dbo].[ELEMENTOS] ([Id])
GO

ALTER TABLE [dbo].[POKEMONS] CHECK CONSTRAINT [FK_POKEMONS_ELEMENTOS]
GO

ALTER TABLE [dbo].[POKEMONS]  WITH CHECK ADD  CONSTRAINT [FK_POKEMONS_ELEMENTOS1] FOREIGN KEY([IdDebilidad])
REFERENCES [dbo].[ELEMENTOS] ([Id])
GO

ALTER TABLE [dbo].[POKEMONS] CHECK CONSTRAINT [FK_POKEMONS_ELEMENTOS1]
GO

ALTER TABLE [dbo].[POKEMONS]  WITH CHECK ADD  CONSTRAINT [FK_POKEMONS_POKEMONS] FOREIGN KEY([IdEvolucion])
REFERENCES [dbo].[POKEMONS] ([Id])
GO

ALTER TABLE [dbo].[POKEMONS] CHECK CONSTRAINT [FK_POKEMONS_POKEMONS]
GO

insert into ELEMENTOS values ('Planta')
insert into ELEMENTOS values ('Fuego')
insert into ELEMENTOS values ('Agua')

insert into pokemons values (1, 'Bulbasaur', 'Este Pokémon nace con una semilla en el lomo.', 'https://assets.pokemon.com/assets/cms2/img/pokedex/full/001.png', 1, 2, null, 1)
insert into pokemons values (4, 'Charmander', 'Pokemon de fuego', 'https://assets.pokemon.com/assets/cms2/img/pokedex/full/004.png', 2, 3, null, 1)
insert into pokemons values (12, 'Butterfree', 'Adora el nectar de las flores', 'https://assets.pokemon.com/assets/cms2/img/pokedex/full/012.png', 1, 2, null, 1)
insert into pokemons values (16, 'Pidgey', 'Dócil y volador, se defiende levantando arena', 'https://assets.pokemon.com/assets/cms2/img/pokedex/full/016.png', 1, 3, null, 1)
insert into pokemons values (7, 'Squirtle', 'Tras nacer, se le hincha el lomo', 'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/007.png', 3, 1, null, 1)
insert into pokemons values (10, 'Caterpie', 'Para protegerse, despide un hedor horrible', 'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/010.png', 3, 2, null, 1)
insert into pokemons values (17, 'Pidgeotto', 'Vuela largas distancias en busca de presas', 'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/017.png', 1, 2, null, 1)
insert into pokemons values (9, 'Blastoise', 'Se agranda para contrarrestar sus chorros de agua', 'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/009.png', 3, 2, null, 1)
insert into pokemons values (19, 'Ratatta', 'Es propenso a morder cualquier cosa', 'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/019.png', 1, 3, null, 1)

