<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MusicianDetailPage.aspx.cs" Inherits="AllClassicWeb.Views.MusicianDetailPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <br />
            <div class="row">
                <div class="col-md-6 col-xs-6 pull-left">
                    <asp:Image runat="server" ID="profileImage" Width="100%" CssClass="shadowedPanel" />
                </div>

                <div class="col-md-6 col-xs-6 pull-center">

                    <h3 runat="server" id="artistnamecontainer" style="font-weight: 800;"></h3>

                    <div>
                        <%--<asp:Image runat="server" ID="profileImage" />--%>
                        <div class=" row col-md-12 col-xs-12">
                            <div class="col-md-3"><%=Resources.DisplayText.Major %>: </div>
                            <div class="col-md-8 col-xs-8" style="font-weight: 600;">
                                <asp:Label runat="server" ID="major"></asp:Label>
                            </div>
                        </div>
                        <div class=" row col-md-12 col-xs-12">
                            <hr style="background-color: #5f755f; height: 0.2rem;" />
                        </div>

                        <div class=" row col-md-12 col-xs-12" style="padding: 10px; background-color: #d3d3d35c; border-radius: 5px; margin-top: 8px; margin-bottom: 8px;">
                            <div class="col-xs-12"><%=Resources.DisplayText.Repertory %> </div>
                            <div class="col-xs-12">
                                <asp:Label runat="server" ID="repertory"></asp:Label>
                            </div>
                        </div>
                        <div class=" row col-xs-12" style="padding: 10px; background-color: #d3d3d35c; border-radius: 5px; margin-top: 8px; margin-bottom: 8px;">
                            <div class="col-md-12"><%=Resources.DisplayText.ProfilePage %> </div>
                            <div class="  col-xs-12">
                                <asp:Label runat="server" ID="profilePage"></asp:Label>
                            </div>
                        </div>
                        <div class=" row col-md-12 col-xs-12">
                            <hr style="background-color: #5f755f; height: 0.2rem;" />
                        </div>
                        <%--==================================================================--%>

                        <div class=" row col-md-12 col-xs-12">
                            <div class="col-md-3"><%=Resources.DisplayText.Affiliation %>: </div>
                            <div class="col-md-8 col-xs-8">
                                <asp:Label runat="server" ID="yourAffilation"></asp:Label>
                            </div>
                        </div>
                        <div class=" row col-md-12 col-xs-12">
                            <div class="col-md-3"><%=Resources.DisplayText.MobileNo %>: </div>
                            <div class="col-md-8 col-xs-8">
                                <asp:Label runat="server" ID="mobileNo"></asp:Label>
                            </div>
                        </div>
                        <div class=" row col-md-12 col-xs-12">
                            <div class="col-md-3"><%=Resources.DisplayText.Email %>: </div>
                            <div class="col-md-8 col-xs-8">
                                <asp:Label runat="server" ID="email"></asp:Label>
                            </div>
                        </div>
                        <div class=" row col-md-12 col-xs-12">
                            <div class="col-md-3"><%=Resources.DisplayText.Address %>: </div>
                            <div class="col-md-8 col-xs-8">
                                <asp:Label runat="server" ID="address"></asp:Label>
                            </div>
                        </div>
                        <div class=" row col-md-12 col-xs-12">
                            <div class="col-md-3"><%=Resources.DisplayText.ZipCode %>: </div>
                            <div class="col-md-8 col-xs-8">
                                <asp:Label runat="server" ID="zipCode"></asp:Label>
                            </div>
                        </div>
                        <div class=" row col-md-12 col-xs-12">
                            <div class="col-md-3"><%=Resources.DisplayText.KakaoTalkID %>: </div>
                            <div class="col-md-8 col-xs-8">
                                <asp:Label runat="server" ID="kakaoTalkID"></asp:Label>
                            </div>
                        </div>
                        <div class=" row col-md-12 col-xs-12">
                            <div class="col-md-3"><%=Resources.DisplayText.FacebookURL %>: </div>
                            <div class="col-md-8 col-xs-8">
                                <asp:Label runat="server" ID="facebook"></asp:Label>
                            </div>
                        </div>
                        <div class=" row col-md-12 col-xs-12">
                            <div class="col-md-3"><%=Resources.DisplayText.TwitterURL %>: </div>
                            <div class="col-md-8 col-xs-8">
                                <asp:Label runat="server" ID="twitter"></asp:Label>
                            </div>
                        </div>
                    </div>


                    <div class=" row col-md-12 col-xs-12">
                        <hr style="background-color: #5f755f; height: 0.2rem;" />
                    </div>
                    <div>
                        <div class="row col-xs-12">
                            <h4><%=Resources.DisplayText.Endorser %></h4>
                        </div>

                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th><%=Resources.DisplayText.EndorserName %></th>
                                    <th><%=Resources.DisplayText.EndorserEmailID %></th>
                                </tr>
                            </thead>
                            <tbody>



                                <asp:Repeater runat="server" ID="repeater_endorser">
                                    <ItemTemplate>
                                        <tr>
                                            <td>
                                                <asp:Label runat="server"><%# Eval("EndorserName") %> </asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label runat="server"><%# Eval("EndorserEmail") %></asp:Label>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>

                            </tbody>
                        </table>

                    </div>

                    <div class="col-xs-12">
                        <asp:Button CssClass="btn btn-primary" runat="server" ID="btn_editArtist" OnClick="onclick_btn_editArtist" Text="<%$Resources:DisplayText,Edit %>" />
                    </div>
                </div>



            </div>
        </ContentTemplate>

    </asp:UpdatePanel>

    <script type="text/javascript">
        document.getElementById("artisttab").style.backgroundColor = "white";
        document.getElementById("artisttab").style.borderBottom = "none";
    </script>

    <style>
        .shadowedPanel {
            border: 1px solid transparent;
            border-radius: 10px;
            border-color: #dddddd;
            /*padding: 1em;*/
            box-shadow: 2px 2px 2px 2px #f5f5f5;
        }
    </style>
</asp:Content>
