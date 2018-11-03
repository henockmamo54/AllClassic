<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MusicianDB.aspx.cs" Inherits="AllClassicWeb.Views.MusicianDB" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    Musician DB
    <div class="row">
        <asp:Button runat="server" ID="btn_addNewMusician" CssClass="btn btn-success pull-right" Text="<%$Resources:DisplayText,AddNewData %>" OnClick="onclick_btn_addNewMusician" />
    </div>
</asp:Content>
