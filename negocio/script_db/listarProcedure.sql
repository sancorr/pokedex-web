USE [POKEDEX_DB]
GO
/****** Object:  StoredProcedure [dbo].[listarProcedure]    Script Date: 12/19/2024 11:28:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[listarProcedure] as 
Select Numero, Nombre, P.Descripcion, UrlImagen, E.Descripcion Tipo, D.Descripcion Debilidad, P.IdTipo, P.IdDebilidad, P.Id, P.Activo 
From POKEMONS P, ELEMENTOS E, ELEMENTOS D
Where E.Id = P.IdTipo And D.Id = P.IdDebilidad
GO
