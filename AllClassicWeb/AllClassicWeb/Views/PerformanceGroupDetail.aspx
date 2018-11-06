<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PerformanceGroupDetail.aspx.cs" Inherits="AllClassicWeb.Views.PerformanceGroupDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <div class="row" id="performancegroupinfocontainer">

                <h4 style="color: #00796B; font-weight: 800;">
                    <asp:Label runat="server" ID="txt_name" Text="name container" />
                    [<asp:Label runat="server" ID="txt_alias" Text="alias container" />]</h4>
                <hr />
                <div style="margin-left: 10px;">

                    <div>
                        <%= Resources.DisplayText.GroupType %>:
                        <asp:Label runat="server" Font-Bold="true" ID="txt_grouptype" Text="GroupType container" />
                    </div>
                    <br />
                    <div>
                        <%= Resources.DisplayText.SinceYear %>:
                        <asp:Label runat="server" Font-Bold="true" ID="txt_sinceyear" Text="SinceYear container" />
                    </div>
                    <br />
                    <div>
                        <%= Resources.DisplayText.City %>:
                        <asp:Label Font-Bold="true" runat="server" ID="txt_city" Text="city container" />
                    </div>
                    <br />
                    <div>
                        <%= Resources.DisplayText.Email %>:
                        <asp:Label runat="server" Font-Bold="true" ID="txt_email" Text="email container" />
                    </div>
                    <br />
                    <div>
                        <%= Resources.DisplayText.Conductor %>:
                        <asp:Label runat="server" Font-Bold="true" ID="txt_conductor" Text="Conductor container" />
                    </div>
                    <br />
                    <div>
                        <%= Resources.DisplayText.Address %>:
                        <asp:Label runat="server" Font-Bold="true" ID="txt_address" Text="Address container" />
                    </div>
                    <br />
                    <div>
                        <%= Resources.DisplayText.ZipCode %>:
                        <asp:Label runat="server" Font-Bold="true" ID="txt_zipcode" Text="ZipCode container" />
                    </div>
                    <br />
                    <div>
                        <%= Resources.DisplayText.TelNo %>:
                        <asp:Label runat="server" Font-Bold="true" ID="txt_telno" Text="TelNo container" />
                    </div>
                    <br />
                    <div>
                        <%= Resources.DisplayText.FaxNo %>:
                        <asp:Label runat="server" Font-Bold="true" ID="txt_fax" Text="FaxNo container" />
                    </div>
                    <br />
                    <div>
                        <a href='<%#Eval("homepageurl") %>' target="_blank">
                            <asp:Label runat="server" Font-Bold="true" ID="txt_homepageurl" Text="Read More" /></a>
                    </div>

                </div>

                <div class="col-xs-6">
                    <asp:Button CssClass="btn btn-primary pull-right" runat="server" ID="btn_editpg" OnClick="onclick_btn_editpg" Text="<%$Resources:DisplayText,Edit %>" />
                </div>
                <div class="col-xs-12">
                    <hr />
                </div>
        </ContentTemplate>
    </asp:UpdatePanel>

    <script type="text/javascript">
        document.getElementById("performancegrouptab").style.backgroundColor = "rgb(255, 255, 255) ";
        document.getElementById("performancegrouptab").style.borderRight = "none";
    </script>

</asp:Content>
