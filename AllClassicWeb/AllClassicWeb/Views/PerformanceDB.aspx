<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PerformanceDB.aspx.cs" Inherits="AllClassicWeb.Views.PerformanceDB" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <br />
            <div class="row " style="padding-right: 0px; margin-right: 0px;">
                <div class="col-md-3 col-xs-3" runat="server" onclick="test">
                    <asp:Calendar runat="server" ID="dateselectorcalendar" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="200px" NextPrevFormat="FullMonth" Width="220px" OnSelectionChanged="dateselectorcalendar_SelectionChanged">
                        <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                        <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                        <OtherMonthDayStyle ForeColor="#999999" />
                        <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                        <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="0px" Font-Bold="True" CssClass="contentTitle" Font-Size="12pt" ForeColor="#333399" />
                        <TodayDayStyle BackColor="#ffffff" />
                    </asp:Calendar>

                    <div style="text-align: center">
                        <asp:Button runat="server" ID="btnResetSelection" Text="clear" Style="background-color: #28878A; color: white; border: 1px solid lightgray; border-radius: 1px; padding: 3px; margin: 1px; border-radius: 3px;"
                            OnClick="btnClearSelection" />
                    </div>

                </div>
                <div class="col-md-6 col-xs-6 " style="padding: 0;">
                    <h5 style="color: #28878a; font-weight: 700;" class="contentTitle"><%= Resources.DisplayText.Performanceschedule %>: <%= Resources.DisplayText.ThisWeek %></h5>
                    <div class="shadowedPanel" style="overflow-y: scroll; max-height: 200px; height: 200px; box-shadow: 0px 2px 15px rgba(0, 0, 0, 0.3);">
                        <table class="table table-striped ">
                            <thead>
                                <tr class="filedName">
                                    <th scope="col"><%= Resources.DisplayText.StartDate %></th>
                                    <th scope="col"><%= Resources.DisplayText.Title %></th>
                                    <th scope="col"><%=Resources.DisplayText.Region %>/<%=Resources.DisplayText.City %></th>
                                    <th scope="col"><%=Resources.DisplayText.Venue %></th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater runat="server" ID="repeater_thisweekPerformanceInfo">
                                    <ItemTemplate>
                                        <tr class="filedDisplayandContentdisplay">
                                            <td scope="row"><%# DataBinder.Eval(Container.DataItem,"StartDate","{0:d/M/yyyy}")  %></td>
                                            <td><%# (Eval("MainTitle")) .ToString().Length>15?
                                                           (Eval("MainTitle")) .ToString().Substring(0,15)+ " ....":
                                                           (Eval("MainTitle")) .ToString()%></td>
                                            <td><%# Eval("LookupTbl1.Subcode") %>/<%# Eval("LookUpTbl2.Subcode") %></td>
                                            <td><%# Eval("VenueTbl.Name") %> </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="col-md-3 " style="padding-right: 0px;">
                    <h5 style="color: #28878a; font-weight: 700;" class="contentTitle"><%=Resources.DisplayText.Region %></h5>
                    <asp:Repeater runat="server" ID="repeater_location" OnItemDataBound="repeater_locationOnItemDataBound" DataSourceID="SqlDataSource1_region">
                        <ItemTemplate>
                            <asp:Button runat="server" OnClick="regionclicked" CommandArgument='<%# Eval("subcode") %>' ID='location' class="locationcontainer filedDisplayandContentdisplay" Text='<%# Eval("subcode") %>'></asp:Button>
                        </ItemTemplate>
                    </asp:Repeater>

                    <asp:SqlDataSource ID="SqlDataSource1_region" runat="server" ConnectionString="<%$ ConnectionStrings:AllClassicDBConnectionString %>" SelectCommand="
select* from(
select lookupid, subcode, Row=0 from main.lookuptbl where subcode like N'%전체%'
Union
select lookupid, subcode,
 ROW_NUMBER() over(order by subcode asc) As Row 
from main.lookuptbl
where maincode='Region'
and subcode not like N'%전체%'
)x  order by row"></asp:SqlDataSource>

                </div>
            </div>
            <div class="row col-xs-12" style="margin-top: 15px;">

                <h4 style="color: #28878a;" class="contentTitle "><%= Resources.DisplayText.Total %>:
                            <asp:Label runat="server" ID="label_countofitems"></asp:Label>
                    <%= Resources.DisplayText.Events %> </h4>

                <hr style="margin-top: 0px;" />
            </div>
            <div class="row">
                <asp:ListView runat="server" ID="artistListContainer" OnDataBound="artistListContainer_ondatabound" DataKeyNames="PerformanceID" DataSourceID="SqlDataSource1_Performancelist" GroupItemCount="4" Style="width: 100%;">

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
                        <div class="col-md-3 col-xs-3" style="margin-bottom: 1em; padding-right: 0px;">
                            <div class="thumbnail shadowedbox shadowedbox_hover" style="box-shadow: 0px 2px 30px rgba(0, 0, 0, 0.3);">
                                <asp:LinkButton runat="server" ID="tumbinallink" Style="text-decoration: none;" OnCommand="performancepageclicked" CommandArgument='<%# Eval("PerformanceID") %>'>
                                                                            <img src="../Doc/Performance/<%#Eval("PosterFileName") %>" class="shadowedbox" alt="Lights" style="width: 100%; height: 200px;">

                                            <div class="caption" style="padding-bottom:3px;">
                                                <h4 class="contentHeader"><%# (Eval("MainTitle")) .ToString().Length>15?
                                                           (Eval("MainTitle")) .ToString().Substring(0,15)+ " ....":
                                                           (Eval("MainTitle")) .ToString()%></h4>
                                                <h6 class="Contentdisplay"><%= Resources.DisplayText.StartDate %>: <%# DataBinder.Eval(Container.DataItem,"startdate","{0:dd/MM/yyyy}") %></h6>
                                                <%--<h6>venu: <%# Eval("venuname") %></h6>--%>
                                                <h6 class="Contentdisplay"><%= Resources.DisplayText.Location %>: <%# Eval("Regionname") %>/<%# Eval("cityname") %> - <%# Eval("venuname") %></h6>
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
                                <asp:DataPager ID="DataPager1" runat="server" PageSize="8">
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
                <asp:SqlDataSource ID="SqlDataSource1_Performancelist" runat="server" ConnectionString="<%$ ConnectionStrings:AllClassicDBConnectionString %>" SelectCommand="
DECLARE @fooTable table ( lookupid int, Maincode nvarchar(100), subcode  nvarchar(100))

                                                            INSERT INTO @fooTable 
                                                                select lookupid, Maincode, subcode from main.lookuptbl where maincode 
                                                            in ('PerformanceType','Conductor','Composer','Region','City') 


                                                            SELECT  p.*, pg.Name performancegroupname, pt.SubCode performancetype, cd.SubCode conductorname, cm.SubCode composerName, i.KoreanName instrumentname, r.SubCode regionname, c.SubCode cityname, v.Name venuname 
                                                            from Main.PerformanceTbl p
                                                            left join Main.PerformanceGroupTbl pg on p.PerformanceGroup=pg.PerformanceGroupID
                                                            left join Auxiliary.InstrumentTbl i on i.InstrumentID=p.MainInstrument
                                                            left join Auxiliary.VenueTbl v on v.VenueID =p.Venue
                                                            left join @fooTable pt on pt.LookUpID=p.PerformanceType
                                                            left join @fooTable cd on cd.LookUpID=p.Conductor
                                                            left join @fooTable cm on cm.LookUpID=p.MainTitleComposer
                                                            left join @fooTable r on r.LookUpID=p.Region
                                                            left join @fooTable c on c.LookUpID=p.City
order by p.UpdateTimeStamp desc"></asp:SqlDataSource>
            </div>
            <div class="row">
                <hr />
                <asp:Button runat="server" ID="btn_addNewMusician" CssClass="btn btn-success pull-right contentButton" Text="<%$Resources:DisplayText,AddNewData %>" OnClick="onclick_btn_addPG" />
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

    <style>
        .GridViewEditRow input[type=text] {
            display: block;
            width: 100%;
            height: 34px;
            padding: 6px 12px;
            font-size: 14px;
            line-height: 1.428571429;
            color: #555555;
            vertical-align: middle;
            background-color: #ffffff;
            border: 1px solid #cccccc;
            border-radius: 4px;
            -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
            box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
            -webkit-transition: border-color ease-in-out 0.15s, box-shadow ease-in-out 0.15s;
            transition: border-color ease-in-out 0.15s, box-shadow ease-in-out 0.15s;
        }

        .shadowedPanel {
            border: 1px solid transparent;
            border-radius: 4px;
            border-color: #dddddd;
            padding: 1em;
            box-shadow: 2px 2px 2px 2px #f5f5f5;
        }

        .locationcontainer {
            display: inline-block;
            border: 1px solid lightgray;
            padding: 3px;
            margin: 1px;
            border-radius: 3px;
            background-color: white;
        }

        .shadowedbox_hover:hover {
            background-color: white;
            /*box-shadow: 3px 3px 3px #d0d0d0 !important;*/
            /*box-shadow: 5px 5px 5px 3px #d0d0d0 !important;*/
            color: white !important;
            transform: scale(1.04);
            transition: all .3s ease-in-out;
        }

        .locationcontainer:hover {
            background-color: #28878a;
            color: white !important;
            transform: scale(1.04);
        }
    </style>

</asp:Content>
