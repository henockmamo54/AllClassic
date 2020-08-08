<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="AllClassicWeb._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <asp:UpdatePanel runat="server">
        <ContentTemplate>


            <div class="banner">

                <div id="myCarousel" class="carousel slide" data-ride="carousel">
                    <!-- Indicators -->
                    <ol class="carousel-indicators">
                        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                        <li data-target="#myCarousel" data-slide-to="1"></li>
                        <li data-target="#myCarousel" data-slide-to="2"></li>
                    </ol>

                    <!-- Wrapper for slides -->
                    <div class="carousel-inner">
                        <div class="item active">
                            <img src="Content/img/banner/banner1.jpg" />
                        </div>

                        <div class="item">
                            <img src="Content/img/banner/banner2.png" />
                        </div>

                        <div class="item">
                            <img src="Content/img/banner/banner3.jpg" />
                        </div>
                    </div>

                    <!-- Left and right controls -->
                    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="right carousel-control" href="#myCarousel" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>

            </div>

            <div class="section1">

                <ul class="tab">
                    <li class="tablinks on" onclick="openTab(event, 'ConcleInformation')"><a><%=Resources.DisplayText.ConcleInformation %></a></li>
                    <li class="tablinks" onclick="openTab(event, 'Auditions')"><a><%=Resources.DisplayText.Auditions %></a></li>
                    <li class="tablinks" onclick="openTab(event, 'Jobsearch')"><a><%=Resources.DisplayText.Jobsearch %></a></li>
                    <li class="tablinks" onclick="openTab(event, 'QA')"><a><%=Resources.DisplayText.QA %></a></li>
                </ul>

                <div id="ConcleInformation" class="tabcontent">

                    <asp:SqlDataSource ID="SqlDataSource1_getrecent20artists" runat="server" ConnectionString="<%$ ConnectionStrings:AllClassicDBConnectionString %>" SelectCommand="
select top 5 a.*, u.FullName userName, U.EmailID  from Auxiliary.ConcourTbl a
                    join Main.UserTbl u on u.UserID=a.UserID
order by UpdateTimeStamp desc"></asp:SqlDataSource>
                    <ul class="list">
                        <asp:Repeater runat="server" ID="artistPageRepeater" DataSourceID="SqlDataSource1_getrecent20artists">

                            <ItemTemplate>
                                <li>
                                    <a href="Views/ConcoursDB.aspx"><%# Eval("Title") %></a>
                                </li>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ul>
                </div>

                <div id="Auditions" class="tabcontent" style="display: none;">
                    <asp:SqlDataSource ID="SqlDataSource1_audition" runat="server" ConnectionString="<%$ ConnectionStrings:AllClassicDBConnectionString %>" SelectCommand="
select top 5 a.*, u.FullName userName, u.EmailID from Auxiliary.AuditionTbl a
                    join Main.UserTbl u on u.UserID=a.UserID
order by UpdateTimeStamp desc"></asp:SqlDataSource>

                    <ul class="list">

                        <asp:Repeater runat="server" ID="Repeater1_audition" DataSourceID="SqlDataSource1_audition">
                            <ItemTemplate>
                                <li>
                                    <a href="Views/AuditionDB.aspx"><%# Eval("Title") %></a>
                                </li>
                            </ItemTemplate>

                        </asp:Repeater>
                    </ul>
                </div>

                <div id="Jobsearch" class="tabcontent" style="display: none;">
                    <asp:SqlDataSource ID="SqlDataSource1_Jobsearch" runat="server" ConnectionString="<%$ ConnectionStrings:AllClassicDBConnectionString %>" SelectCommand="
select top 5 p.*, c.subcode as cityname, u.FullName userName,U.EmailID as useremailid from Auxiliary.PeopleAndJobTbl p
            left join (
            SELECT LookUpID, MainCode, SubCode 
FROM Main.LookUpTbl
where maincode='City'
            ) c on c.LookUpID=p.city
        left  join Main.UserTbl u on u.UserID=p.UserID
order by UpdateTimeStamp desc"></asp:SqlDataSource>

                    <ul class="list">
                        <asp:Repeater runat="server" ID="Repeater1_Jobsearch" DataSourceID="SqlDataSource1_Jobsearch">

                            <ItemTemplate>
                                <li>
                                    <a href="Views/PeopleAndJobDB.aspx"><%# Eval("Title") %></a>
                                </li>
                            </ItemTemplate>
                        </asp:Repeater>

                    </ul>

                </div>

                <div id="QA" class="tabcontent" style="display: none;">
                    <asp:SqlDataSource ID="SqlDataSource1_qalist" runat="server" ConnectionString="<%$ ConnectionStrings:AllClassicDBConnectionString %>" SelectCommand="
select top 5 p.*, u.EmailID as posterEmailID from Auxiliary.QuestionsTbl p
left join main.usertbl u on p.userID= u.userid            
order by timestamp desc"></asp:SqlDataSource>
                    <ul class="list">
                        <asp:Repeater runat="server" ID="Repeater1_qa" DataSourceID="SqlDataSource1_qalist">

                            <ItemTemplate>
                                <li>
                                    <a href="Views/QADbNew.aspx"><%#Eval("Question") %></a>
                                </li>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ul>
                </div>

            </div>

            <div class="section2">
                <div class="section2-1">
                    <h2>클래식음악 소식</h2>
                    <div class="txt">
                        <a href="#">서산시, 수준 높은 공연문화 유치로 고품격 문화도시 조성
                <br />
                            <span>2018-05-08</span></a>
                    </div>
                    <div class="img">
                        <a href="#">
                            <img src="../Content/img/news.jpg"></a>
                    </div>
                    <div class="more"><a href="#">+</a></div>
                </div>
                <div class="section2-2">
                    <h2>팝업존</h2>
                    <div class="img">
                        <a href="#">
                            <img src="../Content/img/popup.jpg"></a>
                    </div>
                    <div class="more"><a href="#">+</a></div>
                </div>
            </div>

            <div class="section3">
                <h2><%=Resources.DisplayText.Performanceschedule %></h2>
                <div class="section3-1">
                    <div class="day_m">
                        <h3><%=Resources.DisplayText.Schedule_of_the_Month %></h3>
                        <div class="year">
                            <asp:Label runat="server" ID="yearlabel" /></div>
                        <div class="month">
                            <asp:Label runat="server" ID="datelabel" /></div>
                        <div class="arr1">

                             <asp:LinkButton CommandArgument="-" runat="server" OnCommand="dateselectorArrow_SelectionChanged" >
                                 <%--<img runat="server" src="../Content/img/day_arr1.png">--%>
                                     <asp:ImageButton runat="server" ImageUrl="../Content/img/day_arr1.png"  CommandArgument="-" OnCommand="dateselectorArrow_SelectionChanged" />
                            </asp:LinkButton>
                             
                        </div>
                        <div class="arr2">
                            <asp:LinkButton CommandArgument="+" runat="server" OnCommand="dateselectorArrow_SelectionChanged" >
                                    <%--<img src="../Content/img/day_arr2.png">--%>
                                <asp:ImageButton runat="server" ImageUrl="../Content/img/day_arr2.png"  CommandArgument="+" OnCommand="dateselectorArrow_SelectionChanged" />

                            </asp:LinkButton>
                        </div>
                    </div>
                </div>

                <div class="section3-2">
                    <div class="day_d">
                        <ul class="dday">
                            <li id="date01" runat="server">
                                <asp:LinkButton CommandArgument="01" runat="server" OnCommand="dateselectorcalendar_SelectionChanged">01</asp:LinkButton></li>
                            <li id="date02" runat="server">
                                <asp:LinkButton CommandArgument="02" runat="server" OnCommand="dateselectorcalendar_SelectionChanged">02</asp:LinkButton></li>
                            <li id="date03" runat="server">
                                <asp:LinkButton CommandArgument="03" runat="server" OnCommand="dateselectorcalendar_SelectionChanged">03</asp:LinkButton></li>
                            <li id="date04" runat="server">
                                <asp:LinkButton CommandArgument="04" runat="server" OnCommand="dateselectorcalendar_SelectionChanged">04</asp:LinkButton></li>
                            <li id="date05" runat="server">
                                <asp:LinkButton CommandArgument="05" runat="server" OnCommand="dateselectorcalendar_SelectionChanged">05</asp:LinkButton></li>
                            <li id="date06" runat="server">
                                <asp:LinkButton CommandArgument="06" runat="server" OnCommand="dateselectorcalendar_SelectionChanged">06</asp:LinkButton></li>
                            <li id="date07" runat="server">
                                <asp:LinkButton CommandArgument="07" runat="server" OnCommand="dateselectorcalendar_SelectionChanged">07</asp:LinkButton></li>
                            <li id="date08" runat="server">
                                <asp:LinkButton CommandArgument="08" runat="server" OnCommand="dateselectorcalendar_SelectionChanged">08</asp:LinkButton></li>
                            <li id="date09" runat="server">
                                <asp:LinkButton CommandArgument="09" runat="server" OnCommand="dateselectorcalendar_SelectionChanged">09</asp:LinkButton></li>
                            <li id="date10" runat="server">
                                <asp:LinkButton CommandArgument="10" runat="server" OnCommand="dateselectorcalendar_SelectionChanged">10</asp:LinkButton></li>
                            <li id="date11" runat="server">
                                <asp:LinkButton CommandArgument="11" runat="server" OnCommand="dateselectorcalendar_SelectionChanged">11</asp:LinkButton></li>
                            <li id="date12" runat="server">
                                <asp:LinkButton CommandArgument="12" runat="server" OnCommand="dateselectorcalendar_SelectionChanged">12</asp:LinkButton></li>
                            <li id="date13" runat="server">
                                <asp:LinkButton CommandArgument="13" runat="server" OnCommand="dateselectorcalendar_SelectionChanged">13</asp:LinkButton></li>
                            <li id="date14" runat="server">
                                <asp:LinkButton CommandArgument="14" runat="server" OnCommand="dateselectorcalendar_SelectionChanged">14</asp:LinkButton></li>
                            <li id="date15" runat="server">
                                <asp:LinkButton CommandArgument="15" runat="server" OnCommand="dateselectorcalendar_SelectionChanged">15</asp:LinkButton></li>
                            <li id="date16" runat="server">
                                <asp:LinkButton CommandArgument="16" runat="server" OnCommand="dateselectorcalendar_SelectionChanged">16</asp:LinkButton></li>
                            <li id="date17" runat="server">
                                <asp:LinkButton CommandArgument="17" runat="server" OnCommand="dateselectorcalendar_SelectionChanged">17</asp:LinkButton></li>
                            <li id="date18" runat="server">
                                <asp:LinkButton CommandArgument="18" runat="server" OnCommand="dateselectorcalendar_SelectionChanged">18</asp:LinkButton></li>
                            <li id="date19" runat="server">
                                <asp:LinkButton CommandArgument="19" runat="server" OnCommand="dateselectorcalendar_SelectionChanged">19</asp:LinkButton></li>
                            <li id="date20" runat="server">
                                <asp:LinkButton CommandArgument="20" runat="server" OnCommand="dateselectorcalendar_SelectionChanged">20</asp:LinkButton></li>
                            <li id="date21" runat="server">
                                <asp:LinkButton CommandArgument="21" runat="server" OnCommand="dateselectorcalendar_SelectionChanged">21</asp:LinkButton></li>
                            <li id="date22" runat="server">
                                <asp:LinkButton CommandArgument="22" runat="server" OnCommand="dateselectorcalendar_SelectionChanged">22</asp:LinkButton></li>
                            <li id="date23" runat="server">
                                <asp:LinkButton CommandArgument="23" runat="server" OnCommand="dateselectorcalendar_SelectionChanged">23</asp:LinkButton></li>
                            <li id="date24" runat="server">
                                <asp:LinkButton CommandArgument="24" runat="server" OnCommand="dateselectorcalendar_SelectionChanged">24</asp:LinkButton></li>
                            <li id="date25" runat="server">
                                <asp:LinkButton CommandArgument="25" runat="server" OnCommand="dateselectorcalendar_SelectionChanged">25</asp:LinkButton></li>
                            <li id="date26" runat="server">
                                <asp:LinkButton CommandArgument="26" runat="server" OnCommand="dateselectorcalendar_SelectionChanged">26</asp:LinkButton></li>
                            <li id="date27" runat="server">
                                <asp:LinkButton CommandArgument="27" runat="server" OnCommand="dateselectorcalendar_SelectionChanged">27</asp:LinkButton></li>
                            <li id="date28" runat="server">
                                <asp:LinkButton CommandArgument="28" runat="server" OnCommand="dateselectorcalendar_SelectionChanged">28</asp:LinkButton></li>
                            <li id="date29" runat="server">
                                <asp:LinkButton CommandArgument="29" runat="server" OnCommand="dateselectorcalendar_SelectionChanged">29</asp:LinkButton></li>
                            <li id="date30" runat="server">
                                <asp:LinkButton CommandArgument="30" runat="server" OnCommand="dateselectorcalendar_SelectionChanged">30</asp:LinkButton></li>
                            <li id="date31" runat="server">
                                <asp:LinkButton CommandArgument="31" runat="server" OnCommand="dateselectorcalendar_SelectionChanged">31</asp:LinkButton></li>
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
                                                            left join @fooTable c on c.LookUpID=p.City where p.enddate > getdate()
order by p.UpdateTimeStamp desc"></asp:SqlDataSource>


                        </ul>
                    </div>
                </div>
                <div class="more"><a href="#">+</a></div>
            </div>

            <script>

                function openTab(evt, cityName) {

                    var i, tabcontent, tablinks;
                    tabcontent = document.getElementsByClassName("tabcontent");
                    for (i = 0; i < tabcontent.length; i++) {
                        tabcontent[i].style.display = "none";
                    }
                    tablinks = document.getElementsByClassName("tablinks");
                    for (i = 0; i < tablinks.length; i++) {
                        tablinks[i].className = tablinks[i].className.replace(" on", "");
                    }
                    document.getElementById(cityName).style.display = "block";
                    evt.currentTarget.className += " on";
                }
            </script>


        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
