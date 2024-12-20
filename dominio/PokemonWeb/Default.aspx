<%@ Page Title="Home | Pokemon App" Language="C#" MasterPageFile="~/PokeMaster.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="PokemonWeb.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <hr />
    <h3>Lista pokemon</h3>
    <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-4">
        <asp:Repeater ID="RepeaterPokemons" runat="server">
            <ItemTemplate>
                    <div class="col">
                        <div class="card h-100">
                            <img src="<%# string.IsNullOrEmpty((string)Eval("UrlImagen")) || !Eval("UrlImagen").ToString().Contains("http") ? "https://imgs.search.brave.com/TvImnNqSmkLvWLy9Y1Hkith2FQJECMibPyhZ122wNb0/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9pbWcu/ZnJlZXBpay5jb20v/dmVjdG9yLWdyYXRp/cy9pbHVzdHJhY2lv/bi1jb25jZXB0by1j/YXJwZXRhLWltYWdl/bmVzXzExNDM2MC0x/MTQuanBnP3NlbXQ9/YWlzX2h5YnJpZA" : Eval("UrlImagen") %>" class="card-img-top img-fluid" alt="<%#Eval("Nombre") %>">
                            <div class="card-body d-flex flex-column">
                                <h5 class="card-title"><%#Eval("Nombre") %></h5>
                                <p class="card-text text-truncate" style="max-height: 4em;"><strong>Nro. </strong><%#Eval("Numero") %></p>
                                <asp:Button runat="server" ID="btnVerPokemon" CssClass="btn btn-primary mt-auto" Text="Ver Detalle" CommandArgument='<%#Eval("Id") %>' CommandName="IdPokemon" OnClick="btnVerPokemon_Click"/>
                            </div>
                        </div>
                    </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
