<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PerformanceGroup.aspx.cs" Inherits="AllClassicWeb.Views.PerformanceGroup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    Performance group info will be added 

    <div class="row">
        <asp:Button runat="server" ID="btn_addNewPerformanceGroup" CssClass="btn btn-success pull-right" Text="<%$Resources:DisplayText,AddNewData %>" OnClick="onclick_btn_addNewPerformanceGroup" />
    </div>
        <script type="text/javascript">
        document.getElementById("performancegrouptab").style.backgroundColor = "rgb(255, 255, 255) ";
        document.getElementById("performancegrouptab").style.borderRight = "none";
    </script>
</asp:Content>
