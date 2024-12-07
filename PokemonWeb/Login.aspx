<%@ Page Title="" Language="C#" MasterPageFile="~/PokeMaster.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="PokemonWeb.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <hr />
    <div class="row">
        <div class="col-5">
            <h3>Ingresa a tú perfil</h3>
            <div class="mb-3">
                <asp:Label runat="server" CssClass="form-label">Email</asp:Label>
                <asp:TextBox runat="server" CssClass="form-control" ID="tbxEntrenadorIngreso"></asp:TextBox>
            </div>
            <div class="mb-3">
                <asp:Label runat="server" CssClass="form-label">Password</asp:Label>
                <asp:TextBox runat="server" CssClass="form-control" ID="tbxPasswordEntrenadorIngreso" TextMode="Password"></asp:TextBox>
            </div>
            <asp:Button runat="server" CssClass="btn btn-success" ID="btnIngresarEntrenador" Text="Ingresar" OnClick="btnIngresarEntrenador_Click"/>
            <asp:Button runat="server" CssClass="btn btn-danger" Text="Cancelar" ID="btnCancelarIngreso" OnClick="btnCancelarIngreso_Click"/>
        </div>
    </div>
</asp:Content>
