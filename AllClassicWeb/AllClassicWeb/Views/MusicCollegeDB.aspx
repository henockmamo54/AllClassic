<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MusicCollegeDB.aspx.cs" Inherits="AllClassicWeb.Views.MusicCollegeDB" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    the info  will be added soon
    
            <div class="row">
                <asp:Button runat="server" ID="btn_addMusicCollege" CssClass="btn btn-success pull-right" Text="<%$Resources:DisplayText,AddNewData %>" OnClick="onclick_btn_addMusicCollege" />
            </div>

</asp:Content>
