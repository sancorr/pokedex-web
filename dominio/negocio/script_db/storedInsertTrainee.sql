USE [POKEDEX_DB]
GO
/****** Object:  StoredProcedure [dbo].[storedInsertTrainee]    Script Date: 12/19/2024 11:30:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[storedInsertTrainee]
@mail varchar(50),
@pass varchar(50)
as
insert into USERS (email, pass, admin) output inserted.id values (@mail, @pass, 0)
GO
