<%@ Page Title="" Language="C#" MasterPageFile="~/PokeMaster.Master" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="PokemonWeb.Error" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>hubo un error</h1>
    <asp:Label runat="server" ID="lblError"></asp:Label>
</asp:Content>
