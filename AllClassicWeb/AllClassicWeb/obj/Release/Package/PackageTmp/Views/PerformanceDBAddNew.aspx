﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PerformanceDBAddNew.aspx.cs"  ValidateRequest="false"  Inherits="AllClassicWeb.Views.PerformanceDBAddNew" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <link href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/css/bootstrap-datetimepicker.css" rel="stylesheet" />
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.15.2/moment.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>

    <br />
    <h4 runat="server" id="headerlabelcontainer" class="contentTitle"><%= Resources.DisplayText.NewDataInputScreen %></h4>
    <hr style="margin-top: 0px;" />
    <div id="dataentryform" class="row ">
        <asp:UpdatePanel runat="server">
            <ContentTemplate>

                <div class="col-xs-6">
                    <div class="col-md-12 col-xs-12 userregisterinfo">
                        <br />
                        <div class="col-md-4 col-xs-4 filedName"><%= Resources.DisplayText.MainTitle %>*</div>
                        <div class="col-md-8 col-xs-8">
                            <asp:TextBox ID="txt_maintitle" ValidationGroup="a" runat="server" class="form-control" MaxLength="40"></asp:TextBox>
                            <asp:RequiredFieldValidator Display="Dynamic" runat="server" ForeColor="IndianRed" ValidationGroup="a" Font-Bold="true" ID="RequiredFieldValidator1" ControlToValidate="txt_maintitle" ErrorMessage="<%$Resources:DisplayText,PleaseEnterMainTitle %>" />

                        </div>
                        <br />
                    </div>

                    <div class="col-md-12 col-xs-12 userregisterinfo">
                        <br />
                        <div class="col-md-4 col-xs-4 filedName"><%= Resources.DisplayText.SubTitle %></div>
                        <div class="col-md-8 col-xs-8">
                            <asp:TextBox ID="txt_subtitle" runat="server" class="form-control" MaxLength="40"></asp:TextBox>

                        </div>
                        <br />
                    </div>

                    <div class="col-md-12 col-xs-12 userregisterinfo">
                        <br />
                        <div class="col-md-4 col-xs-4 filedName"><%= Resources.DisplayText.SubjectTheme %></div>
                        <div class="col-md-8 col-xs-8">
                            <asp:TextBox ID="txt_subjecttheme" runat="server" class="form-control" MaxLength="40"></asp:TextBox>

                        </div>
                        <br />
                    </div>

                    <div class="col-md-12 col-xs-12 userregisterinfo">
                        <br />
                        <div class="col-md-4 col-xs-4 filedName"><%= Resources.DisplayText.PerformanceType %>*</div>
                        <div class="col-md-8 col-xs-8">
                            <%-- <asp:TextBox ID="TextBox4" runat="server" class="form-control"></asp:TextBox>--%>
                            <asp:DropDownList ID="DropDownList1_performancetype" runat="server" class="form-control" AutoPostBack="false" DataSourceID="SqlDataSource1_performancetypelist" DataTextField="SubCode" DataValueField="LookUpID" OnDataBound="DropDownList1_performancetype_DataBound"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1_performancetypelist" runat="server" ConnectionString="<%$ ConnectionStrings:AllClassicDBConnectionString %>" SelectCommand="SELECT LookUpID, MainCode, SubCode 
FROM Main.LookUpTbl
where maincode='PerformanceType'
"></asp:SqlDataSource>
                        </div>
                        <br />
                    </div>
                    
                    <div class="col-md-12 col-xs-12 userregisterinfo">
                        <br />
                        <div class="col-md-4 col-xs-4 filedName"><%= Resources.DisplayText.PerformanceGroup %>*</div>
                        <div class="col-md-8 col-xs-8">
                            <%--<asp:TextBox ID="TextBox3" runat="server" class="form-control"></asp:TextBox>--%>
                            <asp:DropDownList ID="DropDownList1_grouptype" runat="server" Style="width: 87%; display: inline-block;" class="form-control" DataSourceID="SqlDataSource1_performancegrouplist" DataTextField="Name" DataValueField="PerformanceGroupID" OnDataBound="DropDownList1_grouptype_DataBound"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1_performancegrouplist" runat="server" ConnectionString="<%$ ConnectionStrings:AllClassicDBConnectionString %>" SelectCommand="SELECT Name, PerformanceGroupID FROM Main.PerformanceGroupTbl"></asp:SqlDataSource>
                            <asp:LinkButton runat="server" CssClass="btn btn-success" Style="padding: 5px; padding-left: 10px; padding-right: 10px;"
                                Text="+" PostBackUrl="~/Views/PerformanceGroupAddNew.aspx"></asp:LinkButton>
                        </div>
                        <br />
                    </div>

                    <div class="col-md-12 col-xs-12 userregisterinfo">
                        <br />
                        <div class="col-md-4 col-xs-4 filedName"><%= Resources.DisplayText.Conductor %></div>
                        <div class="col-md-8 col-xs-8">
                            <asp:DropDownList ID="DropDownList1_conductors"  Style="width: 87%; display: inline-block;" runat="server" class="form-control" DataSourceID="SqlDataSource1_conductors" DataTextField="Name" DataValueField="MusicianID" OnDataBound="DropDownList1_conductors_DataBound"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1_conductors" runat="server" ConnectionString="<%$ ConnectionStrings:AllClassicDBConnectionString %>" SelectCommand="SELECT MusicianID= -1, Name='None' UNION SELECT Main.MusicianTbl.MusicianID, Main.MusicianTbl.Name FROM Main.MusicianTbl INNER JOIN Main.LookUpTbl ON Main.MusicianTbl.Major = Main.LookUpTbl.LookUpID WHERE (Main.LookUpTbl.MainCode = 'Conductor')"></asp:SqlDataSource>
                            
                            <asp:LinkButton runat="server" CssClass="btn btn-success" Style="padding: 5px; padding-left: 10px; padding-right: 10px;"
                                Text="+" PostBackUrl="~/Views/MusicianDBAddNew.aspx"></asp:LinkButton>
                        </div>
                        <br />
                    </div>

                    <div class="col-md-12 col-xs-12 userregisterinfo">
                        <br />
                        <div class="col-md-4 col-xs-4 filedName"><%= Resources.DisplayText.MainTitleComposer %></div>
                        <div class="col-md-8 col-xs-8">
                            <asp:DropDownList ID="DropDownList1_composer" runat="server"   Style="width: 87%; display: inline-block;" class="form-control" DataSourceID="SqlDataSource1_composer" DataTextField="Name" DataValueField="MusicianID" OnDataBound="DropDownList1_composer_DataBound"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1_composer" runat="server" ConnectionString="<%$ ConnectionStrings:AllClassicDBConnectionString %>" SelectCommand="SELECT MusicianID= -1, Name='None' UNION SELECT Main.MusicianTbl.MusicianID, Main.MusicianTbl.Name FROM Main.MusicianTbl INNER JOIN Main.LookUpTbl ON Main.MusicianTbl.Major = Main.LookUpTbl.LookUpID WHERE (Main.LookUpTbl.MainCode = 'Composer')"></asp:SqlDataSource>
                            
                            <asp:LinkButton runat="server" CssClass="btn btn-success" Style="padding: 5px; padding-left: 10px; padding-right: 10px;"
                                Text="+" PostBackUrl="~/Views/MusicianDBAddNew.aspx"></asp:LinkButton>
                        </div>
                        <br />
                    </div>

                    <div class="col-md-12 col-xs-12 userregisterinfo">
                        <br />
                        <div class="col-md-4 col-xs-4 filedName"><%= Resources.DisplayText.MainInstrument %></div>
                        <div class="col-md-8 col-xs-8">
                            <%--<asp:TextBox ID="TextBox7" runat="server" class="form-control"></asp:TextBox>--%>
                            <asp:DropDownList ID="DropDownList2_maininstrument" runat="server" class="form-control" DataSourceID="SqlDataSource1_instrumentlist" DataTextField="KoreanName" DataValueField="InstrumentID" OnDataBound="DropDownList2_maininstrument_DataBound"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1_instrumentlist" runat="server" ConnectionString="<%$ ConnectionStrings:AllClassicDBConnectionString %>" SelectCommand="
                                SELECT InstrumentID=-1, EnglishName='None', KoreanName='None' union
                                SELECT InstrumentID, EnglishName, KoreanName FROM Auxiliary.InstrumentTbl"></asp:SqlDataSource>
                        </div>
                        <br />
                    </div>

                    <div class="col-md-12 col-xs-12 userregisterinfo">
                        <br />
                        <div class="col-md-4 col-xs-4 filedName"><%= Resources.DisplayText.Organizer %></div>
                        <div class="col-md-8 col-xs-8">
                            <asp:TextBox ID="txt_organizer" runat="server" class="form-control"  MaxLength="20"></asp:TextBox>

                        </div>
                        <br />
                    </div>

                    <div class="col-md-12 col-xs-12 userregisterinfo">
                        <br />
                        <div class="col-md-4 col-xs-4 filedName"><%= Resources.DisplayText.Sponser %></div>
                        <div class="col-md-8 col-xs-8">
                            <asp:TextBox ID="txt_sponser" runat="server" class="form-control"  MaxLength="20"></asp:TextBox>

                        </div>
                        <br />
                    </div>

                    <div class="col-md-12 col-xs-12 userregisterinfo ">
                        <br />
                        <div class="col-md-4 col-xs-4 filedName"><%= Resources.DisplayText.Language %></div>
                        <div class="col-md-8 col-xs-8">
                            <asp:TextBox ID="txt_language" runat="server" class="form-control" MaxLength="20"></asp:TextBox>

                        </div>
                        <br />
                    </div>


                    <div class="row col-md-12 col-xs-12">
                        <hr />
                        <div class="col-md-4 col-xs-4">
                          <span class="filedName">  Instrument:</span>
                        <asp:DropDownList ID="DropDownList3_instrumentlist" class="form-control" runat="server" DataSourceID="SqlDataSource1_Instrumentlist2" DataTextField="KoreanName" DataValueField="InstrumentID"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1_Instrumentlist2" runat="server" ConnectionString="<%$ ConnectionStrings:AllClassicDBConnectionString %>" SelectCommand="SELECT InstrumentID, EnglishName, KoreanName FROM Auxiliary.InstrumentTbl"></asp:SqlDataSource>
                        </div>
                        <div class="col-md-4 col-xs-4">
                          <span class="filedName">  Played by:</span> 
                        <asp:DropDownList ID="DropDownList2_artistlist" class="form-control" runat="server" DataSourceID="SqlDataSource1_artistlist" DataTextField="Name" DataValueField="MusicianID"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1_artistlist" runat="server" ConnectionString="<%$ ConnectionStrings:AllClassicDBConnectionString %>" SelectCommand="SELECT  MusicianID, Name  FROM Main.MusicianTbl"></asp:SqlDataSource>
                        </div>
                        <div class="col-md-3">
                            <br />
                            <%--OnClick="btn_add_ArtistInstrument_tolist"--%>
                            <asp:Button ID="btn_addArtistInstrumentcomb" CssClass="btn btn-success contentButton" runat="server" Text="Add"   OnClientClick="getValueFromHtmlEditor();"  OnClick="onclick_btn_addArtistInstrumentcomb" />
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
                                <div class="col-md-4 col-xs-4 filedName" style="padding-left: 0px;"><%= Resources.DisplayText.Start %>*</div>
                                <div class="col-md-8 col-xs-8" style="padding: 0px;">
                                    <%--<asp:TextBox ID="TextBox11" runat="server" class="form-control"></asp:TextBox>--%>
                                    <div class='input-group date' id='datetimepicker2_start' style="display: flex;">
                                        <input type='text' class="form-control" runat="server" validationgroup="a" id="startdate" style="display: inline-block; border-right-width: 0px;" />
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
                                <div class="col-md-4 col-xs-4 filedName" style="padding-left: 0px;"><%= Resources.DisplayText.End %>*</div>
                                <div class="col-md-8 col-xs-8" style="padding: 0px;">
                                    <%--<asp:TextBox ID="TextBox12" runat="server" class="form-control"></asp:TextBox>--%>
                                    <div class='input-group date' id='datetimepicker3_end' style="display: flex;">
                                        <input type='text' class="form-control" validationgroup="a" runat="server" id="enddate" style="display: inline-block; border-right-width: 0px;" />
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
                                <div class="col-md-4 col-xs-4 filedName" style="padding-left: 0px;"><%= Resources.DisplayText.Time %>*</div>
                                <div class="col-md-8 col-xs-8" style="padding: 0px;">
                                    <asp:TextBox ID="txt_time" ValidationGroup="a" runat="server" class="form-control" MaxLength="20"></asp:TextBox>
                                    <asp:RequiredFieldValidator Display="Dynamic" runat="server" ForeColor="IndianRed" ValidationGroup="a" Font-Bold="true" ID="RequiredFieldValidator4" ControlToValidate="txt_time" ErrorMessage="<%$Resources:DisplayText,PleaseEnterTime %>" />

                                </div>
                                <br />
                            </div>
                        </div>
                        <div class="col-xs-6">
                            <div class="col-md-12 col-xs-12 userregisterinfo" style="padding: 0px;">
                                <br />
                                <div class="col-md-4 col-xs-4 filedName" style="padding-left: 0px;"><%= Resources.DisplayText.Region %>*</div>
                                <div class="col-md-8 col-xs-8" style="padding: 0px;">
                                    <asp:DropDownList ID="DropDownList4_region" runat="server" class="form-control" AutoPostBack="false" DataSourceID="SqlDataSource1_region" DataTextField="SubCode" DataValueField="LookUpID" OnDataBound="DropDownList4_region_DataBound"></asp:DropDownList>
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
                                <div class="col-md-4 col-xs-4 filedName" style="padding-left: 0px;"><%= Resources.DisplayText.City %>*</div>
                                <div class="col-md-8 col-xs-8" style="padding: 0px;">
                                    <asp:DropDownList ID="DropDownList3_city" runat="server" class="form-control" AutoPostBack="false" DataSourceID="SqlDataSource1_city" DataTextField="SubCode" DataValueField="LookUpID" OnDataBound="DropDownList3_city_DataBound"></asp:DropDownList>
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
                                <div class="col-md-4 col-xs-4 filedName" style="padding-left: 0px;"><%= Resources.DisplayText.Venue %>*</div>
                                <div class="col-md-8 col-xs-8" style="padding: 0px;">
                                    <%--<asp:TextBox ID="txt_venu" runat="server" class="form-control"></asp:TextBox>--%>
                                    <asp:DropDownList ID="DropDownList1_venu"   Style="width: 75%; display: inline-block;"  runat="server" class="form-control" AutoPostBack="false" DataSourceID="SqlDataSource1_venu" DataTextField="Name" DataValueField="VenueID" OnDataBound="DropDownList1_venu_DataBound"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource1_venu" runat="server" ConnectionString="<%$ ConnectionStrings:AllClassicDBConnectionString %>" SelectCommand="select VenueID,Name from auxiliary.VenueTbl"></asp:SqlDataSource>
                                    <asp:LinkButton runat="server" CssClass="btn btn-success" Style="padding: 5px; padding-left: 10px; padding-right: 10px;"
                                Text="+" PostBackUrl="~/Views/ConcertVenuDBAddNew.aspx"></asp:LinkButton>

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
                        <div class="col-md-4 col-xs-4 filedName" style="padding-left: 0px;"><%= Resources.DisplayText.Poster %>*</div>
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
                                <div class="col-md-4 col-xs-4 filedName" style="padding-left: 0px;"><%= Resources.DisplayText.Video %></div>
                                <div class="col-md-8 col-xs-8" style="padding: 0px;">
                                    <asp:TextBox ID="txt_video" runat="server" class="form-control" MaxLength="80"></asp:TextBox>
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
                                <div class="col-md-4 col-xs-4 filedName" style="padding-left: 0px;"><%= Resources.DisplayText.TicketBox %>*</div>
                                <div class="col-md-8 col-xs-8" style="padding: 0px;">
                                    <asp:TextBox ID="txt_ticketbox" ValidationGroup="a" runat="server" class="form-control"  MaxLength="80"></asp:TextBox>
                                    <asp:RequiredFieldValidator Display="Dynamic" runat="server" ForeColor="IndianRed" ValidationGroup="a" Font-Bold="true" ID="RequiredFieldValidator5" ControlToValidate="txt_ticketbox" ErrorMessage="<%$Resources:DisplayText,PleaseEnterTicketBoxinfo %>" />

                                </div>
                                <br />
                            </div>
                        </div>
                    </div>

                    <div class="col-xs-12" style="padding: 0px;">
                        <br />
                        <div class="col-xs-12"  style="padding: 0px;">
                         <span class="filedName"> <%= Resources.DisplayText.Program %></span>  <br />
                            <%--<asp:TextBox ID="txt_program" runat="server" class="form-control" TextMode="MultiLine" Rows="10"></asp:TextBox>--%>

                            
                            <textarea cols="80" id="txt_outline" validationgroup="a" runat="server" name="editor1" rows="10"> </textarea>
                            <asp:HiddenField ID="HiddenField2" runat="server" Value="" />

                        </div>
                        <div class="col-xs-12"   style="padding: 0px;">
                        <br />
                          <span class="filedName"> <%= Resources.DisplayText.Description %> </span>  <br />
                            <%--<asp:TextBox ID="txt_description" runat="server" class="form-control" TextMode="MultiLine" Rows="10"></asp:TextBox>--%>
                            
                            <textarea cols="80" id="txt_outline_organizer" validationgroup="a" runat="server" name="editor1" rows="10"> </textarea>
                            <asp:HiddenField ID="HiddenField_organizer" runat="server" Value="" />


                        </div>
                    </div>

                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>

    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <div class="row ">

                <div class="row col-md-12 col-xs-12">
                    <br />
                    <asp:Button Visible="true" ID="btn_Performance_cancel" CssClass="btn btn-danger pull-right contentButton" runat="server" Text="<%$Resources:DisplayText,Cancel %>" OnClick="btn_Performancecancel_Click" Style="margin-right: 10px;" />
                    <asp:Button Visible="true" ValidationGroup="a" ID="btn_Performance_save" CssClass="btn btn-warning pull-right contentButton" runat="server" Text="<%$Resources:DisplayText,Update %>"  OnClientClick="getValueFromHtmlEditor();"  OnClick="btn_Performancesave_Click" Style="margin-right: 10px;" />
                    <asp:Button ID="btn_Performance_add" ValidationGroup="a" Visible="false" CssClass="btn btn-primary pull-right contentButton" runat="server" Text="<%$Resources:DisplayText,Add %>"  OnClientClick="getValueFromHtmlEditor();"  OnClick="btn_Performanceadd_Click" Style="margin-right: 10px;" />
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btn_Performance_save" />
            <asp:PostBackTrigger ControlID="btn_Performance_add" />
        </Triggers>
    </asp:UpdatePanel>


    <script>

        
        function loadCkEditor() {
            
            //CKEDITOR.replace('MainContent_txt_auditionoutline');
            CKEDITOR.replace('MainContent_txt_outline', {
                // Define the toolbar groups as it is a more accessible solution.
                toolbarGroups: [
                    { name: 'document', groups: ['mode', 'document', 'doctools'] },
                    { name: 'clipboard', groups: ['clipboard', 'undo'] },
                    { name: 'editing', groups: ['find', 'selection', 'spellchecker', 'editing'] },
                    { name: 'forms', groups: ['forms'] },

                    { name: 'basicstyles', groups: ['basicstyles', 'cleanup'] },
                    { name: 'paragraph', groups: ['list', 'indent', 'blocks', 'align', 'bidi', 'paragraph'] },
                    { name: 'links', groups: ['links'] },
                    { name: 'insert', groups: ['insert'] },

                    { name: 'styles', groups: ['styles'] },
                    { name: 'colors', groups: ['colors'] },
                    { name: 'tools', groups: ['tools'] },
                    { name: 'others', groups: ['others'] },
                    { name: 'about', groups: ['about'] }
                ],
                // Remove the redundant buttons from toolbar groups defined above.
                removeButtons: 'Source,Print,NewPage,Preview,Templates,Replace,Blockquote,CreateDiv,Image,Flash,Smiley,PageBreak,ShowBlocks,About,Maximize'
            });

            //CKEDITOR.replace('MainContent_txt_auditionoutline');
            CKEDITOR.replace('MainContent_txt_outline_organizer', {
                // Define the toolbar groups as it is a more accessible solution.
                toolbarGroups: [
                    { name: 'document', groups: ['mode', 'document', 'doctools'] },
                    { name: 'clipboard', groups: ['clipboard', 'undo'] },
                    { name: 'editing', groups: ['find', 'selection', 'spellchecker', 'editing'] },
                    { name: 'forms', groups: ['forms'] },

                    { name: 'basicstyles', groups: ['basicstyles', 'cleanup'] },
                    { name: 'paragraph', groups: ['list', 'indent', 'blocks', 'align', 'bidi', 'paragraph'] },
                    { name: 'links', groups: ['links'] },
                    { name: 'insert', groups: ['insert'] },

                    { name: 'styles', groups: ['styles'] },
                    { name: 'colors', groups: ['colors'] },
                    { name: 'tools', groups: ['tools'] },
                    { name: 'others', groups: ['others'] },
                    { name: 'about', groups: ['about'] }
                ],
                // Remove the redundant buttons from toolbar groups defined above.
                removeButtons: 'Source,Print,NewPage,Preview,Templates,Replace,Blockquote,CreateDiv,Image,Flash,Smiley,PageBreak,ShowBlocks,About,Maximize'
            });


        }


        function getValueFromHtmlEditor() {
            var value = CKEDITOR.instances['MainContent_txt_outline'].getData();
            $('#MainContent_HiddenField2').val(value);

            var value = CKEDITOR.instances['MainContent_txt_outline_organizer'].getData();
            $('#MainContent_HiddenField_organizer').val(value);
        }


        function ShowMessage() {
            alert('Data inserted succssfuly');
            window.location.href = 'PerformanceDB.aspx';
        }

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
