<%@ Page Title="Registro | Pokemon App" Language="C#" MasterPageFile="~/PokeMaster.Master" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="PokemonWeb.Registro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <hr />
    <div class="row justify-content-center align-items-center vh-90 mx-0">
        <div class="col-12 col-md-10 col-lg-8">
            <div class="card shadow p-4">
                <h3 class="text-center mb-4">Creá tu perfil entrenador</h3>
                <div class="mb-3">
                    <asp:Label runat="server" CssClass="form-label">Email</asp:Label>
                    <asp:TextBox runat="server" CssClass="form-control" ID="tbxEmailEntrenador"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="tbxEmailEntrenador" ErrorMessage="Email es un campo requerido" Display="Dynamic" />
                    <asp:RegularExpressionValidator ID="validatorEmail" runat="server" ControlToValidate="tbxEmailEntrenador" ErrorMessage="El formato de email no es correcto" ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$" Display="Dynamic" />
                </div>
                <div class="mb-3">
                    <asp:Label runat="server" CssClass="form-label">Password</asp:Label>
                    <asp:TextBox runat="server" CssClass="form-control" ID="tbxPasswordEntrenador" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="tbxPasswordEntrenador" ErrorMessage="Contraseña es requerido" />
                </div>
                <div class="d-flex justify-content-between">
                    <asp:Button runat="server" CssClass="btn btn-success" OnClick="btnRegistrarEntrenador_Click" ID="btnRegistrarEntrenador" Text="Registrarse" />
                    <asp:Button runat="server" CssClass="btn btn-danger" Text="Cancelar" href="Default.aspx" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
