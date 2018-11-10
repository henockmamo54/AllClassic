<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ArticleDBAddNew.aspx.cs" Inherits="AllClassicWeb.Views.ArticleDBAddNew" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h4>New Data Input</h4>
    <hr />
    <div class="row">
        <div class="row col-xs-8">
            <div class="col-xs-4">
              <%= Resources.DisplayText.ArticleTitle %>
            </div>

            <div class="col-xs-8">
                <asp:TextBox ID="txt_title" runat="server" class="form-control"></asp:TextBox>
            </div>
            <br />
        </div>
        <div class="row col-xs-8">
            <br />
            <div class="col-xs-4">
               <%= Resources.DisplayText.ArticleURL %>
            </div>

            <div class="col-xs-8">
                <asp:TextBox ID="txt_url" runat="server" class="form-control"></asp:TextBox>
            </div>
        </div>
    </div>
    <div class="row col-xs-4" style="text-align:right;">
        <br />

        <asp:Button runat="server" ID="btn_addnewArticle" UseSubmitBehavior="false" OnClick="onclick_btn_addArticle" type="button" Text="<%$Resources:DisplayText,Add %>" class="btn btn-primary"></asp:Button>
        <asp:Button runat="server" type="button" class="btn btn-danger" data-dismiss="modal" Text="<%$Resources:DisplayText,Cancel %>"></asp:Button>
        <%--<asp:Button runat="server" ID="btn_addArticle2" OnClick="onclick_btn_addArticle" type="button" Text="Add" class="btn btn-primary" data-dismiss="modal"></asp:Button>--%>
    </div>
    
    <script type="text/javascript">
        document.getElementById("articletab").style.backgroundColor = "rgb(255, 255, 255) ";
        document.getElementById("articletab").style.borderRight = "none";
    </script>

</asp:Content>
