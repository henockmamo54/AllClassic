<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PerformanceArchiveDB.aspx.cs" Inherits="AllClassicWeb.Views.PerformanceArchiveDB" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel runat="server">
        <ContentTemplate>


            <link href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/css/bootstrap-datetimepicker.css" rel="stylesheet" />
            <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.js"></script>
            <script src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.15.2/moment.min.js"></script>
            <script src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.js"></script>
            <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>


            <div class="row">


                <!-- conbox --------------------------------------->
                <div class="conbox">

                    <h2 style="color: #f2c852;"><%= Resources.DisplayText.ArchiveCenter %> *</h2>

                    <div class="archivelist">
                        <ul>
                            <li><span><%= Resources.DisplayText.MainTitle %></span>
                                <asp:TextBox ID="txt_maintitle" ValidationGroup="a" runat="server" Style="display: inline-block"></asp:TextBox></li>
                            <li><span><%= Resources.DisplayText.SubTitle %></span>
                                <asp:TextBox ID="txt_subtitle" runat="server" Style="display: inline-block"></asp:TextBox></li>
                            <li><span><%= Resources.DisplayText.SubjectTheme %></span>
                                <asp:TextBox ID="txt_subjecttheme" runat="server" Style="display: inline-block"></asp:TextBox></li>
                            <li><span><%= Resources.DisplayText.PerformanceGroup %></span>
                                 
                                    <asp:DropDownList ID="DropDownList1_grouptype" runat="server" DataSourceID="SqlDataSource1_performancegrouplist"
                                        DataTextField="Name" DataValueField="PerformanceGroupID" style="display: inline-block">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource1_performancegrouplist" runat="server"
                                        ConnectionString="<%$ ConnectionStrings:AllClassicDBConnectionString %>"
                                        SelectCommand="SELECT Name='None', PerformanceGroupID=-1  union SELECT Name, PerformanceGroupID FROM Main.PerformanceGroupTbl"></asp:SqlDataSource>

                                 
                            </li>
                            <li><span><%= Resources.DisplayText.PerformanceType %></span>
                                <asp:DropDownList ID="DropDownList1_performancetype" Style="display: inline-block" runat="server" AutoPostBack="false" DataSourceID="SqlDataSource1_performancetypelist" DataTextField="SubCode" DataValueField="LookUpID"></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource1_performancetypelist" runat="server" ConnectionString="<%$ ConnectionStrings:AllClassicDBConnectionString %>" SelectCommand="SELECT LookUpID=-1, MainCode='None', SubCode='None'  union SELECT LookUpID, MainCode, SubCode 
FROM Main.LookUpTbl
where maincode='PerformanceType'
"></asp:SqlDataSource>
                            </li>
                            <li><span><%= Resources.DisplayText.Conductor %></span>
                                <asp:DropDownList ID="DropDownList1_conductors" Style="display: inline-block" runat="server" DataSourceID="SqlDataSource1_conductors" DataTextField="Name" DataValueField="MusicianID"></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource1_conductors" runat="server" ConnectionString="<%$ ConnectionStrings:AllClassicDBConnectionString %>" SelectCommand="SELECT MusicianID= -1, Name='None' UNION SELECT Main.MusicianTbl.MusicianID, Main.MusicianTbl.Name FROM Main.MusicianTbl INNER JOIN Main.LookUpTbl ON Main.MusicianTbl.Major = Main.LookUpTbl.LookUpID WHERE (Main.LookUpTbl.MainCode = 'Conductor')"></asp:SqlDataSource>
                            </li>
                            <li><span><%= Resources.DisplayText.MainTitleComposer %></span>
                                <asp:DropDownList ID="DropDownList1_composer" runat="server" Style="display: inline-block" DataSourceID="SqlDataSource1_composer" DataTextField="Name" DataValueField="MusicianID"></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource1_composer" runat="server" ConnectionString="<%$ ConnectionStrings:AllClassicDBConnectionString %>" SelectCommand="SELECT MusicianID= -1, Name='None' UNION SELECT Main.MusicianTbl.MusicianID, Main.MusicianTbl.Name FROM Main.MusicianTbl INNER JOIN Main.LookUpTbl ON Main.MusicianTbl.Major = Main.LookUpTbl.LookUpID WHERE (Main.LookUpTbl.MainCode = 'Composer')"></asp:SqlDataSource>
                                    
                            </li>
                            <li><span><%= Resources.DisplayText.MainInstrument %></span>
                                <asp:DropDownList ID="DropDownList2_maininstrument" runat="server" Style="display: inline-block" DataSourceID="SqlDataSource1_instrumentlist" DataTextField="KoreanName" DataValueField="InstrumentID"></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource1_instrumentlist" runat="server" ConnectionString="<%$ ConnectionStrings:AllClassicDBConnectionString %>" SelectCommand="
                                SELECT InstrumentID=-1, EnglishName='None', KoreanName='None' union
                                SELECT InstrumentID, EnglishName, KoreanName FROM Auxiliary.InstrumentTbl"></asp:SqlDataSource>
                            </li>
                            <li><span><%= Resources.DisplayText.Organizer %></span>
                                <asp:TextBox ID="txt_organizer" runat="server" Style="display: inline-block"></asp:TextBox>

                            </li>
                            <li><span><%= Resources.DisplayText.Sponser %></span>
                                <asp:TextBox ID="txt_sponser" runat="server" Style="display: inline-block"></asp:TextBox></li>

                            <li><span><%= Resources.DisplayText.Start %></span>
                                <div style="display:inline-block">
                                <div class='input-group date' id='datetimepicker2_start' style="display: flex;">
                                    <input type='text' class="form-control filedDisplay" runat="server" validationgroup="a" id="startdate" style="display: inline-block; border-right-width: 0px;" />
                                    <span class="input-group-addon" style="flex-wrap: wrap; width: auto !important; display: inline-block; padding-left: 12px; margin-left: -5px; padding-top: 9px; padding-bottom: 6px;">
                                        <span class="glyphicon glyphicon-calendar"></span>
                                    </span>
                                </div>

                                </div>

                            </li>
                            <li><span><%= Resources.DisplayText.End %></span>
                                <div style="display:inline-block">
                                <div class='input-group date' id='datetimepicker3_end' style="display: flex;">
                                    <input type='text' class="form-control filedDisplay" validationgroup="a" runat="server" id="enddate" style="display: inline-block; border-right-width: 0px;" />
                                    <span class="input-group-addon" style="flex-wrap: wrap; width: auto; display: inline-block; padding-left: 12px; margin-left: -5px; padding-top: 9px; padding-bottom: 6px;">
                                        <span class="glyphicon glyphicon-calendar"></span>
                                    </span>
                                </div>
                                    </div>
                            </li>
                            <li><span><%= Resources.DisplayText.Region %></span>
                                <asp:DropDownList ID="DropDownList4_region" runat="server" Style="display: inline-block" AutoPostBack="false" DataSourceID="SqlDataSource1_region" DataTextField="SubCode" DataValueField="LookUpID"></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource1_region" runat="server" ConnectionString="<%$ ConnectionStrings:AllClassicDBConnectionString %>" SelectCommand="SELECT LookUpID=-1, MainCode='All', SubCode='All'  union  SELECT LookUpID, MainCode, SubCode 
FROM Main.LookUpTbl
where maincode='Region'
"></asp:SqlDataSource>

                            </li>
                            <li><span><%= Resources.DisplayText.City %></span>
                                <asp:DropDownList ID="DropDownList3_city" runat="server" Style="display: inline-block" AutoPostBack="false" DataSourceID="SqlDataSource1_city" DataTextField="SubCode" DataValueField="LookUpID"></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource1_city" runat="server" ConnectionString="<%$ ConnectionStrings:AllClassicDBConnectionString %>" SelectCommand="SELECT LookUpID=-1, MainCode='All', SubCode='All'  union  SELECT LookUpID, MainCode, SubCode 
FROM Main.LookUpTbl
where maincode='City'
"></asp:SqlDataSource>

                            </li>
                            <li><span><%= Resources.DisplayText.Venue %></span>
                                <asp:DropDownList ID="DropDownList1_venu" runat="server" Style="display: inline-block" AutoPostBack="false" DataSourceID="SqlDataSource1_venu" DataTextField="Name" DataValueField="VenueID"></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource1_venu" runat="server" ConnectionString="<%$ ConnectionStrings:AllClassicDBConnectionString %>" SelectCommand="select VenueID=-1,Name='All' union select VenueID,Name from auxiliary.VenueTbl
"></asp:SqlDataSource>

                            </li>
                        <li class="btn" >
                            <asp:LinkButton runat="server" ID="inquiry" Text="<%$Resources:DisplayText,Inquiry %>" OnClick="filterPerformance" />
                        </li>
                        </ul>

                    </div>

                    <div class="archimglist" >

                    <ul >


                        <asp:ListView runat="server" ID="artistListContainer" DataKeyNames="PerformanceID" DataSourceID="SqlDataSource1_Performancelist" GroupItemCount="4" >

                            <EmptyDataTemplate>
                                <div >
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
                                    <asp:LinkButton runat="server" ID="tumbinallink" OnCommand="performancepageclicked" CommandArgument='<%# Eval("PerformanceID") %>'>

                                    <div class="img">
                                    <img src="../Doc/Performance/<%#Eval("PosterFileName") %>" >
                                </div>

                                    
                                <div class="box">
                                    <div class="name"><%# (Eval("MainTitle")) .ToString().Length>15?
                                                           (Eval("MainTitle")) .ToString().Substring(0,15)+ " ....":
                                                           (Eval("MainTitle")) .ToString()%></div>
                                    <div class="txt">
                                        <%= Resources.DisplayText.StartDate %>: <%# DataBinder.Eval(Container.DataItem,"startdate","{0:dd/MM/yyyy}") %><br />
                                        <%= Resources.DisplayText.Location %>: <%# Eval("Regionname") %>/<%# Eval("cityname") %> - <%# Eval("venuname") %>
                                    </div>
                                </div>
                      

                                    </asp:LinkButton>
                                </li>


                            </ItemTemplate>
                            <LayoutTemplate>
                                <div id="groupPlaceholderContainer" runat="server">

                                    <div id="groupPlaceholder" runat="server">
                                    </div>

                                    <div class="col-lg-12" style="text-align: center; margin-top: 10px; display:block;">
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
                    where p.enddate < getdate() order by p.UpdateTimeStamp desc"></asp:SqlDataSource>
                    </ul>

                        </div>
                </div>
            </div>
            <!-- conbox --------------------------------------->

        </ContentTemplate>
    </asp:UpdatePanel>


    <script type="text/javascript">
        function bindDateTime() {
            $('#datetimepicker2_start').datetimepicker({
                format: 'MM/DD/YYYY'
            });
            $('#datetimepicker3_end').datetimepicker({
                format: 'MM/DD/YYYY'
            });

        }
        $(function () {
            $('#datetimepicker2_start').datetimepicker({
                format: 'MM/DD/YYYY'
            });

            $('#datetimepicker3_end').datetimepicker({
                format: 'MM/DD/YYYY'
            });
        });
    </script>

    <style>
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
        }
    </style>
</asp:Content>
