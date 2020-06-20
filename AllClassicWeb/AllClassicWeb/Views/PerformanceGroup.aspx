<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PerformanceGroup.aspx.cs" Inherits="AllClassicWeb.Views.PerformanceGroup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel runat="server">
        <ContentTemplate>

            <div class="conbox">

                <h2>ORG</h2>

                <div class="conlist">
                    <ul>

                        <li>
                            <%= Resources.DisplayText.PerformanceGroup %>
                            <asp:TextBox ID="txt_performancegroup" runat="server" Style="display: inline-block;"></asp:TextBox>
                        </li>

                        <li>
                            <%= Resources.DisplayText.Alias %>
                            <asp:TextBox ID="txt_alias" runat="server" Style="display: inline-block;"></asp:TextBox>
                        </li>

                        <li><%= Resources.DisplayText.GroupType %>
                            <asp:DropDownList ID="DropDownList1_grouptype" runat="server" class="form-control filedDisplay" Style="width: 100px; display: inline-block;" DataSourceID="SqlDataSource1_grouptypelist" DataTextField="SubCode" DataValueField="LookUpID"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1_grouptypelist" runat="server" ConnectionString="<%$ ConnectionStrings:AllClassicDBConnectionString %>" SelectCommand="SELECT LookUpID=-1, MainCode='ALL', SubCode='ALL' 
Union
SELECT LookUpID, MainCode, SubCode 
FROM Main.LookUpTbl
where maincode='GroupType'
"></asp:SqlDataSource>
                        </li>

                        <li><%= Resources.DisplayText.City %>
                            <asp:DropDownList ID="DropDownList1_city" runat="server" AutoPostBack="True" Style="width: 100px; display: inline-block;" DataSourceID="SqlDataSource1_city" DataTextField="SubCode" DataValueField="LookUpID"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1_city" runat="server" ConnectionString="<%$ ConnectionStrings:AllClassicDBConnectionString %>" SelectCommand="SELECT LookUpID=-1, MainCode='ALL', SubCode='ALL' 
Union
SELECT LookUpID, MainCode, SubCode 
FROM Main.LookUpTbl
where maincode='City'
"></asp:SqlDataSource>

                        </li>
                    </ul>
                    <div class="btn2">
                        <asp:LinkButton ID="inquiry" runat="server" OnClick="selectedFilterChanged"><%= Resources.DisplayText.Inquiry %> </asp:LinkButton>
                    </div>

                    <asp:SqlDataSource ID="SqlDataSource1_getrecent20artists" runat="server" ConnectionString="<%$ ConnectionStrings:AllClassicDBConnectionString %>" SelectCommand="
select top 20 pg.*, c.SubCode as cityname, gt.SubCode as grouptpename, u.EmailID from Main.PerformanceGroupTbl pg
left join (select * from Main.LookUpTbl where MainCode='city') c on pg.City=c.LookUpID
left join (select * from Main.LookUpTbl where MainCode='GroupType') gt on pg.GroupType=gt.LookUpID
join Main.UserTbl u on pg.UserID=u.UserID
order by pg.UpdateTimeStamp desc"></asp:SqlDataSource>
                    <div class="col-xs-12" style="max-height: 250px; height: 250px; padding: 0; overflow-y: scroll;">
                        <table>
                            <thead>
                                <tr>
                                    <th><%= Resources.DisplayText.PerformanceGroup %> </th>
                                    <th><%= Resources.DisplayText.Alias %> </th>
                                    <th><%= Resources.DisplayText.GroupType %> </th>
                                    <th><%= Resources.DisplayText.SinceYear %> </th>
                                    <th><%= Resources.DisplayText.City %> </th>
                                    <th><%= Resources.DisplayText.Email %> </th>
                                </tr>
                            </thead>
                            <tbody>

                                <asp:Repeater runat="server" ID="artistPageRepeater" DataSourceID="SqlDataSource1_getrecent20artists">

                                    <ItemTemplate>
                                        <tr>
                                            <td>
                                                <asp:LinkButton runat="server" ID="headertableItem" CssClass="Contentdisplay" Style="text-decoration: none; color: inherit;" OnCommand="onclick_headertableItem" CommandArgument='<%#Eval("PerformanceGroupID")%>'><%#Eval("Name") %></asp:LinkButton></td>
                                            <td><%#Eval("Alias") %></td>
                                            <td><%#Eval("grouptpename") %></td>
                                            <td><%#Eval("SinceYear") %></td>
                                            <td><%#Eval("cityname") %></td>
                                            <td><%#Eval("EmailID") %></td>
                                        </tr>
                                    </ItemTemplate>
                                    <AlternatingItemTemplate>
                                        <td class="td2">
                                            <asp:LinkButton runat="server" ID="headertableItem" CssClass="Contentdisplay" Style="text-decoration: none; color: inherit;" OnCommand="onclick_headertableItem" CommandArgument='<%#Eval("PerformanceGroupID")%>'><%#Eval("Name") %></asp:LinkButton></td>
                                        <td class="td2"><%#Eval("Alias") %></td>
                                        <td class="td2"><%#Eval("grouptpename") %></td>
                                        <td class="td2"><%#Eval("SinceYear") %></td>
                                        <td class="td2"><%#Eval("cityname") %></td>
                                        <td class="td2"><%#Eval("EmailID") %></td>

                                    </AlternatingItemTemplate>
                                </asp:Repeater>

                            </tbody>
                        </table>
                    </div>

                </div>

                <div class="orglist">

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
                            <div>
                                <li>
                                    <div class="name">
                                        <%# (Eval("Name")) .ToString().Length>15?
                                        (Eval("Name")) .ToString().Substring(0,15)+ " ....":
                                        (Eval("Name")) .ToString()%>
                                    </div>
                                    <ul class="txt">
                                        <li><span>- <%# Resources.DisplayText.GroupType %></span><%#Eval("grouptpename") %></li>
                                        <li><span>- <%# Resources.DisplayText.SinceYear %></span><%#Eval("SinceYear") %></li>
                                        <li><span>- <%# Resources.DisplayText.Conductor %></span><%#Eval("Conductor").ToString().Length>12?Eval("Conductor").ToString().Substring(0,12):Eval("Conductor").ToString() %></li>
                                        <li><span>- <%# Resources.DisplayText.Address %></span><%#Eval("Address").ToString().Length>15?Eval("Address").ToString().Substring(0,15):Eval("Address").ToString() %></li>
                                        <li><span>- <%# Resources.DisplayText.ZipCode %></span><%#Eval("ZipCode") %></li>
                                        <li><span>- <%# Resources.DisplayText.TelNo %></span><%#Eval("TelNO") %></li>
                                        <li><span>- <%# Resources.DisplayText.FaxNo %></span><%#Eval("FaxNo") %></li>
                                        <li><span class="filedDisplay"><a href='PerformanceGroupDetail.aspx?PGID=<%#Eval("PerformanceGroupID") %>'><%# Resources.DisplayText.Seemore %></a></span></li>
                                    </ul>
                                </li>
                            </div>

                        </ItemTemplate>
                        <LayoutTemplate>
                            <div class="col-xs-12" id="groupPlaceholderContainer" runat="server" style="padding: 0px;">

                                <div id="groupPlaceholder" runat="server">
                                </div>
                                <div class="col-xs-12" style="text-align: center; padding-top: 10px;">
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

                <asp:Button runat="server" ID="btn_addNewPerformanceGroup" CssClass="btn btn-success pull-right contentButton" Text="<%$Resources:DisplayText,AddNewData %>" OnClick="onclick_btn_addNewPerformanceGroup" />

            </div>



        </ContentTemplate>

    </asp:UpdatePanel>

</asp:Content>
