<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EndorsementPage.aspx.cs" Inherits="AllClassicWeb.Views.EndorsementPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
        <ContentTemplate>
            <div class="row">
                <div class=" col-xs-8">
                    <h3>Endorsement Approval</h3>
                    <hr />

                    <div class="row">
                        <div class="col-md-6 col-xs-6 pull-left">
                            <asp:Image runat="server" ID="profileImage" Width="100%" CssClass="shadowedPanel" />
                        </div>

                        <div class="col-md-6 col-xs-6 pull-center">

                            <h3 runat="server" id="artistnamecontainer" style="font-weight: 800;"></h3>

                            <div>
                                
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
                                    <asp:Button runat="server" ID="saveEndorsement" CssClass="btn btn-success pull-right" Style="margin-top: 4px;" Text="<%$Resources:DisplayText,Endorse %>"  OnClick="saveEndorsementComment" />
                                </div>
                            </div>
                             
                        </div>



                    </div>
                   
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
