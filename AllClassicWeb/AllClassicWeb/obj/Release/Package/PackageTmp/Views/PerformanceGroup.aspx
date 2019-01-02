<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PerformanceGroup.aspx.cs" Inherits="AllClassicWeb.Views.PerformanceGroup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <br />

            <div class="row">
                <div class="col-xs-12">

                    <div class="pull-right" style="padding: 0px;">
                        <asp:Button ID="inquiry" runat="server" CssClass="btn btn-primary pull-right contentButton" OnClick="selectedFilterChanged" Text="<%$Resources:DisplayText, Inquiry %>" />
                    </div>

                    <div class="pull-right" style="padding: 0px; padding-right: 15px;">
                        <span style="display: inline-block; padding-right: 5px;" class="filedName"><%= Resources.DisplayText.City %>  </span>
                        <asp:DropDownList ID="DropDownList1_city" runat="server" class="form-control filedDisplay" AutoPostBack="True" Style="width: 100px; display: inline-block;" DataSourceID="SqlDataSource1_city" DataTextField="SubCode" DataValueField="LookUpID"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1_city" runat="server" ConnectionString="<%$ ConnectionStrings:AllClassicDBConnectionString %>" SelectCommand="SELECT LookUpID=-1, MainCode='ALL', SubCode='ALL' 
Union
SELECT LookUpID, MainCode, SubCode 
FROM Main.LookUpTbl
where maincode='City'
"></asp:SqlDataSource>

                    </div>

                    <div class="pull-right" style="padding: 0px; padding-right: 15px;">
                        <span style="display: inline-block; padding-right: 5px;" class="filedName"><%= Resources.DisplayText.GroupType %>  </span>
                        <asp:DropDownList ID="DropDownList1_grouptype" runat="server" class="form-control filedDisplay" Style="width: 100px; display: inline-block;" DataSourceID="SqlDataSource1_grouptypelist" DataTextField="SubCode" DataValueField="LookUpID"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1_grouptypelist" runat="server" ConnectionString="<%$ ConnectionStrings:AllClassicDBConnectionString %>" SelectCommand="SELECT LookUpID=-1, MainCode='ALL', SubCode='ALL' 
Union
SELECT LookUpID, MainCode, SubCode 
FROM Main.LookUpTbl
where maincode='GroupType'
"></asp:SqlDataSource>

                    </div>

                    <div class="pull-right" style="padding: 0px; padding-right: 15px;">
                        <span style="display: inline-block; padding-right: 5px;" class="filedName"><%= Resources.DisplayText.Alias %> </span>
                        <asp:TextBox ID="txt_alias" runat="server" class="form-control filedDisplay" Style="width: 150px; display: inline-block;"></asp:TextBox>
                    </div>

                    <div class="pull-right" style="padding: 0px; padding-right: 15px;">
                        <span style="display: inline-block; padding-right: 5px;" class="filedName"><%= Resources.DisplayText.PerformanceGroup %> </span>
                        <asp:TextBox ID="txt_performancegroup" runat="server" class="form-control filedDisplay" Style="width: 150px; display: inline-block;"></asp:TextBox>
                    </div>

                </div>

            </div>

            <div class="row" style="padding-right: 15px;">
                <br />
                <asp:SqlDataSource ID="SqlDataSource1_getrecent20artists" runat="server" ConnectionString="<%$ ConnectionStrings:AllClassicDBConnectionString %>" SelectCommand="
select top 20 pg.*, c.SubCode as cityname, gt.SubCode as grouptpename, u.EmailID from Main.PerformanceGroupTbl pg
left join (select * from Main.LookUpTbl where MainCode='city') c on pg.City=c.LookUpID
left join (select * from Main.LookUpTbl where MainCode='GroupType') gt on pg.GroupType=gt.LookUpID
join Main.UserTbl u on pg.UserID=u.UserID
order by pg.UpdateTimeStamp desc"></asp:SqlDataSource>
                <div class="col-xs-12" style="border: 1px; solid lightgray; border-radius: 5px; max-height: 250px; height: 250px; overflow-y: scroll; box-shadow: 0px 2px 15px rgba(0, 0, 0, 0.3);">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th class="contentHeader"><%= Resources.DisplayText.PerformanceGroup %> </th>
                                <th class="contentHeader"><%= Resources.DisplayText.Alias %> </th>
                                <th class="contentHeader"><%= Resources.DisplayText.GroupType %> </th>
                                <th class="contentHeader"><%= Resources.DisplayText.SinceYear %> </th>
                                <th class="contentHeader"><%= Resources.DisplayText.City %> </th>
                                <th class="contentHeader"><%= Resources.DisplayText.Email %> </th>
                            </tr>
                        </thead>
                        <tbody>

                            <asp:Repeater runat="server" ID="artistPageRepeater" DataSourceID="SqlDataSource1_getrecent20artists">

                                <ItemTemplate>

                                    <tr>
                                        <td class="col-xs-2">
                                            <asp:LinkButton runat="server" ID="headertableItem" CssClass="Contentdisplay" Style="text-decoration: none; color: inherit;" OnCommand="onclick_headertableItem" CommandArgument='<%#Eval("PerformanceGroupID")%>'><%#Eval("Name") %></asp:LinkButton></td>
                                        <td class="col-xs-2 Contentdisplay"><%#Eval("Alias") %></td>
                                        <td class="col-xs-2 Contentdisplay"><%#Eval("grouptpename") %></td>
                                        <td class="col-xs-2 Contentdisplay"><%#Eval("SinceYear") %></td>
                                        <td class="col-xs-2 Contentdisplay"><%#Eval("cityname") %></td>
                                        <td class="col-xs-2 Contentdisplay"><%#Eval("EmailID") %></td>
                                    </tr>

                                </ItemTemplate>
                            </asp:Repeater>

                        </tbody>
                    </table>
                </div>
            </div>

            <div class="row">
                <hr />
                <asp:ListView runat="server" ID="pgListContainer" DataKeyNames="PerformanceGroupID" DataSourceID="SqlDataSource1_pglist" GroupItemCount="3" Style="width: 100%;">

                    <EmptyDataTemplate>
                        <div class=" col-xs-12 contentHeader">
                            <h3>No records available.</h3>
                        </div>
                    </EmptyDataTemplate>
                    <GroupTemplate>
                        <div id="itemPlaceholderContainer" runat="server">
                            <div id="itemPlaceholder" runat="server">
                            </div>
                        </div>
                    </GroupTemplate>
                    <ItemTemplate>
                        <div class="col-xs-4" style="padding-right: 5px; padding-left: 5px; margin-bottom: 10px;">
                            <div>
                                <div class="panel panel-default shadowedPanel shadowedbox_hover orchContainer">
                                    <div class="panel-heading contentHeader">

                                        <h4><%# (Eval("Name")) .ToString().Length>15?
                                        (Eval("Name")) .ToString().Substring(0,15)+ " ....":
                                        (Eval("Name")) .ToString()%></h4>
                                        <%--<span>(<%# Eval("Alias") %>)</span>--%>
                                    </div>
                                    <div class="panel-body">
                                        <table>
                                            <tbody class="rowwithbottomborder">
                                                <tr>
                                                    <td class="filedName"><%# Resources.DisplayText.GroupType %>:</td>
                                                    <td class="filedDisplay"><%#Eval("grouptpename") %></td>
                                                </tr>
                                                <tr>
                                                    <td class="filedName"><%# Resources.DisplayText.SinceYear %>:</td>
                                                    <td class="filedDisplay"><%#Eval("SinceYear") %></td>
                                                </tr>
                                                <tr>
                                                    <td class="filedName"><%# Resources.DisplayText.Conductor %>:</td>
                                                    <td class="filedDisplay"><%#Eval("Conductor").ToString().Length>12?Eval("Conductor").ToString().Substring(0,12):Eval("Conductor").ToString() %></td>
                                                </tr>
                                                <tr>
                                                    <td class="filedName"><%# Resources.DisplayText.Address %>:</td>
                                                    <td class="filedDisplay"><%#Eval("Address").ToString().Length>15?Eval("Address").ToString().Substring(0,15):Eval("Address").ToString() %></td>
                                                </tr>
                                                <tr>
                                                    <td class="filedName"><%# Resources.DisplayText.ZipCode %>:</td>
                                                    <td class="filedDisplay"><%#Eval("ZipCode") %></td>
                                                </tr>
                                                <tr>
                                                    <td class="filedName"><%# Resources.DisplayText.TelNo %>:</td>
                                                    <td class="filedDisplay"><%#Eval("TelNO") %></td>
                                                </tr>
                                                <tr>
                                                    <td class="filedName"><%# Resources.DisplayText.FaxNo %>:</td>
                                                    <td class="filedDisplay"><%#Eval("FaxNo") %></td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <span class="filedDisplay"><a href='PerformanceGroupDetail.aspx?PGID=<%#Eval("PerformanceGroupID") %>'><%# Resources.DisplayText.Seemore %></a></span>

                                                    </td>
                                                    <td></td>
                                                </tr>
                                            </tbody>
                                        </table>

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
                                <asp:DataPager ID="DataPager1" runat="server" PageSize="9">
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonType="Button" ButtonCssClass="btn contentButton" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" FirstPageText="<%$Resources:DisplayText,First %>" />
                                        <asp:NumericPagerField />
                                        <asp:NextPreviousPagerField ButtonType="Button" ButtonCssClass="btn contentButton" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" LastPageText="<%$Resources:DisplayText,Last %>" />
                                    </Fields>
                                </asp:DataPager>
                            </div>
                        </div>

                    </LayoutTemplate>
                    <GroupSeparatorTemplate>
                        <div class="clearfix"></div>
                    </GroupSeparatorTemplate>
                </asp:ListView>
                <asp:SqlDataSource ID="SqlDataSource1_pglist" runat="server" ConnectionString="<%$ ConnectionStrings:AllClassicDBConnectionString %>" SelectCommand="
select pg.*, c.SubCode as cityname, gt.SubCode as grouptpename from Main.PerformanceGroupTbl pg
left join (select * from Main.LookUpTbl where MainCode='city') c on pg.City=c.LookUpID
left join (select * from Main.LookUpTbl where MainCode='GroupType') gt on pg.GroupType=gt.LookUpID
order by pg.UpdateTimeStamp desc"></asp:SqlDataSource>
            </div>
            <div class="row">
                <asp:Button runat="server" ID="btn_addNewPerformanceGroup" CssClass="btn btn-success pull-right contentButton" Text="<%$Resources:DisplayText,AddNewData %>" OnClick="onclick_btn_addNewPerformanceGroup" />
            </div>
        </ContentTemplate>

    </asp:UpdatePanel>

</asp:Content>
