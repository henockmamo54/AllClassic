<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="QADbAddNew.aspx.cs" Inherits="AllClassicWeb.Views.QADbAddNew" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <br />
            <h4 class="contentHeader">New Question Input Screen</h4>
            <hr />
            <div>
                <span class="filedName"><%= Resources.DisplayText.Question  %>
                </span>
                <asp:TextBox runat="server" ID="txt_question" Style="max-width: 500px; width: 500px; display: inline-block;" CssClass="form-control filedDisplay"   MaxLength="200" ></asp:TextBox>
                <asp:Button runat="server" ID="btn_addNew" ValidationGroup="a" CssClass="btn btn-success contentButton" Text="<%$Resources:DisplayText,Add %>" OnClick="onclick_btn_addNew" />
                <br />
                <asp:RequiredFieldValidator CssClass="filedDisplay" Display="Dynamic" runat="server" ForeColor="IndianRed" ValidationGroup="a" Font-Bold="true" ID="RequiredFieldValidator2" ControlToValidate="txt_question"
                    ErrorMessage="<%$Resources:DisplayText,PleaseFilltheQuestionFiled %>" />

            </div>
            <script type="text/javascript">

        function ShowMessage() {
            alert('Data inserted succssfuly');
            window.location.href = 'QADbNew.aspx';
        }

            </script>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
