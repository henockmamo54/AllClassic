<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PerformanceDB.aspx.cs" Inherits="AllClassicWeb.Views.PerformanceDB" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <asp:UpdatePanel runat="server">
        <ContentTemplate>


            <!-- conbox --------------------------------------->
            <div class="conbox">

                <h2>Events</h2>

                <div class="row">

                <div class="section3 ">
                    <div class="section3-1">
                        <div class="day_m">
                            <h3><%=Resources.DisplayText.Schedule_of_the_Month %></h3>
                            <div class="year"><asp:Label runat="server" ID="yearlabel"/></div>
                            <div class="month"><asp:Label runat="server" ID="datelabel"/></div>
                            <div class="arr1">
                                <a href="#">
                                    <img src="../Content/img/day_arr1.png"></a>
                            </div>
                            <div class="arr2">
                                <a href="#">
                                    <img src="../Content/img/day_arr2.png"></a>
                            </div>
                        </div>
                    </div>
                    <div class="section3-2">
                        <div class="day_d">
                            <ul class="dday">
                                <li class="on"><a href="#">01</a></li>
                                <li><a href="#">02</a></li>
                                <li><a href="#">03</a></li>
                                <li><a href="#">04</a></li>
                                <li><a href="#">05</a></li>
                                <li><a href="#">06</a></li>
                                <li><a href="#">07</a></li>
                                <li><a href="#">08</a></li>
                                <li><a href="#">09</a></li>
                                <li><a href="#">10</a></li>
                                <li><a href="#">11</a></li>
                                <li><a href="#">12</a></li>
                                <li><a href="#">13</a></li>
                                <li><a href="#">14</a></li>
                                <li><a href="#">15</a></li>
                                <li><a href="#">16</a></li>
                                <li><a href="#">17</a></li>
                                <li><a href="#">18</a></li>
                                <li><a href="#">19</a></li>
                                <li><a href="#">20</a></li>
                                <li><a href="#">21</a></li>
                                <li><a href="#">22</a></li>
                                <li><a href="#">23</a></li>
                                <li><a href="#">24</a></li>
                                <li><a href="#">25</a></li>
                                <li><a href="#">26</a></li>
                                <li><a href="#">27</a></li>
                                <li><a href="#">28</a></li>
                                <li><a href="#">29</a></li>
                                <li><a href="#">30</a></li>
                                <li><a href="#">31</a></li>
                            </ul>
                            <ul class="dimg">


                                <asp:ListView runat="server" ID="artistListContainer" OnDataBound="artistListContainer_ondatabound" DataKeyNames="PerformanceID" DataSourceID="SqlDataSource1_Performancelist" GroupItemCount="4" Style="width: 100%;">

                                    <EmptyDataTemplate>
                                        <div>
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
                                        <li>
                                            <div>
                                                <asp:LinkButton runat="server" ID="tumbinallink" Style="text-decoration: none;" OnCommand="performancepageclicked" CommandArgument='<%# Eval("PerformanceID") %>'>
                                 <img src="../Doc/Performance/<%#Eval("PosterFileName") %>" class="shadowedbox" alt="Lights" style="width: 100%; height: 200px;">
                                                                                                  
                                                </asp:LinkButton>
                                            </div>
                                        </li>

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
                                <asp:SqlDataSource ID="SqlDataSource1_Performancelist" runat="server" ConnectionString="<%$ ConnectionStrings:AllClassicDBConnectionString %>"
                                    SelectCommand="
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
                                                            left join @fooTable c on c.LookUpID=p.City where p.enddate > getdate()
order by p.UpdateTimeStamp desc"></asp:SqlDataSource>


                            </ul>
                        </div>
                    </div>
                    <div class="more"><a href="#">+</a></div>
                </div>


                <div class="conlist">
                    <div class="row">

                        <ul class="area_btn" style="display: inline-block">
                            <h3 style="display: inline-block"><%=Resources.DisplayText.Region %></h3>
                            <asp:Repeater runat="server" ID="repeater_location" OnItemDataBound="repeater_locationOnItemDataBound" DataSourceID="SqlDataSource1_region">
                                <ItemTemplate>
                                    <li>
                                        <asp:LinkButton runat="server" OnClick="regionclicked" CommandArgument='<%# Eval("subcode") %>' ID='location'
                                            class="locationcontainer " Text='<%# Eval("subcode") %>'></asp:LinkButton>
                                    </li>
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

                        </ul>

                    </div>
                    <div class="row" style="overflow-y: scroll; max-height: 200px;">
                        <table>
                            <thead>
                                <tr>
                                    <th><%= Resources.DisplayText.StartDate %></th>
                                    <th><%= Resources.DisplayText.Title %></th>
                                    <th><%=Resources.DisplayText.Region %>/<%=Resources.DisplayText.City %></th>
                                    <th><%=Resources.DisplayText.Venue %></th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater runat="server" ID="repeater_thisweekPerformanceInfo">
                                    <ItemTemplate>
                                        <tr>
                                            <td scope="row"><%# DataBinder.Eval(Container.DataItem,"StartDate","{0:d/M/yyyy}")  %></td>
                                            <td><%# (Eval("MainTitle")) .ToString().Length>15?
                                                           (Eval("MainTitle")) .ToString().Substring(0,15)+ " ....":
                                                           (Eval("MainTitle")) .ToString()%></td>
                                            <td><%# Eval("LookupTbl1.Subcode") %>/<%# Eval("LookUpTbl2.Subcode") %></td>
                                            <td><%# Eval("VenueTbl.Name") %> </td>
                                        </tr>
                                    </ItemTemplate>
                                    <AlternatingItemTemplate>

                                        <tr>
                                            <td class="td2" scope="row"><%# DataBinder.Eval(Container.DataItem,"StartDate","{0:d/M/yyyy}")  %></td>
                                            <td class="td2"><%# (Eval("MainTitle")) .ToString().Length>15?
                                                           (Eval("MainTitle")) .ToString().Substring(0,15)+ " ....":
                                                           (Eval("MainTitle")) .ToString()%></td>
                                            <td class="td2"><%# Eval("LookupTbl1.Subcode") %>/<%# Eval("LookUpTbl2.Subcode") %></td>
                                            <td class="td2"><%# Eval("VenueTbl.Name") %> </td>
                                        </tr>
                                    </AlternatingItemTemplate>
                                </asp:Repeater>
                            </tbody>
                        </table>
                    </div>

                </div>

                </div>

            <div class="row">  
                <br />
                <asp:Button runat="server" ID="btn_addNewMusician" CssClass="btn btn-success pull-right contentButton" Text="<%$Resources:DisplayText,AddNewData %>" OnClick="onclick_btn_addPG" />
            </div>

            </div>

            <!-- conbox --------------------------------------->



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
