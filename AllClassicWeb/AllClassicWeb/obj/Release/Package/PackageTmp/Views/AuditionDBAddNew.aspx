<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AuditionDBAddNew.aspx.cs" Inherits="AllClassicWeb.Views.AuditionDBAddNew" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <link href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/css/bootstrap-datetimepicker.css" rel="stylesheet" />
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.15.2/moment.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>

    <asp:UpdatePanel runat="server">
        <ContentTemplate>

            <h4>New Data Input</h4>
            <hr />

            <div class="row">

                <div class="col-xs-6" style="padding: 0;">
                    <div class="col-xs-4 filedName"><%=Resources.DisplayText.Organizer %>*</div>
                    <div class="col-xs-6" style="padding: 0;">
                        <asp:TextBox runat="server" ValidationGroup="a" ID="txt_organizer" CssClass="form-control filedDisplay" />

                        <asp:RequiredFieldValidator Display="Dynamic" runat="server" ForeColor="IndianRed" ValidationGroup="a" Font-Bold="true" ID="RequiredFieldValidator1" ControlToValidate="txt_organizer" ErrorMessage="<%$Resources:DisplayText,Pleasefillorganizerfield %>" />

                    </div>
                </div>
                <div class="col-xs-6" style="padding: 0;">
                    <div class="col-xs-4 filedName"><%=Resources.DisplayText.Title %>*</div>
                    <div class="col-xs-6" style="padding: 0;">
                        <asp:TextBox ValidationGroup="a" runat="server" ID="txt_title" CssClass="form-control filedDisplay" MaxLength="39" />

                        <asp:RequiredFieldValidator Display="Dynamic" runat="server" ForeColor="IndianRed" ValidationGroup="a" Font-Bold="true" ID="RequiredFieldValidator4" ControlToValidate="txt_title" ErrorMessage="<%$Resources:DisplayText,Pleasefilltitlefield %>" />

                    </div>
                </div>
            </div>

            <div class="row">
                <br />
                <div class="col-xs-6" style="padding: 0;">
                    <div class="col-xs-4 filedName"><%=Resources.DisplayText.FromDate %>*</div>
                    <div class="col-xs-6" style="padding: 0;">

                        <div class='input-group date' id='datetimepicker2' style="display: flex;">
                            <input type='text' class="form-control filedDisplay" runat="server" validationgroup="a" id="datetimepicker2" style="display: inline-block; border-right-width: 0px;" />
                            <span class="input-group-addon" style="flex-wrap: wrap; width: auto; display: inline-block; padding-left: 12px; margin-left: -5px; padding-top: 9px; padding-bottom: 6px;">
                                <span class="glyphicon glyphicon-calendar"></span>
                            </span>
                        </div>

                        <asp:RequiredFieldValidator Display="Dynamic" runat="server" ForeColor="IndianRed" ValidationGroup="a" Font-Bold="true" ID="RequiredFieldValidator2" ControlToValidate="datetimepicker2" ErrorMessage="<%$Resources:DisplayText,PleaseEnterStartDate %>" />

                    </div>
                </div>
                <div class="col-xs-6" style="padding: 0;">
                    <div class="col-xs-4 filedName"><%=Resources.DisplayText.ToDate %>*</div>
                    <div class="col-xs-6" style="padding: 0;">

                        <div class='input-group date' id='datetimepicker3' style="display: flex;">
                            <input type='text' class="form-control filedDisplay" runat="server" validationgroup="a" id="datetimepicker3" style="display: inline-block; border-right-width: 0px;" />
                            <span class="input-group-addon" style="flex-wrap: wrap; width: auto; display: inline-block; padding-left: 12px; margin-left: -5px; padding-top: 9px; padding-bottom: 6px;">
                                <span class="glyphicon glyphicon-calendar"></span>
                            </span>
                        </div>


                        <asp:RequiredFieldValidator Display="Dynamic" runat="server" ForeColor="IndianRed" ValidationGroup="a" Font-Bold="true" ID="RequiredFieldValidator3" ControlToValidate="datetimepicker3" ErrorMessage="<%$Resources:DisplayText,PleaseEnterEndDate %>" />


                    </div>
                </div>

            </div>

            <div class="row">
                <br />
                <div class="col-xs-12 filedName"><%= Resources.DisplayText.AuditionOutlineandApplicationInfo %>*</div>
                <div class="col-xs-12">
                    <asp:TextBox runat="server" ID="txt_auditionoutline" CssClass="form-control filedDisplay" TextMode="MultiLine" Style="max-width: 500px; width: 500px !important;" Rows="10" />
                    <asp:RequiredFieldValidator Display="Dynamic" runat="server" ForeColor="IndianRed" ValidationGroup="a" Font-Bold="true" ID="RequiredFieldValidator5" ControlToValidate="txt_auditionoutline" ErrorMessage="<%$Resources:DisplayText,PleasefillAuditionoutlinefield %>" />

                </div>
            </div>

            <textarea cols="80" id="editor1" name="editor1" rows="10">&lt;p&gt;This is some &lt;strong&gt;sample text&lt;/strong&gt;. You are using &lt;a href=&quot;https://ckeditor.com/&quot;&gt;CKEditor&lt;/a&gt;.&lt;/p&gt;</textarea>

            <div class="row col-xs-4" style="text-align: right;">
                <br />

                <asp:Button runat="server" ValidationGroup="a" ID="btn_saveAudition" UseSubmitBehavior="false" OnClick="onclick_btn_UpdatenewAudition" type="button" Text="<%$Resources:DisplayText,Update %>" class="btn btn-warning contentButton"></asp:Button>
                <asp:Button runat="server" ValidationGroup="a" ID="btn_addnewAudition" UseSubmitBehavior="false" OnClick="onclick_btn_addnewAudition" type="button" Text="<%$Resources:DisplayText,Add %>" class="btn btn-primary contentButton"></asp:Button>
                <asp:Button runat="server" type="button" class="btn btn-danger contentButton" OnClick="btn_cancelclicked" data-dismiss="modal" Text="<%$Resources:DisplayText,Cancel %>"></asp:Button>
                <%--<asp:Button runat="server" ID="btn_addArticle2" OnClick="onclick_btn_addArticle" type="button" Text="Add" class="btn btn-primary" data-dismiss="modal"></asp:Button>--%>
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>

    <script type="text/javascript">
        document.getElementById("auditiontab").style.backgroundColor = "rgb(255, 255, 255) ";
        document.getElementById("auditiontab").style.borderRight = "none";
    </script>
    <script>
        // We need to turn off the automatic editor creation first.
        CKEDITOR.disableAutoInline = true;
        alert("test")
        CKEDITOR.replace('editor1');
    </script>
    <script src="https://cdn.ckeditor.com/4.11.1/standard-all/ckeditor.js"></script>
    <script type="text/javascript">

        function ShowMessage() {
            alert('Data inserted succssfuly');
            window.location.href = 'AuditionDB.aspx';
        }

        function bindDateTime() {
            $('#datetimepicker2').datetimepicker({
                format: 'MM/DD/YYYY'
            });
            $('#datetimepicker3').datetimepicker({
                format: 'MM/DD/YYYY'
            });
        }
        $(function () {
            $('#datetimepicker3').datetimepicker({
                format: 'MM/DD/YYYY'
            });
            $('#datetimepicker2').datetimepicker({
                format: 'MM/DD/YYYY'
            });
        });
    </script>



</asp:Content>
