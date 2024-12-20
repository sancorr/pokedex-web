﻿<%@ Page Title="Error | Pokemon App" Language="C#" MasterPageFile="~/PokeMaster.Master" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="PokemonWeb.Error" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container text-center py-5">
        <h4>¡OOPS! Algo salio mal...</h4>
        <img src="https://www.imagui.com/i/pikachu-triste-youtube-33308147.webp" alt="Error" class="img-fluid" style="max-width: 300px;">
        <p class="lead">Lo sentimos, algo no salió como esperábamos.</p>

        <!-- Mensaje dinámico basado en el error -->
        <p id="errorMessage" class="text-muted">
            <% if (Session["error"] != null)
                { %>
            <asp:Label runat="server" ID="lblError"></asp:Label>
            <% }
            else
            { %>
            <%= "Estamos trabajando para resolver el problema." %>
            <% } %>
        </p>

        <!-- Opciones de acción -->
        <div class="mt-4">
            <a href="Default.aspx" class="btn btn-primary">Volver al Inicio</a>
            <a href="javascript:history.back()" class="btn btn-secondary">Intentar Nuevamente</a>
            <p>O enviame un email y me contacto con vos a la brevedad...</p>
            <a href="mailto:correasanti1997@gmail.com" class="btn btn-link">Contame tu problema</a>
        </div>
    </div>

</asp:Content>
