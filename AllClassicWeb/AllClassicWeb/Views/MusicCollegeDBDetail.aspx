<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MusicCollegeDBDetail.aspx.cs" Inherits="AllClassicWeb.Views.MusicCollegeDBDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <br />
            <div class="row">
                <div class="col-md-6 col-xs-6 pull-left">
                    <asp:Image runat="server" ID="profileImage" Width="100%" CssClass="shadowedPanel" />
                </div>

                <div class="col-md-6 col-xs-6 pull-center">

                    <%--<h3 runat="server" id="collagenamecontainer" style="font-weight: 800;"></h3>--%>

                    <br />
                    <div>
                        <div class=" row col-md-12 col-xs-12">
                            <div class="col-xs-4"><%=Resources.DisplayText.Name %>: </div>
                            <div class="col-xs-8">
                                <asp:Label runat="server" ID="txt_name"></asp:Label>
                            </div>
                        </div>
                        <div class=" row col-md-12 col-xs-12">
                            <div class="col-xs-4"><%=Resources.DisplayText.ShortName %>: </div>
                            <div class="col-xs-8">
                                <asp:Label runat="server" ID="txt_shortname"></asp:Label>
                            </div>
                        </div>
                        <div class=" row col-md-12 col-xs-12">
                            <hr style="background-color: #5f755f; height: 0.2rem;" />
                        </div>
                        <div class=" row col-md-12 col-xs-12">
                            <div class="col-xs-4"><%=Resources.DisplayText.HomePage %>: </div>
                            <div class="col-xs-8">
                                <asp:LinkButton target="_blank" OnCommand="LinkButton_Click" CommandArgument="google.com" runat="server" ID="txt_homepage"></asp:LinkButton>
                            </div>
                        </div>
                        <div class=" row col-md-12 col-xs-12">
                            <div class="col-xs-4"><%=Resources.DisplayText.Country %>: </div>
                            <div class="col-xs-8">
                                <asp:Label runat="server" ID="txt_country"></asp:Label>
                            </div>
                        </div>
                        <div class=" row col-md-12 col-xs-12">
                            <div class="col-xs-4"><%=Resources.DisplayText.Introduction %>: </div>
                            <div class="col-xs-8">
                                <asp:Label runat="server" ID="txt_introduction"></asp:Label>
                            </div>
                        </div>
                        <div class=" row col-md-12 col-xs-12">
                            <div class="col-xs-4"><%=Resources.DisplayText.LocationMap %>: </div>
                            <div class="col-xs-8">
                                <asp:LinkButton target="_blank" OnCommand="LinkButton_Click" CommandArgument="google.com" runat="server" ID="txt_locationmap"></asp:LinkButton>
                            </div>
                        </div>
                        <div class=" row col-md-12 col-xs-12">
                            <hr style="background-color: #5f755f; height: 0.2rem;" />
                        </div>
                        <%--==================================================================--%>
                    </div>
                    <div class="col-xs-12">
                        <asp:Button CssClass="btn btn-primary" runat="server" ID="btn_editcollege" OnClick="onclick_btn_editcollege" Text="<%$Resources:DisplayText,Edit %>" />
                    </div>
                </div>



            </div>
        </ContentTemplate>

    </asp:UpdatePanel>


    <script type="text/javascript">
        document.getElementById("MusicCollegetab").style.backgroundColor = "white";
        document.getElementById("MusicCollegetab").style.borderBottom = "none";

        function openInNewTab(url) { 
            var win = window.open(url, '_blank');
            win.focus();
        }

    </script>

</asp:Content>
