<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MusicianDB.aspx.cs" Inherits="AllClassicWeb.Views.MusicianDB" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <br />
    <div class="row">
        <div class="col-xs-12" >
            <div class="col-xs-12" style="background: red;">
            </div>
        </div>
    </div>

    <hr />
    <div class="row">
        <asp:ListView runat="server" ID="artistListContainer" DataKeyNames="MusicianID" DataSourceID="SqlDataSource1_artistlist" GroupItemCount="3" Style="width: 100%;">

            <GroupTemplate>
                <div id="itemPlaceholderContainer" runat="server">
                    <div id="itemPlaceholder" runat="server">
                    </div>
                </div>
            </GroupTemplate>
            <ItemTemplate>
                <div class="col-sm-4 col-xs-4">
                    <div class="row col-sm-12 col-xs-12" style="box-shadow: 0px 0px 5px 2px #d4d3d3; border-radius: 3px; margin-bottom: 2rem; padding-left: 0; background-color: white; font-family: Roboto, Arial, sans-serif;">
                        <div class="col-sm-6 col-xs-6" style="padding: 0;">
                            <img style="width: 100%; height: 18.25rem; padding: 3px; border-radius: 7px;" class="card-img-top img-rounded" src="../Doc/artist/<%#Eval("Photo2") %>" alt="Card image cap">
                        </div>
                        <div class="col-sm-6 col-xs-6" style="margin: 0px; padding: 0px; padding-left: 8px; font-size: 1.2rem;">
                            <div class="card-body">
                                <h5 class="card-title" style="margin: 0; margin-top: 5px; margin-bottom: 5px;"><strong><%#Eval("Name") %> </strong></h5>
                                <p class="card-text" style="color: #555555;">
                                    <strong><%# Resources.DisplayText.YourAffilation %>: </strong>
                                    <%#Eval("Affliation") %>
                                    <br />
                                    <strong><%# Resources.DisplayText.Major %>: </strong>
                                    <%#Eval("Major") %>
                                </p>
                                <a href="ArtistProfilePaage.aspx?ID=<%#Eval("MusicianID") %> " class="btn btn-default"><%= Resources.DisplayText.HomePage %></a>
                            </div>
                        </div>
                    </div>

                </div>

            </ItemTemplate>
            <LayoutTemplate>
                <div class="col-xs-12" id="groupPlaceholderContainer" runat="server" style="padding: 0px;">

                    <div id="groupPlaceholder" runat="server">
                    </div>
                    <div class="col-xs-12" style="text-align: center;">
                        <asp:DataPager ID="DataPager1" runat="server" PageSize="6">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                <asp:NumericPagerField />
                                <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                            </Fields>
                        </asp:DataPager>
                    </div>
                </div>

            </LayoutTemplate>
            <GroupSeparatorTemplate>
                <div class="clearfix"></div>
            </GroupSeparatorTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="SqlDataSource1_artistlist" runat="server" ConnectionString="<%$ ConnectionStrings:AllClassicDBConnectionString %>" SelectCommand="
SELECT * FROM Main.[MusicianTbl]"></asp:SqlDataSource>
    </div>
    <div class="row">
        <asp:Button runat="server" ID="btn_addNewMusician" CssClass="btn btn-success pull-right" Text="<%$Resources:DisplayText,AddNewData %>" OnClick="onclick_btn_addNewMusician" />
    </div>
</asp:Content>
