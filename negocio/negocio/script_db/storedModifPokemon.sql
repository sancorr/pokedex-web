USE [POKEDEX_DB]
GO
/****** Object:  StoredProcedure [dbo].[storedModifPokemon]    Script Date: 12/19/2024 11:30:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[storedModifPokemon] 
@numero int,
@nombre varchar(50),
@desc varchar(50),
@img varchar(300),
@idTipo int,
@idDebilidad int,
@id int
as
update POKEMONS set Numero = @numero, Nombre = @nombre, Descripcion = @desc, UrlImagen = @img, IdTipo = @idTipo, IdDebilidad = @idDebilidad 
Where Id = @id
GO
