<%@ Page Title="" Language="C#" MasterPageFile="~/PokeMaster.Master" AutoEventWireup="true" CodeBehind="ListaPokemon.aspx.cs" Inherits="PokemonWeb.ListaPokemon" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
   <asp:ScriptManager runat="server" ID="scrManagerGrid"></asp:ScriptManager>
    <asp:UpdatePanel runat="server">
        <ContentTemplate>

            <div class="col-6" style="display: flex; flex-direction: column; justify-content: flex-end;">
                <div class="mb-3">
                    <asp:CheckBox Text="Activar filtro" AutoPostBack="true"
                        ID="chkFiltro" runat="server" />
                </div>
            </div>
            <%if (chkFiltro.Checked)
                { %>
            <div class="row">
                <div class="col-3">
                    <div class="mb-3">
                        <asp:Label ID="lblCampo" runat="server" Text="Campo"></asp:Label>
                        <asp:DropDownList ID="ddlCampo" CssClass="form-control" OnSelectedIndexChanged="ddlCampo_SelectedIndexChanged" AutoPostBack="true" runat="server">
                            <asp:ListItem Text="Nombre"></asp:ListItem>
                            <asp:ListItem Text="Tipo"></asp:ListItem>
                            <asp:ListItem Text="Número"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>

                <div class="col-3">
                    <div class="mb-3">
                        <asp:Label ID="lblCriterio" runat="server" Text="Criterio"></asp:Label>
                        <asp:DropDownList ID="ddlCriterio" CssClass="form-control" runat="server"></asp:DropDownList>
                    </div>
                </div>

                <div class="col-3">
                    <div class="mb-3">
                        <asp:Label ID="lblFiltro" runat="server" Text="Filtro"></asp:Label>
                        <asp:TextBox ID="tbxFiltro" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>

                <div class="col-3">
                    <div class="mb-3">
                        <asp:Label ID="lblEstado" runat="server" Text="Estado"></asp:Label>
                        <asp:DropDownList ID="ddlEstado" CssClass="form-control" runat="server">
                            <asp:ListItem Text="Todos"></asp:ListItem>
                            <asp:ListItem Text="Habilitado"></asp:ListItem>
                            <asp:ListItem Text="Inabilitado"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>

                <div class="row">
                    <div class="col-3">
                        <div class="mb-3">
                            <asp:Button ID="btnBuscarFiltro" runat="server" Text="Buscar" CssClass="btn btn-secondary" OnClick="btnBuscarFiltro_Click" />
                        </div>
                    </div>
                </div>
            </div>
            <%} %>


            <asp:GridView ID="dgvListaPokemon" runat="server" DataKeyNames="Id" CssClass="table"
                OnSelectedIndexChanged="dgvListaPokemon_SelectedIndexChanged"
                AutoGenerateColumns="false" OnPageIndexChanging="dgvListaPokemon_PageIndexChanging"
                AllowPaging="true"
                PageSize="6">
                <Columns>
                    <asp:BoundField HeaderText="Número" DataField="Numero" />
                    <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                    <asp:BoundField HeaderText="Descripción" DataField="Descripcion" />
                    <asp:BoundField HeaderText="Tipo" DataField="Tipo" />
                    <asp:BoundField HeaderText="Debilidad" DataField="Debilidad" />
                    <asp:CheckBoxField HeaderText="Habilitado" DataField="Activo" />
                    <asp:CommandField HeaderText="Acción" ShowSelectButton="true" SelectText="Click" />
                </Columns>
            </asp:GridView>
            <asp:Button runat="server" ID="btnAgregar" Text="Agregar pokemon" CssClass="btn btn-primary" OnClick="btnAgregar_Click" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
