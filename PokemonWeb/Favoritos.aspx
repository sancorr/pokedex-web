<%@ Page Title="Favoritos | Pokemon App" Language="C#" MasterPageFile="~/PokeMaster.Master" AutoEventWireup="true" CodeBehind="Favoritos.aspx.cs" Inherits="PokemonWeb.Favoritos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManagerFav" runat="server"></asp:ScriptManager>

    <hr />
    <h5>Tus pokemon favoritos</h5>
    <asp:UpdatePanel runat="server" ID="UpdatePanelFav">
        <ContentTemplate>

            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-4">
                <asp:Repeater ID="RepeaterFavoritos" runat="server">
                    <ItemTemplate>
                        <div class="col">
                            <div class="card mb-3 h-100">
                                <img src="<%# string.IsNullOrEmpty((string)Eval("UrlImagen")) || !Eval("UrlImagen").ToString().Contains("http") ? "https://imgs.search.brave.com/TvImnNqSmkLvWLy9Y1Hkith2FQJECMibPyhZ122wNb0/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9pbWcu/ZnJlZXBpay5jb20v/dmVjdG9yLWdyYXRp/cy9pbHVzdHJhY2lv/bi1jb25jZXB0by1j/YXJwZXRhLWltYWdl/bmVzXzExNDM2MC0x/MTQuanBnP3NlbXQ9/YWlzX2h5YnJpZA" : Eval("UrlImagen") %>" class="card-img-top img-fluid" alt="<%#Eval("Nombre") %>">
                                <div class="card-body d-flex flex-column">
                                    <h5 class="card-title">Nombre: <%#Eval("Nombre") %></h5>
                                    <h6 class="card-text">Numero: <%#Eval("Numero") %></h6>
                                    <p class="card-text text-truncate" style="max-height: 4em;">Descripcion: <%#Eval("Descripcion") %></p>
                                    <p class="card-text">Tipo: <%#Eval("Tipo") %></p>
                                    <p class="card-text">Debilidad: <%#Eval("Debilidad") %></p>
                                    <asp:Button runat="server" ID="btnEliminarFavoritos" CssClass="btn btn-danger mt-auto" Text="Remover" OnClick="btnEliminarFavoritos_Click" CommandArgument='<%#Eval("Id")%>' CommandName="IdPokeRemoverFav" />
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:Label runat="server" ID="lblMsjFav" CssClass="alert alert-info" Text="" Visible="false" />
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>
    <hr />
</asp:Content>
