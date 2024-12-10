<%@ Page Title="" Language="C#" MasterPageFile="~/PokeMaster.Master" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="PokemonWeb.Registro" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-5">
            <h3>Creá tu perfil entrenador</h3>
            <div class="mb-3">
                <asp:Label runat="server" CssClass="form-label">Email</asp:Label>
                <asp:TextBox runat="server" CssClass="form-control" ID="tbxEmailEntrenador"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="tbxEmailEntrenador" ErrorMessage="Email es un campo requerido"/>
            </div>
            <div class="mb-3">
                <asp:Label runat="server" CssClass="form-label">Password</asp:Label>
                <asp:TextBox runat="server" CssClass="form-control" ID="tbxPasswordEntrenador" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="tbxPasswordEntrenador" ErrorMessage="Contraseña es requerido"/>
            </div>
            <asp:Button runat="server" CssClass="btn btn-success" OnClick="btnRegistrarEntrenador_Click" ID="btnRegistrarEntrenador" Text="Registrarse"/>
            <asp:Button runat="server" CssClass="btn btn-danger" Text="Cancelar" href="Default.aspx"/>
        </div>
    </div>
</asp:Content>
