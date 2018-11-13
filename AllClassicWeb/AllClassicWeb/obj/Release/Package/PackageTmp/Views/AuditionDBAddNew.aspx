<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AuditionDBAddNew.aspx.cs" Inherits="AllClassicWeb.Views.AuditionDBAddNew" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <link href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/css/bootstrap-datetimepicker.css" rel="stylesheet" />
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.15.2/moment.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>

    <h4>New Data Input</h4>
    <hr />

    <div class="row">

        <div class="col-xs-6" style="padding: 0;">
            <div class="col-xs-4"><%=Resources.DisplayText.Organizer %></div>
            <div class="col-xs-6" style="padding: 0;">
                <asp:TextBox runat="server" ID="txt_organizer" CssClass="form-control" />
            </div>
        </div>
        <div class="col-xs-6" style="padding: 0;">
            <div class="col-xs-4"><%=Resources.DisplayText.Title %></div>
            <div class="col-xs-6" style="padding: 0;">
                <asp:TextBox runat="server" ID="txt_title" CssClass="form-control" />
            </div>
        </div>
    </div>
    <div class="row">
        <br />
        <div class="col-xs-6" style="padding: 0;">
            <div class="col-xs-4"><%=Resources.DisplayText.FromDate %></div>
            <div class="col-xs-6" style="padding: 0;">

                <div class='input-group date' id='datetimepicker2' style="display: flex;">
                    <input type='text' class="form-control" runat="server" id="datetimepicker2" style="display: inline-block; border-right-width: 0px;" />
                    <span class="input-group-addon" style="flex-wrap: wrap; width: auto; display: inline-block; padding-left: 12px; margin-left: -5px; padding-top: 9px; padding-bottom: 6px;">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                </div>
            </div>
        </div>
        <div class="col-xs-6" style="padding: 0;">
            <div class="col-xs-4"><%=Resources.DisplayText.ToDate %></div>
            <div class="col-xs-6" style="padding: 0;">

                <div class='input-group date' id='datetimepicker3' style="display: flex;">
                    <input type='text' class="form-control" runat="server" id="datetimepicker3" style="display: inline-block; border-right-width: 0px;" />
                    <span class="input-group-addon" style="flex-wrap: wrap; width: auto; display: inline-block; padding-left: 12px; margin-left: -5px; padding-top: 9px; padding-bottom: 6px;">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                </div>
            </div>
        </div>

    </div>

    <div class="row">
        <br />
        <div class="col-xs-12"><%= Resources.DisplayText.AuditionOutlineandApplicationInfo %></div>
        <div class="col-xs-12">
            <asp:TextBox runat="server" ID="txt_auditionoutline" CssClass="form-control" TextMode="MultiLine" Style="width: 500px !important;" Rows="10" />
        </div>
    </div>

    
    <div class="row col-xs-4" style="text-align:right;">
        <br />

        <asp:Button runat="server" ID="btn_addnewAudition" UseSubmitBehavior="false" OnClick="onclick_btn_addnewAudition" type="button" Text="<%$Resources:DisplayText,Add %>" class="btn btn-primary"></asp:Button>
        <asp:Button runat="server" type="button" class="btn btn-danger" data-dismiss="modal" Text="<%$Resources:DisplayText,Cancel %>"></asp:Button>
        <%--<asp:Button runat="server" ID="btn_addArticle2" OnClick="onclick_btn_addArticle" type="button" Text="Add" class="btn btn-primary" data-dismiss="modal"></asp:Button>--%>
    </div>


    <script type="text/javascript">
        document.getElementById("auditiontab").style.backgroundColor = "rgb(255, 255, 255) ";
        document.getElementById("auditiontab").style.borderRight = "none";
    </script>

    <script type="text/javascript">
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
