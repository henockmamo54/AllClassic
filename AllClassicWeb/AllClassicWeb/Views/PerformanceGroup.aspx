<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PerformanceGroup.aspx.cs" Inherits="AllClassicWeb.Views.PerformanceGroup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <br />
            <div class="row">
                <div class="row col-md-12 col-xs-12  col-xs-12">
                    <div class="col-md-4 col-xs-4 pull-right">
                        <h5 style="display: inline-block;"><%= Resources.DisplayText.PerformanceGroup %> </h5>
                        <asp:TextBox AutoPostBack="true" ID="txt_performancegroup" runat="server" CssClass="form-control" Style="width: 50%; display: inline-block;" OnTextChanged="selectedFilterChanged"></asp:TextBox>
                    </div>

                    <div class="col-md-2 col-xs-2 pull-right">
                        <h5 style="display: inline-block;"><%= Resources.DisplayText.Alias %> </h5>
                        <asp:TextBox AutoPostBack="true" ID="txt_alias" runat="server" CssClass="form-control" Style="width: 70%; display: inline-block;" OnTextChanged="selectedFilterChanged"></asp:TextBox>
                    </div>
                    <div class="col-md-3 col-xs-3  col-xs-3 pull-right">
                        <h5 style="display: inline-block;"><%= Resources.DisplayText.GroupType %>  </h5>
                        <asp:DropDownList ID="DropDownList1_grouptype" runat="server" class="form-control" Style="width: 50%; display: inline-block;" AutoPostBack="True" DataSourceID="SqlDataSource1_grouptypelist" DataTextField="SubCode" DataValueField="LookUpID" OnSelectedIndexChanged="selectedFilterChanged"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1_grouptypelist" runat="server" ConnectionString="<%$ ConnectionStrings:AllClassicDBConnectionString %>" SelectCommand="SELECT LookUpID=-1, MainCode='ALL', SubCode='ALL' 
Union
SELECT LookUpID, MainCode, SubCode 
FROM Main.LookUpTbl
where maincode='GroupType'
"></asp:SqlDataSource>

                    </div>
                    <div class="col-md-3 col-xs-3 pull-right">
                        <h5 style="display: inline-block;"><%= Resources.DisplayText.City %>  </h5>
                        <asp:DropDownList ID="DropDownList1_city" runat="server" class="form-control" AutoPostBack="True" Style="width: 50%; display: inline-block;" DataSourceID="SqlDataSource1_city" DataTextField="SubCode" DataValueField="LookUpID" OnSelectedIndexChanged="selectedFilterChanged"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1_city" runat="server" ConnectionString="<%$ ConnectionStrings:AllClassicDBConnectionString %>" SelectCommand="SELECT LookUpID=-1, MainCode='ALL', SubCode='ALL' 
Union
SELECT LookUpID, MainCode, SubCode 
FROM Main.LookUpTbl
where maincode='City'
"></asp:SqlDataSource>

                    </div>
                </div>

            </div>
            <br />

            <div class="row" style="padding-right: 15px;">
                <asp:SqlDataSource ID="SqlDataSource1_getrecent20artists" runat="server" ConnectionString="<%$ ConnectionStrings:AllClassicDBConnectionString %>" SelectCommand="
select top 20 pg.*, c.SubCode as cityname, gt.SubCode as grouptpename, u.EmailID from Main.PerformanceGroupTbl pg
left join (select * from Main.LookUpTbl where MainCode='city') c on pg.City=c.LookUpID
left join (select * from Main.LookUpTbl where MainCode='GroupType') gt on pg.GroupType=gt.LookUpID
join Main.UserTbl u on pg.UserID=u.UserID
order by pg.UpdateTimeStamp desc"></asp:SqlDataSource>
                <div class="col-xs-12" style="border: 1px solid lightgray; border-radius: 5px; max-height: 150px; height: 150px; overflow-y: scroll;">
                    <asp:Repeater runat="server" ID="artistPageRepeater" DataSourceID="SqlDataSource1_getrecent20artists">
                        <HeaderTemplate>
                            <div class="col-xs-2"><strong><%= Resources.DisplayText.PerformanceGroup %></strong></div>
                            <div class="col-xs-2"><strong><%= Resources.DisplayText.Alias %></strong></div>
                            <div class="col-xs-2"><strong><%= Resources.DisplayText.GroupType %></strong></div>
                            <div class="col-xs-2"><strong><%= Resources.DisplayText.SinceYear %></strong></div>
                            <div class="col-xs-2"><strong><%= Resources.DisplayText.City %></strong></div>
                            <div class="col-xs-2"><strong><%= Resources.DisplayText.Email %></strong></div>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <%--<asp:LinkButton runat="server" ID="LinkButton1" Style="text-decoration: none;" OnCommand="onclick_headertableItem" CommandArgument='<%#Eval("MusicianID")%>'>--%>
                            <asp:LinkButton runat="server" ID="headertableItem" Style="text-decoration: none;">
                                <div class=" row col-md-12 col-xs-12">
                                    <hr style="background-color: #5f755f; margin: 0; margin-top: 5px;" />
                                </div>
                                <div class="col-xs-2"><%#Eval("Name") %></div>
                                <div class="col-xs-2"><%#Eval("Alias") %></div>
                                <div class="col-xs-2"><%#Eval("grouptpename") %></div>
                                <div class="col-xs-2"><%#Eval("SinceYear") %></div>
                                <div class="col-xs-2"><%#Eval("cityname") %></div>
                                <div class="col-xs-2"><%#Eval("EmailID") %></div>
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>

            <hr style="margin-top: 0px;" />
            <div class="row">
                <asp:ListView runat="server" ID="pgListContainer" DataKeyNames="PerformanceGroupID" DataSourceID="SqlDataSource1_pglist" GroupItemCount="4" Style="width: 100%;">

                    <GroupTemplate>
                        <div id="itemPlaceholderContainer" runat="server">
                            <div id="itemPlaceholder" runat="server">
                            </div>
                        </div>
                    </GroupTemplate>
                    <ItemTemplate>
                        <div class="col-md-3 col-xs-3" style="padding-right: 5px; padding-left: 5px;">
                            <div class="orchContainer" style="background-color: white;">
                                <h4 style="color: #00796B; font-weight: 800;"><%#Eval("Name").ToString().Length>10?Eval("Name").ToString().Substring(0,10):Eval("Name").ToString() %></h4>
                                <h5 style="color: #00796B;">(<%#Eval("Alias") %>)</h5>
                                <div style="font-size: 1.2rem; color: #4c4949; margin-left: 10px;">

                                    <span><%# Resources.DisplayText.GroupType %>: <%#Eval("grouptpename") %></span>
                                    <br />
                                    <span><%# Resources.DisplayText.SinceYear %>: <%#Eval("SinceYear") %></span>
                                    <br />
                                    <span><%# Resources.DisplayText.Conductor %>: <%#Eval("Conductor").ToString().Length>12?Eval("Conductor").ToString().Substring(0,12):Eval("Conductor").ToString() %></span><br />
                                    <span><%# Resources.DisplayText.Address %>: <%#Eval("Address").ToString().Length>15?Eval("Address").ToString().Substring(0,15):Eval("Address").ToString() %></span><br />
                                    <span><%# Resources.DisplayText.ZipCode %>: <%#Eval("ZipCode") %></span><br />
                                    <span><%# Resources.DisplayText.TelNo %>: <%#Eval("TelNO") %></span><br />
                                    <span><%# Resources.DisplayText.FaxNo %>: <%#Eval("FaxNo") %></span><br />
                                    <span><a href='<%#Eval("HomePage") %>' target="_blank"><%# Resources.DisplayText.HomePage %></a></span>
                                </div>
                            </div>

                        </div>

                    </ItemTemplate>
                    <LayoutTemplate>
                        <div class="col-xs-12" id="groupPlaceholderContainer" runat="server" style="padding: 0px;">

                            <div id="groupPlaceholder" runat="server">
                            </div>
                            <div class="col-xs-12" style="text-align: center;">
                                <asp:DataPager ID="DataPager1" runat="server" PageSize="8">
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
                <asp:SqlDataSource ID="SqlDataSource1_pglist" runat="server" ConnectionString="<%$ ConnectionStrings:AllClassicDBConnectionString %>" SelectCommand="
select pg.*, c.SubCode as cityname, gt.SubCode as grouptpename from Main.PerformanceGroupTbl pg
left join (select * from Main.LookUpTbl where MainCode='city') c on pg.City=c.LookUpID
left join (select * from Main.LookUpTbl where MainCode='GroupType') gt on pg.GroupType=gt.LookUpID
order by pg.UpdateTimeStamp desc"></asp:SqlDataSource>
            </div>
            <div class="row">
                <asp:Button runat="server" ID="btn_addNewPerformanceGroup" CssClass="btn btn-success pull-right" Text="<%$Resources:DisplayText,AddNewData %>" OnClick="onclick_btn_addNewPerformanceGroup" />
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

    <script type="text/javascript">
        document.getElementById("performancegrouptab").style.backgroundColor = "rgb(255, 255, 255) ";
        document.getElementById("performancegrouptab").style.borderRight = "none";
    </script>
    <style type="text/css">
        .orchContainer {
            background: white;
            margin: 5px;
            border-radius: 5px;
            padding: 5px;
            border: 2px solid #dadce4;
        }
    </style>
</asp:Content>
