USE [POKEDEX_DB]
GO
/****** Object:  StoredProcedure [dbo].[storedAddPokemon]    Script Date: 12/19/2024 11:29:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[storedAddPokemon]
@numero int,
@nombre varchar(50),
@desc varchar(50),
@urlImagen varchar(300),
@idTipo int,
@idDebilidad int
as
insert into POKEMONS values (@numero,@nombre,@desc,@urlImagen,@idTipo,@idDebilidad,null,1)
GO
