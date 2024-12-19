<%@ Page Title="Form pokemon | Pokemon App" Language="C#" MasterPageFile="~/PokeMaster.Master" AutoEventWireup="true" CodeBehind="FormPokemon.aspx.cs" Inherits="PokemonWeb.FormPokemon" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <hr />


    <div class="row">
        <div class="col-sm-12 col-md-6">
            <div class="mb-3">
                <asp:Label runat="server" for="tbxNumero" ID="lblNumero" CssClass="form-label" Text="Número"></asp:Label>
                <asp:TextBox runat="server" CssClass="form-control" ID="tbxNumero"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="tbxNumero" ErrorMessage="Número es requerido" Display="Dynamic" />
                <asp:RegularExpressionValidator runat="server" ControlToValidate="tbxNumero" ErrorMessage="Solo se adminten numeros enteros" ValidationExpression="^\d+$" Display="Dynamic" />
            </div>

            <div class="mb-3">
                <asp:Label runat="server" for="tbxNombre" ID="lblNombre" CssClass="form-label" Text="Nombre:"></asp:Label>
                <asp:TextBox runat="server" CssClass="form-control" ID="tbxNombre"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="tbxNombre" ErrorMessage="Nombre es requerido" />
            </div>

            <div class="mb-3">
                <asp:Label runat="server" for="tbxDescripcion" ID="lblDescripcion" CssClass="form-label" Text="Descripción"></asp:Label>
                <asp:TextBox runat="server" CssClass="form-control" ID="tbxDescripcion" MaxLength="50" TextMode="MultiLine"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="tbxDescripcion" Display="Dynamic" ErrorMessage="Campo requerido-Máximo 50 caracteres" />
            </div>

            <div>

                <div>
                    <asp:UpdatePanel runat="server" ID="UpdatePanel3">
                        <ContentTemplate>
                            <div class="mb-3">
                                <asp:Label runat="server" for="DropDownTipo" Text="Tipo:" CssClass="form-label" ID="lblTipo"></asp:Label>
                                <asp:DropDownList CssClass="btn btn-secondary dropdown-toggle" runat="server" ID="DropDownTipo"></asp:DropDownList>
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="DropDownTipo" ErrorMessage="Tipo es requerido" />
                            </div>

                            <div class="mb-3">
                                <asp:Label runat="server" for="DropDownDebilidad" Text="Debilidad:" CssClass="form-label" ID="lblDebilidad"></asp:Label>
                                <asp:DropDownList runat="server" CssClass="btn btn-secondary dropdown-toggle" ID="DropDownDebilidad"></asp:DropDownList>
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="DropDownDebilidad" ErrorMessage="Debilidad es requerido" />
                            </div>

                            <div class="mb-3">
                                <asp:Button runat="server" ID="btnAgregarElemento" Text="Agregar elemento" CssClass="btn btn-secondary" OnClick="btnAgregarElemento_Click" />
                                <asp:Label runat="server" ID="lblAgregarElemento" Text="" Visible="false"></asp:Label>
                            </div>

                            <%if (AgregarElemento)
                                { %>
                            <div class="mb-3">
                                <asp:Label runat="server" ID="lblElemento" CssClass="form-label" Text="Elemento:"></asp:Label>
                                <asp:TextBox runat="server" ID="tbxAgregarElemento" CssClass="form-control"></asp:TextBox>
                                <asp:RegularExpressionValidator runat="server" ControlToValidate="tbxAgregarElemento" ErrorMessage="Campo requerido. Sólo letras" ValidationExpression="^[A-Za-z ]+$"></asp:RegularExpressionValidator>

                            </div>
                            <asp:Button runat="server" ID="btnConfimarElemento" Text="Confirmar" CssClass="btn btn-success mb-3" OnClick="btnConfimarElemento_Click" />
                            <%} %>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>


            <div class="mb-3">
                <asp:Button runat="server" ID="btnAceptar" Text="Aceptar" CssClass="btn btn-secondary" OnClick="btnAceptar_Click" />
                <a href="ListaPokemon.aspx">Cancelar</a>
            </div>
        </div>

        <div class="col-sm-12 col-md-6">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div class="mb-3">
                        <asp:Label runat="server" for="tbxImagen" ID="lblImagen" CssClass="form-label" Text="URL imagen:"></asp:Label>
                        <asp:TextBox runat="server" CssClass="form-control" ID="tbxImagen" AutoPostBack="true" OnTextChanged="tbxImagen_TextChanged"></asp:TextBox>
                    </div>

                    <asp:Image ImageUrl="https://imgs.search.brave.com/TvImnNqSmkLvWLy9Y1Hkith2FQJECMibPyhZ122wNb0/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9pbWcu/ZnJlZXBpay5jb20v/dmVjdG9yLWdyYXRp/cy9pbHVzdHJhY2lv/bi1jb25jZXB0by1j/YXJwZXRhLWltYWdl/bmVzXzExNDM2MC0x/MTQuanBnP3NlbXQ9/YWlzX2h5YnJpZA" runat="server" ID="imgPokemon" Width="100%" />
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>

    <div class="row">
        <div class="col-12">
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <div class="mb-3">
                        <asp:Button runat="server" ID="btnEliminar" Text="Eliminar" CssClass="btn btn-danger" OnClick="btnEliminar_Click" />
                        <asp:Button runat="server" ID="btnDesabilitar" Text="Desabilitar" CssClass="btn btn-secondary" OnClick="btnDesabilitar_Click" />
                    </div>
                    <%if (Eliminar)
                        { %>
                    <div class="mb-3">
                        <asp:Label runat="server" Text="Eliminar" ID="lblEliminarConfirmar"></asp:Label>
                        <asp:CheckBox ID="chkEliminarConfirmar" runat="server" />
                    </div>
                    <asp:Button runat="server" ID="btnEliminarConfirmar" Text="Confirmar" CssClass="btn btn-secondary" OnClick="btnEliminarConfirmar_Click" />
                    <%} %>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>


</asp:Content>
