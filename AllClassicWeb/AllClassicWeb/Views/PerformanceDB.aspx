<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PerformanceDB.aspx.cs" Inherits="AllClassicWeb.Views.PerformanceDB" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <div class="row col-md-12 col-xs-12 ">
                <div class="col-md-3 col-xs-3">
                    <asp:Calendar runat="server" ID="dateselectorcalendar" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="140px" NextPrevFormat="FullMonth" Width="140px" OnSelectionChanged="dateselectorcalendar_SelectionChanged">
                        <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                        <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                        <OtherMonthDayStyle ForeColor="#999999" />
                        <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                        <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="0px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                        <TodayDayStyle BackColor="#CCCCCC" />
                    </asp:Calendar>
                </div>
                <div class="col-md-6 col-xs-6 " style="padding: 0;">
                    <div class="shadowedPanel">
                        <h5 style="color: #3c83f1;margin-bottom: 0px;">Performance schedule: This week</h5>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">Start Date</th>
                                    <th scope="col">Title</th>
                                    <th scope="col">Area/City</th>
                                    <th scope="col">Venu</th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater runat="server" ID="repeater_thisweekPerformanceInfo">
                                    <ItemTemplate>
                                        <tr>
                                            <th scope="row"><%# DataBinder.Eval(Container.DataItem,"StartDate","{0:d/M/yyyy}")  %></th>
                                            <td><%# (Eval("MainTitle")) .ToString().Length>15?
                                                           (Eval("MainTitle")) .ToString().Substring(0,15)+ " ....":
                                                           (Eval("MainTitle")) .ToString()%></td>
                                            <td><%# Eval("LookupTbl1.Subcode") %>/<%# Eval("LookUpTbl2.Subcode") %> </td>
                                            <td><%# Eval("VenueTbl.Name") %> </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="col-md-3 ">
                    <h4>Area</h4>
                    <asp:Repeater runat="server" ID="repeater_location" OnItemDataBound="repeater_locationOnItemDataBound">
                        <ItemTemplate>
                            <asp:Button runat="server" CommandArgument='<%# Eval("Location") %>' ID='location' class="locationcontainer" Text='<%# Eval("Location") %>'></asp:Button>
                        </ItemTemplate>
                    </asp:Repeater>

                </div>
            </div>

            <br />
            <h4 style="color: #3c83f1;">Total:
                            <asp:Label runat="server" ID="label_countofitems"></asp:Label>
                Events </h4>

            <hr style="margin-top: 0px;" />
            <div class="row">
                <asp:ListView runat="server" ID="artistListContainer" DataKeyNames="PerformanceID" DataSourceID="SqlDataSource1_Performancelist" GroupItemCount="4" Style="width: 100%;">

                    <GroupTemplate>
                        <div id="itemPlaceholderContainer" runat="server">
                            <div id="itemPlaceholder" runat="server">
                            </div>
                        </div>
                    </GroupTemplate>
                    <ItemTemplate>
                        <div class="col-md-3 col-xs-3" style="margin-bottom: 1em;">
                            <div class="thumbnail shadowedbox" style="box-shadow: 2px 2px 2px #d0d0d0;">
                                <asp:LinkButton runat="server" ID="tumbinallink" Style="text-decoration: none;">
                                            <img src="../Doc/Performance/<%#Eval("PosterFileName") %>" class="shadowedbox" alt="Lights" style="width: 100%; height: 150px;">

                                            <div class="caption" style="padding-bottom:3px;">
                                                <h4><%# (Eval("MainTitle")) .ToString().Length>15?
                                                           (Eval("MainTitle")) .ToString().Substring(0,15)+ " ....":
                                                           (Eval("MainTitle")) .ToString()%></h4>
                                                <h6>start date: <%# DataBinder.Eval(Container.DataItem,"startdate","{0:dd/MM/yyyy}") %></h6>
                                                <h6>venu: <%# Eval("venuname") %></h6>
                                                <h6>Location: <%# Eval("Regionname") %> - <%# Eval("cityname") %></h6>
                                                <h6>... see More</h6>                                              
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
                <asp:SqlDataSource ID="SqlDataSource1_Performancelist" runat="server" ConnectionString="<%$ ConnectionStrings:AllClassicDBConnectionString %>" SelectCommand="
select p.*, pg.Name performancegroupname, pt.SubCode performancetype, cd.SubCode conductorname, cm.SubCode composerName, i.KoreanName instrumentname, r.SubCode regionname, c.SubCode cityname, v.Name venuname 
from Main.PerformanceTbl p
left join Main.PerformanceGroupTbl pg on p.PerformanceGroup=pg.PerformanceGroupID
left join (select lookupid, Maincode, subcode from main.lookuptbl where maincode='PerformanceType') pt on pt.LookUpID=p.PerformanceType
left join (select lookupid, Maincode, subcode from main.lookuptbl where maincode='Conductor') cd on cd.LookUpID=p.Conductor
left join (select lookupid, Maincode, subcode from main.lookuptbl where maincode='Composer') cm on cm.LookUpID=p.MainTitleComposer
left join Auxiliary.InstrumentTbl i on i.InstrumentID=p.MainInstrument
left join (select lookupid, Maincode, subcode from main.lookuptbl where maincode='Region') r on cm.LookUpID=p.Region
left join (select lookupid, Maincode, subcode from main.lookuptbl where maincode='City') c on cm.LookUpID=p.City
left join Auxiliary.VenueTbl v on v.VenueID =p.Venue
order by p.UpdateTimeStamp desc"></asp:SqlDataSource>
            </div>
            <div class="row">
                <hr />
                <asp:Button runat="server" ID="btn_addNewMusician" CssClass="btn btn-success pull-right" Text="<%$Resources:DisplayText,AddNewData %>" OnClick="onclick_btn_addPG" />
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
