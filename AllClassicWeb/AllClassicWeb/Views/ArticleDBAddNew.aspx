<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ArticleDBAddNew.aspx.cs" Inherits="AllClassicWeb.Views.ArticleDBAddNew" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h4>New Data Input</h4>
    <hr />
    <div class="row">
        <div class="row col-xs-8">
            <div class="col-xs-4">
                Article Title
            </div>

            <div class="col-xs-8">
                <asp:TextBox ID="txt_title" runat="server" class="form-control"></asp:TextBox>
            </div>
            <br />
        </div>
        <div class="row col-xs-8">
            <br />
            <div class="col-xs-4">
                Article URL
            </div>

            <div class="col-xs-8">
                <asp:TextBox ID="txt_url" runat="server" class="form-control"></asp:TextBox>
            </div>
        </div>
    </div>
    <div class="row col-xs-4" style="text-align:right;">
        <br />

        <asp:Button runat="server" ID="btn_addnewArticle" UseSubmitBehavior="false" OnClick="onclick_btn_addArticle" type="button" Text="Add" class="btn btn-primary"></asp:Button>
        <asp:Button runat="server" type="button" class="btn btn-danger" data-dismiss="modal" Text="Cancel"></asp:Button>
        <%--<asp:Button runat="server" ID="btn_addArticle2" OnClick="onclick_btn_addArticle" type="button" Text="Add" class="btn btn-primary" data-dismiss="modal"></asp:Button>--%>
    </div>
</asp:Content>
