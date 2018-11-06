<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PerformanceDBAddNew.aspx.cs" Inherits="AllClassicWeb.Views.PerformanceDBAddNew" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <link href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/css/bootstrap-datetimepicker.css" rel="stylesheet" />
            <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.js"></script>
            <script src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.15.2/moment.min.js"></script>
            <script src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.js"></script>
            <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>


            <h4 runat="server" id="headerlabelcontainer"><%= Resources.DisplayText.NewDataInputScreen %></h4>
            <hr style="margin-top: 0px;" />
            <div id="dataentryform" class="row">
                <div class="col-xs-6">
                    <div class="col-md-12 col-xs-12 userregisterinfo">
                        <br />
                        <div class="col-md-4 col-xs-4"><%= Resources.DisplayText.MainTitle %>*</div>
                        <div class="col-md-8 col-xs-8">
                            <asp:TextBox ID="txt_name" runat="server" class="form-control"></asp:TextBox>

                        </div>
                        <br />
                    </div>

                    <div class="col-md-12 col-xs-12 userregisterinfo">
                        <br />
                        <div class="col-md-4 col-xs-4"><%= Resources.DisplayText.SubTitle %>*</div>
                        <div class="col-md-8 col-xs-8">
                            <asp:TextBox ID="TextBox1" runat="server" class="form-control"></asp:TextBox>

                        </div>
                        <br />
                    </div>

                    <div class="col-md-12 col-xs-12 userregisterinfo">
                        <br />
                        <div class="col-md-4 col-xs-4"><%= Resources.DisplayText.SubjectTheme %>*</div>
                        <div class="col-md-8 col-xs-8">
                            <asp:TextBox ID="TextBox2" runat="server" class="form-control"></asp:TextBox>

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
                            <asp:DropDownList ID="DropDownList1" runat="server" class="form-control" AutoPostBack="false" DataSourceID="SqlDataSource1_performancetypelist" DataTextField="SubCode" DataValueField="LookUpID"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1_performancetypelist" runat="server" ConnectionString="<%$ ConnectionStrings:AllClassicDBConnectionString %>" SelectCommand="SELECT LookUpID, MainCode, SubCode 
FROM Main.LookUpTbl
where maincode='PerformanceType'
"></asp:SqlDataSource>
                        </div>
                        <br />
                    </div>


                    <div class="col-md-12 col-xs-12 userregisterinfo">
                        <br />
                        <div class="col-md-4 col-xs-4"><%= Resources.DisplayText.Conductor %>*</div>
                        <div class="col-md-8 col-xs-8">
                            <asp:TextBox ID="TextBox5" runat="server" class="form-control"></asp:TextBox>

                        </div>
                        <br />
                    </div>


                    <div class="col-md-12 col-xs-12 userregisterinfo">
                        <br />
                        <div class="col-md-4 col-xs-4"><%= Resources.DisplayText.MainTitleComposer %>*</div>
                        <div class="col-md-8 col-xs-8">
                            <asp:TextBox ID="TextBox6" runat="server" class="form-control"></asp:TextBox>

                        </div>
                        <br />
                    </div>


                    <div class="col-md-12 col-xs-12 userregisterinfo">
                        <br />
                        <div class="col-md-4 col-xs-4"><%= Resources.DisplayText.MainInstrument %>*</div>
                        <div class="col-md-8 col-xs-8">
                            <%--<asp:TextBox ID="TextBox7" runat="server" class="form-control"></asp:TextBox>--%>
                            <asp:DropDownList ID="DropDownList2" runat="server" class="form-control" DataSourceID="SqlDataSource1_instrumentlist" DataTextField="KoreanName" DataValueField="InstrumentID"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1_instrumentlist" runat="server" ConnectionString="<%$ ConnectionStrings:AllClassicDBConnectionString %>" SelectCommand="
                                SELECT InstrumentID=-1, EnglishName='None', KoreanName='None'
                                SELECT InstrumentID, EnglishName, KoreanName FROM Auxiliary.InstrumentTbl"></asp:SqlDataSource>
                        </div>
                        <br />
                    </div>



                    <div class="col-md-12 col-xs-12 userregisterinfo">
                        <br />
                        <div class="col-md-4 col-xs-4"><%= Resources.DisplayText.Organizer %>*</div>
                        <div class="col-md-8 col-xs-8">
                            <asp:TextBox ID="TextBox8" runat="server" class="form-control"></asp:TextBox>

                        </div>
                        <br />
                    </div>

                    <div class="col-md-12 col-xs-12 userregisterinfo">
                        <br />
                        <div class="col-md-4 col-xs-4"><%= Resources.DisplayText.Sponser %>*</div>
                        <div class="col-md-8 col-xs-8">
                            <asp:TextBox ID="TextBox9" runat="server" class="form-control"></asp:TextBox>

                        </div>
                        <br />
                    </div>


                    <div class="col-md-12 col-xs-12 userregisterinfo">
                        <br />
                        <div class="col-md-4 col-xs-4"><%= Resources.DisplayText.Language %>*</div>
                        <div class="col-md-8 col-xs-8">
                            <asp:TextBox ID="TextBox10" runat="server" class="form-control"></asp:TextBox>

                        </div>
                        <br />
                    </div>


                </div>
                <div class="col-xs-6">

                    <div class="col-xs-12" style="padding: 0px;">
                        <div class="col-xs-6">
                            <div class="col-md-12 col-xs-12 userregisterinfo" style="padding: 0px;">
                                <br />
                                <div class="col-md-4 col-xs-4" style="padding-left: 0px;"><%= Resources.DisplayText.Start %>*</div>
                                <div class="col-md-8 col-xs-8" style="padding: 0px;">
                                    <%--<asp:TextBox ID="TextBox11" runat="server" class="form-control"></asp:TextBox>--%>
                                    <div class='input-group date' id='datetimepicker2' style="display: flex;">
                                        <input type='text' class="form-control" runat="server" id="userBirthDate" style="display: inline-block; border-right-width: 0px;" />
                                        <span class="input-group-addon" style="flex-wrap: wrap; width: auto; display: inline-block; padding-left: 12px; margin-left: -5px; padding-top: 9px; padding-bottom: 6px;">
                                            <span class="glyphicon glyphicon-calendar"></span>
                                        </span>
                                    </div>
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
                                        <input type='text' class="form-control" runat="server" id="Text1" style="display: inline-block; border-right-width: 0px;" />
                                        <span class="input-group-addon" style="flex-wrap: wrap; width: auto; display: inline-block; padding-left: 12px; margin-left: -5px; padding-top: 9px; padding-bottom: 6px;">
                                            <span class="glyphicon glyphicon-calendar"></span>
                                        </span>
                                    </div>
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
                                    <asp:TextBox ID="TextBox13" runat="server" class="form-control"></asp:TextBox>
                                </div>
                                <br />
                            </div>
                        </div>
                        <div class="col-xs-6">
                            <div class="col-md-12 col-xs-12 userregisterinfo" style="padding: 0px;">
                                <br />
                                <div class="col-md-4 col-xs-4" style="padding-left: 0px;"><%= Resources.DisplayText.Region %>*</div>
                                <div class="col-md-8 col-xs-8" style="padding: 0px;">
                                     <asp:DropDownList ID="DropDownList4" runat="server" class="form-control" AutoPostBack="false" DataSourceID="SqlDataSource1_region" DataTextField="SubCode" DataValueField="LookUpID"></asp:DropDownList>
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
                                    <asp:DropDownList ID="DropDownList3" runat="server" class="form-control" AutoPostBack="false" DataSourceID="SqlDataSource1_city" DataTextField="SubCode" DataValueField="LookUpID"></asp:DropDownList>
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
                                    <asp:TextBox ID="TextBox16" runat="server" class="form-control"></asp:TextBox>
                                </div>
                                <br />
                            </div>
                        </div>
                    </div>

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
                        <div class="col-xs-6">
                            <div class="col-md-12 col-xs-12 userregisterinfo" style="padding: 0px;">
                                <br />
                                <div class="col-md-4 col-xs-4" style="padding-left: 0px;"><%= Resources.DisplayText.Video %>*</div>
                                <div class="col-md-8 col-xs-8" style="padding: 0px;">
                                    <asp:TextBox ID="TextBox18" runat="server" class="form-control"></asp:TextBox>
                                </div>
                                <br />
                            </div>
                        </div>
                    </div>

                    <div class="col-xs-12" style="padding: 0px;">
                        <div class="col-xs-6">
                            <div class="col-md-12 col-xs-12 userregisterinfo" style="padding: 0px;">
                                <br />
                                <div class="col-md-4 col-xs-4" style="padding-left: 0px;"><%= Resources.DisplayText.TicketBox %>*</div>
                                <div class="col-md-8 col-xs-8" style="padding: 0px;">
                                    <asp:TextBox ID="TextBox19" runat="server" class="form-control"></asp:TextBox>
                                </div>
                                <br />
                            </div>
                        </div>
                    </div>

                    <div class="col-xs-12" style="padding: 0px;">
                        <div class="col-xs-6">
                            <%= Resources.DisplayText.Program %><br />
                            <asp:TextBox ID="TextBox22" runat="server" class="form-control" TextMode="MultiLine" Rows="10"></asp:TextBox>
                        </div>
                        <div class="col-xs-6">
                            <%= Resources.DisplayText.Description %><br />
                            <asp:TextBox ID="TextBox20" runat="server" class="form-control" TextMode="MultiLine" Rows="10"></asp:TextBox>
                        </div>
                    </div>


                </div>
            </div>

            <div class="row">

                <%--<div class="row col-md-12 col-xs-12">
                    <asp:Button Visible="true" ID="btn_artist_cancel" CssClass="btn btn-danger pull-right" runat="server" Text="<%$Resources:DisplayText,Cancel %>" OnClick="btn_artistcancel_Click" Style="margin-right: 10px;" />
                    <asp:Button Visible="true" ID="btn_artist_save" CssClass="btn btn-warning pull-right" runat="server" Text="<%$Resources:DisplayText,Update %>" OnClick="btn_artistsave_Click" Style="margin-right: 10px;" />
                    <asp:Button ID="btn_artist_add" CssClass="btn btn-primary pull-right" runat="server" Text="<%$Resources:DisplayText,Add %>" OnClick="btn_artistadd_Click" Style="margin-right: 10px;" />
                </div>--%>
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>

    <script>
        function bindDateTime() {
            $('#datetimepicker2').datetimepicker({
                format: 'MM/DD/YYYY'
            });
            $('#datetimepicker3_end').datetimepicker({
                format: 'MM/DD/YYYY'
            });

        }
        $(function () {
            $('#datetimepicker2').datetimepicker({
                format: 'MM/DD/YYYY'
            });

            $('#datetimepicker3_end').datetimepicker({
                format: 'MM/DD/YYYY'
            });
        });
    </script>
</asp:Content>
