<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ConcoursDBAddNew.aspx.cs" ValidateRequest="false" Inherits="AllClassicWeb.Views.ConcoursDBAddNew" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <link href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/css/bootstrap-datetimepicker.css" rel="stylesheet" />
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.15.2/moment.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>

    <br />


    <h4 runat="server" id="headerlabelcontainer" class="contentHeader"><%= Resources.DisplayText.NewDataInputScreen %></h4>
    <hr style="margin-top: 0px;" />

    <asp:UpdatePanel runat="server">
        <ContentTemplate>

            <div class="row ">

                <div class="row ">

                    <div class="col-md-8 col-xs-8 userregisterinfo">
                        <br />
                        <div class="col-md-4 col-xs-4 filedName"><%= Resources.DisplayText.Organizer %>*</div>
                        <div class="col-md-8 col-xs-8">
                            <asp:TextBox ID="txt_organizer" ValidationGroup="a" runat="server" class="form-control filedDisplay"  MaxLength="40"></asp:TextBox>

                            <asp:RequiredFieldValidator Display="Dynamic" runat="server" ForeColor="IndianRed" ValidationGroup="a" Font-Bold="true" ID="RequiredFieldValidator1" ControlToValidate="txt_organizer" ErrorMessage="<%$Resources:DisplayText,Pleasefillorganizerfield %>" />

                        </div>
                        <br />
                    </div>
                </div>
                <div class="row ">
                    <div class="col-md-8 col-xs-8 userregisterinfo">
                        <br />
                        <div class="col-md-4 col-xs-4 filedName"><%= Resources.DisplayText.Title %>*</div>
                        <div class="col-md-8 col-xs-8">
                            <asp:TextBox ID="txt_title" ValidationGroup="a" runat="server" class="form-control filedDisplay"  MaxLength="40"></asp:TextBox>
                            <asp:RequiredFieldValidator Display="Dynamic" runat="server" ForeColor="IndianRed" ValidationGroup="a" Font-Bold="true" ID="RequiredFieldValidator4" ControlToValidate="txt_title" ErrorMessage="<%$Resources:DisplayText,Pleasefilltitlefield %>" />

                        </div>
                        <br />
                    </div>
                </div>
                <div class="row ">
                    <div class="col-md-8 col-xs-8 userregisterinfo">
                        <br />
                        <div class="col-md-4 col-xs-4 filedName"><%= Resources.DisplayText.FromDate %>*</div>
                        <div class="col-md-8 col-xs-8">
                            <div class='input-group date' id='datetimepicker2' style="display: flex; padding: 0;">
                                <input type='text' class="form-control filedDisplay" runat="server" validationgroup="a" ontextchanged="selectedFilterChanged" id="datetimepicker2" style="display: inline-block; border-right-width: 0px; width: 61%;" />
                                <span class="input-group-addon" style="flex-wrap: wrap; width: auto; display: inline-block; padding-left: 12px; margin-left: -5px; padding-top: 9px; padding-bottom: 6px;">
                                    <span class="glyphicon glyphicon-calendar"></span>
                                </span>
                            </div>

                            <asp:RequiredFieldValidator Display="Dynamic" runat="server" ForeColor="IndianRed" ValidationGroup="a" Font-Bold="true" ID="RequiredFieldValidator2" ControlToValidate="datetimepicker2" ErrorMessage="<%$Resources:DisplayText,PleaseEnterStartDate %>" />

                        </div>
                        <br />
                    </div>
                </div>
                <div class="row ">
                    <div class="col-md-8 col-xs-8 userregisterinfo">
                        <br />
                        <div class="col-md-4 col-xs-4 filedName"><%= Resources.DisplayText.ToDate %>*</div>
                        <div class="col-md-8 col-xs-8">
                            <div class='input-group date' id='datetimepicker3' style="display: flex; padding: 0;">
                                <input type='text' class="form-control filedDisplay" runat="server" validationgroup="a" ontextchanged="selectedFilterChanged" id="datetimepicker3" style="display: inline-block; border-right-width: 0px; width: 61%;" />
                                <span class="input-group-addon" style="flex-wrap: wrap; width: auto; display: inline-block; padding-left: 12px; margin-left: -5px; padding-top: 9px; padding-bottom: 6px;">
                                    <span class="glyphicon glyphicon-calendar"></span>
                                </span>
                            </div>

                            <asp:RequiredFieldValidator Display="Dynamic" runat="server" ForeColor="IndianRed" ValidationGroup="a" Font-Bold="true" ID="RequiredFieldValidator3" ControlToValidate="datetimepicker3" ErrorMessage="<%$Resources:DisplayText,PleaseEnterEndDate %>" />

                        </div>
                        <br />
                    </div>
                </div>
                <div class="row ">
                    <div class="col-xs-12 userregisterinfo">
                        <br />
                        <div class=" col-xs-12 filedName"><%= Resources.DisplayText.ConcourOutline %>* (Maximum 400 characters)</div>

                        <div class="col-xs-12">
                            <%--<asp:TextBox ID="txt_outline" runat="server"  class="form-control filedDisplay" style="max-width:500px;"  ValidationGroup="a" TextMode="MultiLine" Rows="15"></asp:TextBox>--%>

                            <textarea cols="80" id="txt_outline" validationgroup="a" runat="server" name="editor1" rows="10"> </textarea>
                            <asp:HiddenField ID="HiddenField2" runat="server" Value="" />
                            <%--<asp:RequiredFieldValidator Display="Dynamic" runat="server" ForeColor="IndianRed" ValidationGroup="a" Font-Bold="true" ID="RequiredFieldValidator5" ControlToValidate="txt_outline" ErrorMessage="<%$Resources:DisplayText,PleasefillConcouroutlinefield %>" />--%>
                        </div>
                        <br />
                    </div>
                </div>
                <br />
                <div class="row col-md-4 col-xs-4">
                    <asp:Button Visible="true" ID="btn_concours_cancel" CssClass="btn btn-danger pull-right contentButton" runat="server" Text="<%$Resources:DisplayText,Cancel %>" OnClick="btn_concours_cancel_Click" Style="margin-right: 10px;" />
                    <asp:Button Visible="true" ID="btn_concours_save" CssClass="btn btn-warning pull-right contentButton" runat="server" Text="<%$Resources:DisplayText,Update %>" OnClientClick="getValueFromHtmlEditor();" OnClick="btn_concours_save_Click" Style="margin-right: 10px;" />
                    <asp:Button ID="btn_concours_add" ValidationGroup="a" CssClass="btn btn-primary pull-right contentButton" runat="server" Text="<%$Resources:DisplayText,Add %>" OnClientClick="getValueFromHtmlEditor();" OnClick="btn_concours_add_Click" Style="margin-right: 10px;" />

                </div>

            </div>

        </ContentTemplate>
    </asp:UpdatePanel>

    <script type="text/javascript">


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


        }


        function getValueFromHtmlEditor() {
            var value = CKEDITOR.instances['MainContent_txt_outline'].getData();
            $('#MainContent_HiddenField2').val(value);
        }

        function ShowMessage() {
            alert('Data inserted succssfuly');
            window.location.href = 'ConcoursDB.aspx';
        }

        function bindDateTime() {
            $('#datetimepicker2').datetimepicker({
                format: 'DD/MM/YYYY'
            });
            $('#datetimepicker3').datetimepicker({
                format: 'DD/MM/YYYY'
            });
        }
        $(function () {
            $('#datetimepicker3').datetimepicker({
                format: 'DD/MM/YYYY'
            });
            $('#datetimepicker2').datetimepicker({
                format: 'DD/MM/YYYY'
            });
        });
    </script>

</asp:Content>
