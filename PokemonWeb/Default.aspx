﻿<%@ Page Title="" Language="C#" MasterPageFile="~/PokeMaster.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="PokemonWeb.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>DEFAULT</h1>
    <div class="row row-cols-1 row-cols-md-3 g-4">
        <asp:Repeater ID="RepeaterPokemons" runat="server">
            <ItemTemplate>
                    <div class="col">
                        <div class="card">
                            <img src="<%#Eval("UrlImagen") %>" class="card-img-top" alt="...">
                            <div class="card-body">
                                <h5 class="card-title"><%#Eval("Nombre") %></h5>
                                <p class="card-text"><%#Eval("Descripcion") %></p>
                                <asp:Button runat="server" ID="btnVerPokemon" Text="Ver Detalle" CommandArgument='<%#Eval("Id") %>' CommandName="IdPokemon" OnClick="btnVerPokemon_Click"/>
                            </div>
                        </div>
                    </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
