<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SearchEngineResult.aspx.cs" Inherits="AllClassicWeb.Views.SearchEngineResult" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <%-- ======================================================================================================================== --%>
    <%--<script>
        (function () {
            var cx = '002525031877711025702:pcmanopushk';
            var gcse = document.createElement('script');
            gcse.type = 'text/javascript';
            gcse.async = true;
            gcse.src = 'https://cse.google.com/cse.js?cx=' + cx;
            var s = document.getElementsByTagName('script')[0];
            s.parentNode.insertBefore(gcse, s);
        })();
    </script>
    <gcse:searchresults-only></gcse:searchresults-only>--%>

    <%-- ======================================================================================================================== --%>

    <div runat="server" id="serachResultContainer"></div>
    <div hidden runat="server" id="fullserachresult"></div>


</asp:Content>
