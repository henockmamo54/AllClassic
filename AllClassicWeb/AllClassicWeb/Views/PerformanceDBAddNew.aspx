<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PerformanceDBAddNew.aspx.cs" Inherits="AllClassicWeb.Views.PerformanceDBAddNew" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <link href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/css/bootstrap-datetimepicker.css" rel="stylesheet" />
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.15.2/moment.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>


    <h4 runat="server" id="headerlabelcontainer"><%= Resources.DisplayText.NewDataInputScreen %></h4>
    <hr style="margin-top: 0px;" />
    <div id="dataentryform" class="row">
        <asp:UpdatePanel runat="server">
            <ContentTemplate>

                <div class="col-xs-6">
                    <div class="col-md-12 col-xs-12 userregisterinfo">
                        <br />
                        <div class="col-md-4 col-xs-4"><%= Resources.DisplayText.MainTitle %>*</div>
                        <div class="col-md-8 col-xs-8">
                            <asp:TextBox ID="txt_maintitle" ValidationGroup="a" runat="server" class="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator Display="Dynamic" runat="server" ForeColor="IndianRed" ValidationGroup="a" Font-Bold="true" ID="RequiredFieldValidator1" ControlToValidate="txt_maintitle" ErrorMessage="<%$Resources:DisplayText,PleaseEnterMainTitle %>" />

                        </div>
                        <br />
                    </div>

                    <div class="col-md-12 col-xs-12 userregisterinfo">
                        <br />
                        <div class="col-md-4 col-xs-4"><%= Resources.DisplayText.SubTitle %></div>
                        <div class="col-md-8 col-xs-8">
                            <asp:TextBox ID="txt_subtitle" runat="server" class="form-control"></asp:TextBox>

                        </div>
                        <br />
                    </div>

                    <div class="col-md-12 col-xs-12 userregisterinfo">
                        <br />
                        <div class="col-md-4 col-xs-4"><%= Resources.DisplayText.SubjectTheme %></div>
                        <div class="col-md-8 col-xs-8">
                            <asp:TextBox ID="txt_subjecttheme" runat="server" class="form-control"></asp:TextBox>

                        </div>
                        <br />
                    </div>

                    <div class="col-md-12 col-xs-12 userregisterinfo">
                        <br />
                        <div class="col-md-4 col-xs-4"><%= Resources.DisplayText.PerformanceGroup %>*</div>
                        <div class="col-md-8 col-xs-8">
                            <%--<asp:TextBox ID="TextBox3" runat="server" class="form-control"></asp:TextBox>--%>
                            <asp:DropDownList ID="DropDownList1_grouptype" runat="server" class="form-control" DataSourceID="SqlDataSource1_performancegrouplist" DataTextField="Name" DataValueField="PerformanceGroupID"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1_performancegrouplist" runat="server" ConnectionString="<%$ ConnectionStrings:AllClassicDBConnectionString %>" SelectCommand="SELECT Name, PerformanceGroupID FROM Main.PerformanceGroupTbl"></asp:SqlDataSource>

                        </div>
                        <br />
                    </div>

                    <div class="col-md-12 col-xs-12 userregisterinfo">
                        <br />
                        <div class="col-md-4 col-xs-4"><%= Resources.DisplayText.PerformanceType %>*</div>
                        <div class="col-md-8 col-xs-8">
                            <%-- <asp:TextBox ID="TextBox4" runat="server" class="form-control"></asp:TextBox>--%>
                            <asp:DropDownList ID="DropDownList1_performancetype" runat="server" class="form-control" AutoPostBack="false" DataSourceID="SqlDataSource1_performancetypelist" DataTextField="SubCode" DataValueField="LookUpID"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1_performancetypelist" runat="server" ConnectionString="<%$ ConnectionStrings:AllClassicDBConnectionString %>" SelectCommand="SELECT LookUpID, MainCode, SubCode 
FROM Main.LookUpTbl
where maincode='PerformanceType'
"></asp:SqlDataSource>
                        </div>
                        <br />
                    </div>

                    <div class="col-md-12 col-xs-12 userregisterinfo">
                        <br />
                        <div class="col-md-4 col-xs-4"><%= Resources.DisplayText.Conductor %></div>
                        <div class="col-md-8 col-xs-8">
                            <asp:DropDownList ID="DropDownList1_conductors" runat="server" class="form-control" DataSourceID="SqlDataSource1_conductors" DataTextField="Name" DataValueField="MusicianID"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1_conductors" runat="server" ConnectionString="<%$ ConnectionStrings:AllClassicDBConnectionString %>" SelectCommand="SELECT Main.MusicianTbl.MusicianID, Main.MusicianTbl.Name FROM Main.MusicianTbl INNER JOIN Main.LookUpTbl ON Main.MusicianTbl.Major = Main.LookUpTbl.LookUpID WHERE (Main.LookUpTbl.MainCode = 'Conductor')"></asp:SqlDataSource>
                        </div>
                        <br />
                    </div>

                    <div class="col-md-12 col-xs-12 userregisterinfo">
                        <br />
                        <div class="col-md-4 col-xs-4"><%= Resources.DisplayText.MainTitleComposer %></div>
                        <div class="col-md-8 col-xs-8">
                            <asp:DropDownList ID="DropDownList1_composer" runat="server" class="form-control" DataSourceID="SqlDataSource1_composer" DataTextField="Name" DataValueField="MusicianID"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1_composer" runat="server" ConnectionString="<%$ ConnectionStrings:AllClassicDBConnectionString %>" SelectCommand="SELECT Main.MusicianTbl.MusicianID, Main.MusicianTbl.Name FROM Main.MusicianTbl INNER JOIN Main.LookUpTbl ON Main.MusicianTbl.Major = Main.LookUpTbl.LookUpID WHERE (Main.LookUpTbl.MainCode = 'Composer')"></asp:SqlDataSource>

                        </div>
                        <br />
                    </div>

                    <div class="col-md-12 col-xs-12 userregisterinfo">
                        <br />
                        <div class="col-md-4 col-xs-4"><%= Resources.DisplayText.MainInstrument %></div>
                        <div class="col-md-8 col-xs-8">
                            <%--<asp:TextBox ID="TextBox7" runat="server" class="form-control"></asp:TextBox>--%>
                            <asp:DropDownList ID="DropDownList2_maininstrument" runat="server" class="form-control" DataSourceID="SqlDataSource1_instrumentlist" DataTextField="KoreanName" DataValueField="InstrumentID"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1_instrumentlist" runat="server" ConnectionString="<%$ ConnectionStrings:AllClassicDBConnectionString %>" SelectCommand="
                                SELECT InstrumentID=-1, EnglishName='None', KoreanName='None' union
                                SELECT InstrumentID, EnglishName, KoreanName FROM Auxiliary.InstrumentTbl"></asp:SqlDataSource>
                        </div>
                        <br />
                    </div>

                    <div class="col-md-12 col-xs-12 userregisterinfo">
                        <br />
                        <div class="col-md-4 col-xs-4"><%= Resources.DisplayText.Organizer %></div>
                        <div class="col-md-8 col-xs-8">
                            <asp:TextBox ID="txt_organizer" runat="server" class="form-control"></asp:TextBox>

                        </div>
                        <br />
                    </div>

                    <div class="col-md-12 col-xs-12 userregisterinfo">
                        <br />
                        <div class="col-md-4 col-xs-4"><%= Resources.DisplayText.Sponser %></div>
                        <div class="col-md-8 col-xs-8">
                            <asp:TextBox ID="txt_sponser" runat="server" class="form-control"></asp:TextBox>

                        </div>
                        <br />
                    </div>

                    <div class="col-md-12 col-xs-12 userregisterinfo">
                        <br />
                        <div class="col-md-4 col-xs-4"><%= Resources.DisplayText.Language %></div>
                        <div class="col-md-8 col-xs-8">
                            <asp:TextBox ID="txt_language" runat="server" class="form-control"></asp:TextBox>

                        </div>
                        <br />
                    </div>


                    <div class="row col-md-12 col-xs-12">
                        <hr />
                        <div class="col-md-4 col-xs-4">
                            Instrument:
                        <asp:DropDownList ID="DropDownList3_instrumentlist" class="form-control" runat="server" DataSourceID="SqlDataSource1_Instrumentlist2" DataTextField="KoreanName" DataValueField="InstrumentID"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1_Instrumentlist2" runat="server" ConnectionString="<%$ ConnectionStrings:AllClassicDBConnectionString %>" SelectCommand="SELECT InstrumentID, EnglishName, KoreanName FROM Auxiliary.InstrumentTbl"></asp:SqlDataSource>
                        </div>
                        <div class="col-md-4 col-xs-4">
                            Played by:
                        <asp:DropDownList ID="DropDownList2_artistlist" class="form-control" runat="server" DataSourceID="SqlDataSource1_artistlist" DataTextField="Name" DataValueField="MusicianID"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1_artistlist" runat="server" ConnectionString="<%$ ConnectionStrings:AllClassicDBConnectionString %>" SelectCommand="SELECT  MusicianID, Name  FROM Main.MusicianTbl"></asp:SqlDataSource>
                        </div>
                        <div class="col-md-3">
                            <br />
                            <%--OnClick="btn_add_ArtistInstrument_tolist"--%>
                            <asp:Button ID="btn_addArtistInstrumentcomb" CssClass="btn btn-success" runat="server" Text="Add" OnClick="onclick_btn_addArtistInstrumentcomb" />
                        </div>

                    </div>

                    <div class="row col-md-12 col-xs-12">
                        <hr />
                        <asp:Repeater runat="server" ID="myPerformanceDetailArtistInstrumentlist">
                            <ItemTemplate>
                                <tr style="margin-bottom: 3px;">

                                    <td>
                                        <asp:Button runat="server" AutoPostBack="True" CssClass="btn btn-warning" CommandArgument='<%#Eval("MusicianID")+","+ Eval("InstrumentID")%>' Text="Delete" OnClick="btn_remove_ArtistInstrument_tolist"></asp:Button>
                                    </td>

                                    <td>
                                        <asp:Label runat="server" ID="Label1" Text='<%# Eval("MusicianTbl.Name") %>' />
                                        - 
                                    </td>
                                    <td>
                                        <asp:Label runat="server" ID="Label2" Text='<%# Eval("InstrumentTbl.KoreanName") %>' />
                                    </td>

                                </tr>
                                <br />
                                <br />
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>



                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <div class="col-xs-6">
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <div class="col-xs-12" style="padding: 0px;">
                        <div class="col-xs-6">
                            <div class="col-md-12 col-xs-12 userregisterinfo" style="padding: 0px;">
                                <br />
                                <div class="col-md-4 col-xs-4" style="padding-left: 0px;"><%= Resources.DisplayText.Start %>*</div>
                                <div class="col-md-8 col-xs-8" style="padding: 0px;">
                                    <%--<asp:TextBox ID="TextBox11" runat="server" class="form-control"></asp:TextBox>--%>
                                    <div class='input-group date' id='datetimepicker2_start' style="display: flex;">
                                        <input type='text' class="form-control" runat="server"  ValidationGroup="a"  id="startdate" style="display: inline-block; border-right-width: 0px;" />
                                        <span class="input-group-addon" style="flex-wrap: wrap; width: auto; display: inline-block; padding-left: 12px; margin-left: -5px; padding-top: 9px; padding-bottom: 6px;">
                                            <span class="glyphicon glyphicon-calendar"></span>
                                        </span>
                                    </div>
                                    <asp:RequiredFieldValidator Display="Dynamic" runat="server" ForeColor="IndianRed" ValidationGroup="a" Font-Bold="true" ID="RequiredFieldValidator2" ControlToValidate="startdate" ErrorMessage="<%$Resources:DisplayText,PleaseEnterStartDate %>" />
                                        
                                </div>
                                <br />
                            </div>
                        </div>
                        <div class="col-xs-6">
                            <div class="col-md-12 col-xs-12 userregisterinfo" style="padding: 0px;">
                                <br />
                                <div class="col-md-4 col-xs-4" style="padding-left: 0px;"><%= Resources.DisplayText.End %>*</div>
                                <div class="col-md-8 col-xs-8" style="padding: 0px;">
                                    <%--<asp:TextBox ID="TextBox12" runat="server" class="form-control"></asp:TextBox>--%>
                                    <div class='input-group date' id='datetimepicker3_end' style="display: flex;">
                                        <input type='text' class="form-control"  ValidationGroup="a"  runat="server" id="enddate" style="display: inline-block; border-right-width: 0px;" />
                                        <span class="input-group-addon" style="flex-wrap: wrap; width: auto; display: inline-block; padding-left: 12px; margin-left: -5px; padding-top: 9px; padding-bottom: 6px;">
                                            <span class="glyphicon glyphicon-calendar"></span>
                                        </span>
                                    </div>
                                    
                                    <asp:RequiredFieldValidator Display="Dynamic" runat="server" ForeColor="IndianRed" ValidationGroup="a" Font-Bold="true" ID="RequiredFieldValidator3" ControlToValidate="enddate" ErrorMessage="<%$Resources:DisplayText,PleaseEnterEndDate %>" />
                                        
                                </div>
                                <br />
                            </div>
                        </div>
                    </div>

                    <div class="col-xs-12" style="padding: 0px;">
                        <div class="col-xs-6">
                            <div class="col-md-12 col-xs-12 userregisterinfo" style="padding: 0px;">
                                <br />
                                <div class="col-md-4 col-xs-4" style="padding-left: 0px;"><%= Resources.DisplayText.Time %>*</div>
                                <div class="col-md-8 col-xs-8" style="padding: 0px;">
                                    <asp:TextBox ID="txt_time"  ValidationGroup="a"  runat="server" class="form-control"></asp:TextBox>
                                     <asp:RequiredFieldValidator Display="Dynamic" runat="server" ForeColor="IndianRed" ValidationGroup="a" Font-Bold="true" ID="RequiredFieldValidator4" ControlToValidate="txt_time" ErrorMessage="<%$Resources:DisplayText,PleaseEnterTime %>" />

                                </div>
                                <br />
                            </div>
                        </div>
                        <div class="col-xs-6">
                            <div class="col-md-12 col-xs-12 userregisterinfo" style="padding: 0px;">
                                <br />
                                <div class="col-md-4 col-xs-4" style="padding-left: 0px;"><%= Resources.DisplayText.Region %>*</div>
                                <div class="col-md-8 col-xs-8" style="padding: 0px;">
                                    <asp:DropDownList ID="DropDownList4_region" runat="server" class="form-control" AutoPostBack="false" DataSourceID="SqlDataSource1_region" DataTextField="SubCode" DataValueField="LookUpID"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource1_region" runat="server" ConnectionString="<%$ ConnectionStrings:AllClassicDBConnectionString %>" SelectCommand="SELECT LookUpID, MainCode, SubCode 
FROM Main.LookUpTbl
where maincode='Region'
"></asp:SqlDataSource>
                                </div>
                                <br />
                            </div>
                        </div>
                    </div>

                    <div class="col-xs-12" style="padding: 0px;">
                        <div class="col-xs-6">
                            <div class="col-md-12 col-xs-12 userregisterinfo" style="padding: 0px;">
                                <br />
                                <div class="col-md-4 col-xs-4" style="padding-left: 0px;"><%= Resources.DisplayText.City %>*</div>
                                <div class="col-md-8 col-xs-8" style="padding: 0px;">
                                    <asp:DropDownList ID="DropDownList3_city" runat="server" class="form-control" AutoPostBack="false" DataSourceID="SqlDataSource1_city" DataTextField="SubCode" DataValueField="LookUpID"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource1_city" runat="server" ConnectionString="<%$ ConnectionStrings:AllClassicDBConnectionString %>" SelectCommand="SELECT LookUpID, MainCode, SubCode 
FROM Main.LookUpTbl
where maincode='City'
"></asp:SqlDataSource>
                                </div>
                                <br />
                            </div>
                        </div>
                        <div class="col-xs-6">
                            <div class="col-md-12 col-xs-12 userregisterinfo" style="padding: 0px;">
                                <br />
                                <div class="col-md-4 col-xs-4" style="padding-left: 0px;"><%= Resources.DisplayText.Venue %>*</div>
                                <div class="col-md-8 col-xs-8" style="padding: 0px;">
                                    <%--<asp:TextBox ID="txt_venu" runat="server" class="form-control"></asp:TextBox>--%>
                                    <asp:DropDownList ID="DropDownList1_venu" runat="server" class="form-control" AutoPostBack="false" DataSourceID="SqlDataSource1_venu" DataTextField="Name" DataValueField="VenueID"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource1_venu" runat="server" ConnectionString="<%$ ConnectionStrings:AllClassicDBConnectionString %>" SelectCommand="select VenueID,Name from auxiliary.VenueTbl
"></asp:SqlDataSource>
                                </div>
                                <br />
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
            <div class="col-xs-12" style="padding: 0px;">
                <div class="col-xs-6">
                    <div class="col-md-12 col-xs-12 userregisterinfo" style="padding: 0px;">
                        <br />
                        <div class="col-md-4 col-xs-4" style="padding-left: 0px;"><%= Resources.DisplayText.Poster %>*</div>
                        <div class="col-md-8 col-xs-8" style="padding: 0px;">
                            <asp:FileUpload ID="FileUpload_photo1" runat="server" Style="display: inline; display: inline; padding-left: 0; padding-right: 0; border: none; box-shadow: none;"
                                class="form-control" />
                        </div>
                        <br />
                    </div>
                </div>

                <asp:UpdatePanel runat="server">
                    <ContentTemplate>

                        <div class="col-xs-6">
                            <div class="col-md-12 col-xs-12 userregisterinfo" style="padding: 0px;">
                                <br />
                                <div class="col-md-4 col-xs-4" style="padding-left: 0px;"><%= Resources.DisplayText.Video %></div>
                                <div class="col-md-8 col-xs-8" style="padding: 0px;">
                                    <asp:TextBox ID="txt_video" runat="server" class="form-control"></asp:TextBox>
                                </div>
                                <br />
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>

            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <div class="col-xs-12" style="padding: 0px;">
                        <div class="col-xs-6">
                            <div class="col-md-12 col-xs-12 userregisterinfo" style="padding: 0px;">
                                <br />
                                <div class="col-md-4 col-xs-4" style="padding-left: 0px;"><%= Resources.DisplayText.TicketBox %>*</div>
                                <div class="col-md-8 col-xs-8" style="padding: 0px;">
                                    <asp:TextBox ID="txt_ticketbox"  ValidationGroup="a"  runat="server" class="form-control"></asp:TextBox>
                                     <asp:RequiredFieldValidator Display="Dynamic" runat="server" ForeColor="IndianRed" ValidationGroup="a" Font-Bold="true" ID="RequiredFieldValidator5" ControlToValidate="txt_ticketbox" ErrorMessage="<%$Resources:DisplayText,PleaseEnterTicketBoxinfo %>" />

                                </div>
                                <br />
                            </div>
                        </div>
                    </div>

                    <div class="col-xs-12" style="padding: 0px;">
                        <div class="col-xs-6">
                            <%= Resources.DisplayText.Program %><br />
                            <asp:TextBox ID="txt_program" runat="server" class="form-control" TextMode="MultiLine" Rows="10"></asp:TextBox>
                        </div>
                        <div class="col-xs-6">
                            <%= Resources.DisplayText.Description %><br />
                            <asp:TextBox ID="txt_description" runat="server" class="form-control" TextMode="MultiLine" Rows="10"></asp:TextBox>
                        </div>
                    </div>

                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>

    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <div class="row">

                <div class="row col-md-12 col-xs-12">
                    <asp:Button Visible="true" ID="btn_Performance_cancel" CssClass="btn btn-danger pull-right" runat="server" Text="<%$Resources:DisplayText,Cancel %>" OnClick="btn_Performancecancel_Click" Style="margin-right: 10px;" />
                    <asp:Button Visible="true" ValidationGroup="a" ID="btn_Performance_save" CssClass="btn btn-warning pull-right" runat="server" Text="<%$Resources:DisplayText,Update %>" OnClick="btn_Performancesave_Click" Style="margin-right: 10px;" />
                    <asp:Button ID="btn_Performance_add" ValidationGroup="a" Visible="false" CssClass="btn btn-primary pull-right" runat="server" Text="<%$Resources:DisplayText,Add %>" OnClick="btn_Performanceadd_Click" Style="margin-right: 10px;" />
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btn_Performance_save" />
            <asp:PostBackTrigger ControlID="btn_Performance_add" />
        </Triggers>
    </asp:UpdatePanel>


    <script>
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
</asp:Content>
