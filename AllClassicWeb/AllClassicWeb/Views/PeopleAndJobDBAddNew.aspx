<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"  ValidateRequest="false"  CodeBehind="PeopleAndJobDBAddNew.aspx.cs" Inherits="AllClassicWeb.Views.PeopleAndJobDBAddNew" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <link href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/css/bootstrap-datetimepicker.css" rel="stylesheet" />
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.15.2/moment.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>

    <br />
    <h4 class="contentHeader">New Data Input</h4>
    <hr />

    <div class="row">

        <div class="col-xs-4" style="padding: 0;">
            <div class="col-xs-4 filedName"><%=Resources.DisplayText.PeopleOrJob %>*</div>
            <div class="col-xs-6" style="padding: 0;">
                <asp:DropDownList ID="DropDownList1_type" runat="server" class="form-control filedDisplay" OnDataBound="DropDownList1_type_DataBound">
                    <asp:ListItem Value="1" Text="<%$Resources:DisplayText,Job %>"></asp:ListItem>
                    <asp:ListItem Value="2" Text="<%$Resources:DisplayText,People %>"></asp:ListItem>
                </asp:DropDownList>

            </div>
        </div>
        <div class="col-xs-4" style="padding: 0;">
            <div class="col-xs-4 filedName"><%=Resources.DisplayText.ValidDate %>*</div>
            <div class="col-xs-6" style="padding: 0;">
                <div class='input-group date' id='datetimepicker2' style="display: flex;">
                    <input type='text' class="form-control" runat="server" validationgroup="a" onchange="selectedFilterChanged" id="datetimefilter" style="display: inline-block; border-right-width: 0px;" />
                    <span class="input-group-addon" style="flex-wrap: wrap; width: auto; display: inline-block; padding-left: 12px; margin-left: -5px; padding-top: 9px; padding-bottom: 6px;">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                </div>
                <asp:RequiredFieldValidator Display="Dynamic" runat="server" ForeColor="IndianRed" ValidationGroup="a" Font-Bold="true" ID="RequiredFieldValidator2" ControlToValidate="datetimefilter" ErrorMessage="<%$Resources:DisplayText,PleasefillValidDatefield %>" />

            </div>
        </div>
        <div class="col-xs-4" style="padding: 0;">
            <div class="col-xs-4 filedName"><%=Resources.DisplayText.Title %>*</div>
            <div class="col-xs-6" style="padding: 0;">
                <asp:TextBox runat="server" ID="txt_title" CssClass="form-control filedDisplay" ValidationGroup="a"   MaxLength="80"  />
                <asp:RequiredFieldValidator Display="Dynamic" runat="server" ForeColor="IndianRed" ValidationGroup="a" Font-Bold="true" ID="RequiredFieldValidator1" ControlToValidate="txt_title" ErrorMessage="<%$Resources:DisplayText,Pleasefilltitlefield %>" />

            </div>
        </div>

    </div>

    <br />
    <div class="row">

        <div class="col-xs-4" style="padding: 0;">
            <div class="col-xs-4 filedName"><%=Resources.DisplayText.City %>*</div>
            <div class="col-xs-6" style="padding: 0;">
                <asp:DropDownList ID="DropDownList3_city" runat="server" class="form-control" AutoPostBack="false" DataSourceID="SqlDataSource1_city" DataTextField="SubCode" DataValueField="LookUpID" OnDataBound="DropDownList3_city_DataBound"></asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1_city" runat="server" ConnectionString="<%$ ConnectionStrings:AllClassicDBConnectionString %>" SelectCommand="SELECT LookUpID, MainCode, SubCode 
FROM Main.LookUpTbl
where maincode='City'
"></asp:SqlDataSource>
            </div>
        </div>
        <div class="col-xs-4" style="padding: 0;">
            <div class="col-xs-4 filedName"><%=Resources.DisplayText.ContactName %>*</div>
            <div class="col-xs-6" style="padding: 0;">
                <asp:TextBox runat="server" ID="txt_contactname" ValidationGroup="a" CssClass="form-control filedDisplay"   MaxLength="80"  />
                <asp:RequiredFieldValidator Display="Dynamic" runat="server" ForeColor="IndianRed" ValidationGroup="a" Font-Bold="true" ID="RequiredFieldValidator3" ControlToValidate="txt_contactname" ErrorMessage="<%$Resources:DisplayText,PleasefillContactNamefield %>" />

            </div>
        </div>
        <div class="col-xs-4" style="padding: 0;">
            <div class="col-xs-4 filedName"><%=Resources.DisplayText.TelNo %>*</div>
            <div class="col-xs-6" style="padding: 0;">
                <asp:TextBox runat="server" ID="txt_telno" CssClass="form-control filedDisplay" ValidationGroup="a"   MaxLength="40" />
                <asp:RequiredFieldValidator Display="Dynamic" runat="server" ForeColor="IndianRed" ValidationGroup="a" Font-Bold="true" ID="RequiredFieldValidator4" ControlToValidate="txt_telno" ErrorMessage="<%$Resources:DisplayText,PleasefillTelNofield %>" />

            </div>
        </div>

    </div>


    <br />

    <div class="row">

        <div class="col-xs-4" style="padding: 0;">
            <div class="col-xs-4 filedName"><%=Resources.DisplayText.Email %>*</div>
            <div class="col-xs-6" style="padding: 0;">
                <asp:TextBox runat="server" ID="txt_email" TextMode="Email" CssClass="form-control filedDisplay" ValidationGroup="a"  MaxLength="50"  />
                <asp:RequiredFieldValidator Display="Dynamic" runat="server" ForeColor="IndianRed" ValidationGroup="a" Font-Bold="true" ID="RequiredFieldValidator5" ControlToValidate="txt_email" ErrorMessage="<%$Resources:DisplayText,PleaseenteryourEmail %>" />

            </div>
        </div>

    </div>

    <br />
    <div class="row">

        <div class="col-xs-12" style="padding: 0;">
            <div class="col-xs-12 form-group">
                <div class="filedName"><%=Resources.DisplayText.Description %>* (Maximum 400 characters)</div>
                <%--<asp:TextBox runat="server" ID="txt_description" ValidationGroup="a" CssClass="form-control filedDisplay" TextMode="MultiLine" Rows="10" Style="max-width: 500px;" />--%>
                 <textarea cols="80" id="txt_description" runat="server" name="editor1" rows="10"> </textarea>                
                    <asp:HiddenField ID="HiddenField2" runat="server" Value="" /> 
                <%--<asp:RequiredFieldValidator Display="Dynamic" runat="server" ForeColor="IndianRed" ValidationGroup="a" Font-Bold="true" ID="RequiredFieldValidator6" ControlToValidate="txt_description" ErrorMessage="<%$Resources:DisplayText,PleasefillDescriptionfield %>" />--%>

            </div>
        </div>

    </div>

    <br />

    <div class="row col-md-4 col-xs-4">
        <asp:Button Visible="true" ID="btn_PeopleAndJob_cancel" CssClass="btn btn-danger pull-right contentButton" runat="server" Text="<%$Resources:DisplayText,Cancel %>" OnClick="btn_PeopleAndJob_cancel_Click" Style="margin-right: 10px;" />
        <asp:Button Visible="false" ID="btn_PeopleAndJob_save" CssClass="btn btn-warning pull-right contentButton" runat="server" ValidationGroup="a"  OnClientClick="getValueFromHtmlEditor();"  Text="<%$Resources:DisplayText,Update %>" OnClick="btn_PeopleAndJob_save_Click" Style="margin-right: 10px;" />
        <asp:Button ID="btn_PeopleAndJob_add" Visible="false" CssClass="btn btn-primary pull-right contentButton" ValidationGroup="a" runat="server"  OnClientClick="getValueFromHtmlEditor();" Text="<%$Resources:DisplayText,Add %>" OnClick="btn_PeopleAndJob_add_Click" Style="margin-right: 10px;" />

    </div>


    <script type="text/javascript">
        
        function loadCkEditor() {
             
            CKEDITOR.replace('MainContent_txt_description', { 
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
                removeButtons: 'Source,Print,NewPage,Preview,Templates,Replace,Blockquote,CreateDiv,Image,Flash,Smiley,PageBreak,ShowBlocks,About,Maximize'
            });


        }

        function getValueFromHtmlEditor() {
            var value = CKEDITOR.instances['MainContent_txt_description'].getData();
            var x = $("#MainContent_txt_description")[0].innerHTML;  
            $('#MainContent_HiddenField2').val(value); 
        }

        function bindDateTime() {
            $('#datetimepicker2').datetimepicker({
                format: 'DD/MM/YYYY'
            });
        }
        $(function () {
            $('#datetimepicker2').datetimepicker({
                format: 'DD/MM/YYYY'
            });
        });
    </script>
    <script type="text/javascript">
        
        function ShowMessage() {
            alert('Data inserted succssfuly');
            window.location.href = 'PeopleAndJobDB.aspx';
        }

    </script>

</asp:Content>
