<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="AllClassicWeb._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

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
                    <asp:Label runat="server" ID="yearlabel" />
                </div>
                <div class="month">
                    <asp:Label runat="server" ID="datelabel" />
                </div>
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

</asp:Content>
