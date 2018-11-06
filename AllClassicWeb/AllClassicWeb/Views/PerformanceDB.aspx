<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PerformanceDB.aspx.cs" Inherits="AllClassicWeb.Views.PerformanceDB" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            the content will be added soon
            
            <div class="row">
                <hr />
                <asp:Button runat="server" ID="btn_addNewMusician" CssClass="btn btn-success pull-right" Text="<%$Resources:DisplayText,AddNewData %>" OnClick="onclick_btn_addPG" />
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
