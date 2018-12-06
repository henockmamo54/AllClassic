﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ConcertVenuDB.aspx.cs" Inherits="AllClassicWeb.Views.ConcertVenuDB" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <asp:UpdatePanel runat="server">
        <ContentTemplate>


            <br />
            <div class="row">
                <div class="row col-md-12 col-xs-12  col-xs-12">
                    <div class="col-md-4 col-xs-4 ">
                        <h5 style="display: inline-block;"><%= Resources.DisplayText.VenuName %> </h5>
                        <asp:TextBox AutoPostBack="true" ID="txtbox_namefilter" runat="server" CssClass="form-control" Style="width: 70%; display: inline-block;"></asp:TextBox>
                    </div>
                    <div class="col-md-3 col-xs-3  ">
                        <h5 style="display: inline-block;"><%= Resources.DisplayText.Alias %>  </h5>
                        <asp:TextBox AutoPostBack="true" ID="txtbox_aliasfilter" runat="server" CssClass="form-control" Style="width: 70%; display: inline-block;"></asp:TextBox>
                    </div>
                    <div class="col-md-3 col-xs-3 ">
                        <h5 style="display: inline-block;"><%= Resources.DisplayText.City %>  </h5>
                        <asp:DropDownList Style="display: inline-block; width: 70%;" ID="DropDownList1_cityfilter" runat="server" class="form-control" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="SubCode" DataValueField="LookUpID"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AllClassicDBConnectionString %>" SelectCommand="SELECT   LookUpID=-1, MainCode='ALL', SubCode='ALL'
Union
SELECT LookUpID, MainCode, SubCode 
FROM Main.LookUpTbl
where maincode='City'
"></asp:SqlDataSource>
                    </div>
                    <div class="col-md-2 col-xs-2 ">
                        <asp:Button ID="inquiry" runat="server" CssClass="btn btn-primary pull-right" OnClick="selectedFilterChanged" Text="<%$Resources:DisplayText, Inquiry %>" />
                    </div>

                </div>
            </div>
            <br />
            <br />

            <div class="row" style="padding-right: 15px;">
                <br />
                <asp:SqlDataSource ID="SqlDataSource1_getrecent20artists" runat="server" ConnectionString="<%$ ConnectionStrings:AllClassicDBConnectionString %>" SelectCommand="
select top 20 c.*,u.EmailID posteremailiD, ci.SubCode as cityname from Auxiliary.VenueTbl c
left join Main.usertbl u on c.Userid=u.userid
            left join(SELECT LookUpID, MainCode, SubCode 
FROM Main.LookUpTbl
where maincode='City' ) ci on ci.LookUpID=c.City
order by UpdateTimeStamp desc"></asp:SqlDataSource>
                <div class="col-xs-12" style="border: 1px solid lightgray; border-radius: 5px; max-height: 200px; height: 200px; overflow-y: scroll;">

                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th><strong><%= Resources.DisplayText.VenuName %></strong></th>
                                <th><strong><%= Resources.DisplayText.Alias %></strong></th>
                                <%--<div class="col-xs-2"><strong><%= Resources.DisplayText.Expertise %></strong></div>--%>
                                <th><strong><%= Resources.DisplayText.City %></strong></th>
                                <th><strong><%= Resources.DisplayText.PosterEmailID %></strong></th>
                            </tr>
                        </thead>
                        <tbody>



                            <asp:Repeater runat="server" ID="artistPageRepeater" DataSourceID="SqlDataSource1_getrecent20artists">

                                <ItemTemplate>
                                    <tr>
                                        <td><%#Eval("Name") %></td>
                                        <td><%#Eval("Alias") %></td>
                                        <%--<div class="col-xs-2"><%#Eval("Expertise") %></div>--%>
                                        <td><%#Eval("cityname") %></td>
                                        <td><%#Eval("posteremailiD") %></td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>

                        </tbody>
                    </table>
                </div>
            </div>

            <hr style="margin-top: 0px;" />


            <div class="row">
                <asp:ListView runat="server" ID="collegeListContainer" DataKeyNames="VenueID" DataSourceID="SqlDataSource1_Collegelist" GroupItemCount="3" Style="width: 100%;">

                    <GroupTemplate>
                        <div id="itemPlaceholderContainer" runat="server">
                            <div id="itemPlaceholder" runat="server">
                            </div>
                        </div>
                    </GroupTemplate>
                    <ItemTemplate>
                        <div class="col-md-4 col-xs-4" style="margin-bottom: 1em; padding-left: 0;">
                            <div class="thumbnail shadowedbox shadowedbox_hover" style="box-shadow: 2px 2px 2px #d0d0d0;">
                                <div runat="server" id="tumbinallink" style="text-decoration: none;">

                                    <div class="caption" style="padding-bottom: 3px;">
                                        <h4><%# (Eval("Name")) .ToString().Length>15?
                                        (Eval("Name")) .ToString().Substring(0,15)+ " ....":
                                        (Eval("Name")) .ToString()%></h4>
                                        <hr />
                                        <div>
                                            <span><strong><%= Resources.DisplayText.Alias %>:</strong><%# Eval("Alias") %></span>
                                        </div>

                                        <div>
                                            <span><strong><%= Resources.DisplayText.City %>:</strong><%# Eval("city") %></span>
                                        </div>
                                        <div>
                                            <span><strong><%= Resources.DisplayText.OwnerName %>:</strong><%# Eval("OwnerName") %></span>
                                        </div>
                                        <div>
                                            <span><strong><%= Resources.DisplayText.SinceYear %>:</strong><%# Eval("SinceYear") %></span>
                                        </div>
                                        <div>
                                            <span><strong><%= Resources.DisplayText.Email %>:</strong><%# Eval("EmailID") %></span>
                                        </div>
                                        <div>
                                            <span><strong><%= Resources.DisplayText.Address %>:</strong><%# Eval("Address") %></span>
                                        </div>
                                        <div>
                                            <span><strong><%= Resources.DisplayText.ZipCode %>:</strong><%# Eval("ZipCode") %></span>
                                        </div>
                                        <div>
                                            <span><strong><%= Resources.DisplayText.TelNo %>:</strong><%# Eval("TelNo") %></span>
                                        </div>
                                        <div>
                                            <span><strong><%= Resources.DisplayText.FaxNo %>:</strong><%# Eval("FaxNo") %></span>
                                        </div>
                                        <div>
                                            <span><strong><%= Resources.DisplayText.HomePage %>:</strong>
                                                <asp:LinkButton runat="server" target="_blank" Text='<%# Eval("HomePage") %>' href='http://<%# Eval("HomePage") %>'></asp:LinkButton></span>
                                        </div>

                                         <asp:LinkButton runat="server" ID="edit" OnCommand="editvenuClicked" CommandArgument='<%# Eval("VenueID") %>'><%= Resources.DisplayText.Edit %></asp:LinkButton>    

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
                                        <asp:NextPreviousPagerField ButtonType="Button" ButtonCssClass="btn " ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" FirstPageText="<%$Resources:DisplayText,First %>" />
                                        <asp:NumericPagerField />
                                        <asp:NextPreviousPagerField ButtonType="Button" ButtonCssClass="btn " ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" LastPageText="<%$Resources:DisplayText,Last %>" />
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
select r.*, r.EmailID from Auxiliary.VenueTbl r
           left join Main.usertbl u on r.Userid=u.userid
order by UpdateTimeStamp desc"></asp:SqlDataSource>
            </div>


            <div class="row">
                <asp:Button runat="server" ID="btn_addNewConcertVenu" CssClass="btn btn-success pull-right" Text="<%$Resources:DisplayText,AddNewData %>" OnCommand="onclick_btn_addNewConcertVenu" OnClick="onclick_btn_addNewConcertVenu" />
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
