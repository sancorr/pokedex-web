<%@ Page Title="Log In | Pokemon App" Language="C#" MasterPageFile="~/PokeMaster.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="PokemonWeb.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <hr />
    <div class="row justify-content-center align-items-center vh-90 mx-0">
        <div class="col-12 col-md-10 col-lg-8">

            <div class="card shadow p-4"">
                <h3 class="text-center mb-4">Ingresar</h3>
                <div class="mb-3">
                    <asp:Label runat="server" CssClass="form-label">Email</asp:Label>
                    <asp:TextBox runat="server" CssClass="form-control" ID="tbxEntrenadorIngreso"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="tbxEntrenadorIngreso" ErrorMessage="Email es requerido" />
                </div>
                <div class="mb-3">
                    <asp:Label runat="server" CssClass="form-label">Password</asp:Label>
                    <asp:TextBox runat="server" CssClass="form-control" ID="tbxPasswordEntrenadorIngreso" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="tbxPasswordEntrenadorIngreso" ErrorMessage="Contraseña es requerido" />
                </div>
                <div class="d-flex justify-content-between">
                    <asp:Button runat="server" CssClass="btn btn-success" ID="btnIngresarEntrenador" Text="Ingresar" OnClick="btnIngresarEntrenador_Click" />
                    <asp:Button runat="server" CssClass="btn btn-danger" Text="Cancelar" ID="btnCancelarIngreso" OnClick="btnCancelarIngreso_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
