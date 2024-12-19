﻿<%@ Page Title="Mi perfil | Pokemon App" Language="C#" MasterPageFile="~/PokeMaster.Master" AutoEventWireup="true" CodeBehind="MiPerfil.aspx.cs" Inherits="PokemonWeb.MiPerfil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <hr />
    <h3>Mi perfil</h3>
    <div class="row">
        <div class="col-md-5">
            <div class="mb-3">
                <asp:Label runat="server" ID="lblEmail" for="tbxEmail" Text="Email:" CssClass="form-label"></asp:Label>
                <asp:TextBox runat="server" ID="tbxEmail" CssClass="form-control" placeholder="name@example.com"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="tbxEmail" ErrorMessage="Email es requerido"/>
            </div>

            <div class="mb-3">
                <asp:Label runat="server" ID="lblNombre" for="tbxNombre" Text="Nombre:" CssClass="form-label"></asp:Label>
                <asp:TextBox runat="server" ID="tbxNombre" CssClass="form-control" placeholder="Jonh"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="tbxNombre" ErrorMessage="Nombre es requerido"/>
            </div>

            <div class="mb-3">
                <asp:Label runat="server" ID="lblApellido" for="tbxApellido" Text="Apellido:" CssClass="form-label"></asp:Label>
                <asp:TextBox runat="server" ID="tbxApellido" CssClass="form-control" placeholder="Doe"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="tbxApellido" ErrorMessage="Apellido es requerido"/>
            </div>

            <div class="mb-3">
                <asp:Label runat="server" ID="lblFechaNacimiento" for="tbxFecha" Text="Fecha de nacimiento:" CssClass="form-label"></asp:Label>
                <asp:TextBox runat="server" ID="tbxFecha" CssClass="form-control" TextMode="Date"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="tbxFecha" ErrorMessage="Fecha es requerido"/>
            </div>
        </div>

        <div class="col-md-5">
            <div class="mb-3">
                <asp:Label runat="server" ID="lblImagenPerfil" for="tbxImagenPerfil" Text="Imagen de perfil" CssClass="form-label" />
                <input runat="server" type="file" ID="tbxImagenPerfil" class="form-control"/>
            </div>
            <asp:Image runat="server" ID="imagenPerfil" ImageUrl="https://imgs.search.brave.com/UoEGoEVhpqRO83GQUva4-8Xw_r1PhAGKGtCKmb9aaDA/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly90NC5m/dGNkbi5uZXQvanBn/LzA4Lzc1LzQ1Lzk3/LzM2MF9GXzg3NTQ1/OTcxOV84aTdKM2F0/R2JzRG9SUFQwWlcw/RGpCcGdBRlZUcktB/ZS5qcGc" CssClass="img-fluid mb-3" />
        </div>
    </div>

    <div class="row">
        <div class="col-md-4">
            <asp:Button runat="server" Text="Guardar cambios" CssClass="btn btn-primary" ID="btnGuardar" OnClick="btnGuardar_Click" />
            <a href="Default.aspx">Regresar</a>
        </div>
    </div>

</asp:Content>
