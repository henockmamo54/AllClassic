<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ArticleDBAddNew.aspx.cs" Inherits="AllClassicWeb.Views.ArticleDBAddNew" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h4 class="contentHeader">New Data Input</h4>
    <hr />
    <div class="row">
        <div class="row col-xs-8">
            <div class="col-xs-4 filedName">
              <%= Resources.DisplayText.ArticleTitle %>*
            </div>

            <div class="col-xs-8">
                <asp:TextBox ID="txt_title"   ValidationGroup="a"  runat="server" class="form-control filedDisplay" MaxLength="400"></asp:TextBox>
                <asp:RequiredFieldValidator Display="Dynamic" runat="server" ForeColor="IndianRed" ValidationGroup="a" Font-Bold="true" ID="RequiredFieldValidator1" ControlToValidate="txt_title" ErrorMessage="<%$Resources:DisplayText,Pleasefillthearticletitle %>" />
                    
            </div>
            <br />
        </div>
        <div class="row col-xs-8">
            <br />
            <div class="col-xs-4 filedName">
               <%= Resources.DisplayText.ArticleURL %>*
            </div>

            <div class="col-xs-8">
                <asp:TextBox ID="txt_url"  ValidationGroup="a" runat="server" class="form-control filedDisplay" MaxLength="80"></asp:TextBox>
                <asp:RequiredFieldValidator Display="Dynamic" runat="server" ForeColor="IndianRed" ValidationGroup="a" Font-Bold="true" ID="RequiredFieldValidator2" ControlToValidate="txt_url" ErrorMessage="<%$Resources:DisplayText,PleasefillthearticleURL %>" />
                    
            </div>
        </div>
    </div>
    <div class="row col-xs-4" style="text-align:right;">
        <br />

        <asp:Button runat="server"  ValidationGroup="a" ID="btn_updatearticle" Visible="false" UseSubmitBehavior="false" OnClick="onclick_btn_updatearticle" type="button" Text="<%$Resources:DisplayText,Update %>" class="btn btn-warning contentButton"></asp:Button>
        <asp:Button runat="server"  ValidationGroup="a" ID="btn_addnewArticle" UseSubmitBehavior="false" OnClick="onclick_btn_addArticle" type="button" Text="<%$Resources:DisplayText,Add %>" class="btn btn-primary contentButton"></asp:Button>
        <asp:Button runat="server" type="button" class="btn btn-danger contentButton" data-dismiss="modal" Text="<%$Resources:DisplayText,Cancel %>" OnClick="onClick_btn_cancel"></asp:Button>
        <%--<asp:Button runat="server" ID="btn_addArticle2" OnClick="onclick_btn_addArticle" type="button" Text="Add" class="btn btn-primary" data-dismiss="modal"></asp:Button>--%>
    </div>
    
    <script type="text/javascript">
    //    document.getElementById("articletab").style.backgroundColor = "rgb(255, 255, 255) ";
   //     document.getElementById("articletab").style.borderRight = "none";

        
        function ShowMessage() {
            alert('Data inserted succssfuly');
            window.location.href = 'ArticleDB.aspx';
        }

    </script>

</asp:Content>
