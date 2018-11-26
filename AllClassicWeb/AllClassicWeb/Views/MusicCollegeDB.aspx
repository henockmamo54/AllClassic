<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MusicCollegeDB.aspx.cs" Inherits="AllClassicWeb.Views.MusicCollegeDB" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel runat="server">
        <ContentTemplate>

            <br />
            <div class="row">
                <div class="row col-xs-12">
                    <div class="col-xs-3" style="padding-right: 0px;">
                        <h5 style="display: inline-block;"><%= Resources.DisplayText.Name %> </h5>
                        <asp:TextBox AutoPostBack="true" ID="txtbox_namefilter" runat="server" CssClass="form-control" Style="width: 70%; display: inline-block;"></asp:TextBox>

                    </div>
                    <div class="col-xs-3" style="padding-right: 0px;">
                        <h5 style="display: inline-block;"><%= Resources.DisplayText.ShortName %>  </h5>
                        <asp:TextBox AutoPostBack="true" ID="txtbox_shortnamefilter" runat="server" CssClass="form-control" Style="width: 62%; display: inline-block;"></asp:TextBox>
                    </div>
                    <div class="col-xs-3" style="padding-right: 0px;">
                        <h5 style="display: inline-block;"><%= Resources.DisplayText.Country %>  </h5>
                        <asp:DropDownList Style="display: inline-block; width: 70%;" ID="DropDownList1_countryfilter" runat="server" class="form-control" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="Name"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AllClassicDBConnectionString %>" SelectCommand="SELECT  Name='ALL'
Union
SELECT Distinct country from main.CollegeTbl
"></asp:SqlDataSource>


                    </div>
                    <div class="col-xs-3 pull-right" style="padding-right: 0px;">
                        <asp:Button runat="server" ID="inquiry" Text="<%$Resources:DisplayText,Inquiry %>" CssClass="btn btn-primary" OnClick="selectedFilterChanged" />
                    </div>
                </div>

            </div>

            <br />

            <div class="row" style="padding-right: 15px;">
                <asp:SqlDataSource ID="SqlDataSource1_getrecent20artists" runat="server" ConnectionString="<%$ ConnectionStrings:AllClassicDBConnectionString %>" SelectCommand="
select top 20 c.*,u.EmailID from Main.CollegeTbl c
join Main.usertbl u on c.Userid=u.userid
order by UpdateTimeStamp desc"></asp:SqlDataSource>
                <div class="col-xs-12" style="border: 1px solid lightgray; border-radius: 5px; max-height: 150px; height: 150px; overflow-y: scroll;">

                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th><%= Resources.DisplayText.Name %></th>
                                <th><%= Resources.DisplayText.ShortName %></th>
                                <th><%= Resources.DisplayText.Country %></th>
                                <th><%= Resources.DisplayText.PosterEmailID %></th>
                            </tr>
                        </thead>
                        <tbody>

                            <asp:Repeater runat="server" ID="artistPageRepeater" DataSourceID="SqlDataSource1_getrecent20artists">

                                <ItemTemplate>
                                    <tr>
                                        <td>
                                            <asp:LinkButton runat="server" ID="headertableItem" Style="text-decoration: none;" OnCommand="onclick_headertableItem" CommandArgument='<%#Eval("CollegeID")%>'><%#Eval("Name") %></asp:LinkButton></td>
                                        <td><%#Eval("ShortName") %></td>
                                        <td><%#Eval("Country") %></td>
                                        <td><%#Eval("EmailID") %></td>

                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>

                        </tbody>
                    </table>

                </div>
            </div>

            <hr style="margin-top: 0px;" />

            <div class="row">
                <asp:ListView runat="server" ID="collegeListContainer" DataKeyNames="CollegeID" DataSourceID="SqlDataSource1_Collegelist" GroupItemCount="3" Style="width: 100%;">

                    <GroupTemplate>
                        <div id="itemPlaceholderContainer" runat="server">
                            <div id="itemPlaceholder" runat="server">
                            </div>
                        </div>
                    </GroupTemplate>
                    <ItemTemplate>
                        <div class="col-md-4 col-xs-4" style="margin-bottom: 1em;">
                            <div class="thumbnail shadowedbox shadowedbox_hover" style="box-shadow: 2px 2px 2px #d0d0d0;">
                                <asp:LinkButton runat="server" ID="tumbinallink" Style="text-decoration: none;" OnCommand="CollegeDBClicked" CommandArgument='<%# Eval("CollegeID") %>'>
                                                                            <img src="../Doc/College/<%#Eval("CollegePhoto") %>" class="shadowedbox" alt="Lights" style="width: 100%; height: 200px;">

                                            <div class="caption" style="padding-bottom:3px;">
                                                <h4><%# (Eval("Name")) .ToString().Length>15?
                                                           (Eval("Name")) .ToString().Substring(0,15)+ " ....":
                                                           (Eval("Name")) .ToString()%></h4>
                                                
                                            </div>                                

                                </asp:LinkButton>
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
                                        <asp:NextPreviousPagerField ButtonType="Button" ButtonCssClass="btn " ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                        <asp:NumericPagerField />
                                        <asp:NextPreviousPagerField ButtonType="Button" ButtonCssClass="btn " ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                    </Fields>
                                </asp:DataPager>
                            </div>
                        </div>

                    </LayoutTemplate>
                    <GroupSeparatorTemplate>
                        <div class="clearfix"></div>
                    </GroupSeparatorTemplate>
                </asp:ListView>
                <asp:SqlDataSource ID="SqlDataSource1_Collegelist" runat="server" ConnectionString="<%$ ConnectionStrings:AllClassicDBConnectionString %>" SelectCommand="
select * from Main.CollegeTbl
order by UpdateTimeStamp desc"></asp:SqlDataSource>
            </div>

            <div class="row">
                <asp:Button runat="server" ID="btn_addMusicCollege" CssClass="btn btn-success pull-right" Text="<%$Resources:DisplayText,AddNewData %>" OnClick="onclick_btn_addMusicCollege" />
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
