<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ConcoursDBAddNew.aspx.cs" Inherits="AllClassicWeb.Views.ConcoursDBAddNew" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <link href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/css/bootstrap-datetimepicker.css" rel="stylesheet" />
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.15.2/moment.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>

    <br />


    <h4 runat="server" id="headerlabelcontainer"><%= Resources.DisplayText.NewDataInputScreen %></h4>
    <hr style="margin-top: 0px;" />


    <div class="row ">

        <div class="row ">

            <div class="col-md-8 col-xs-8 userregisterinfo">
                <br />
                <div class="col-md-4 col-xs-4"><%= Resources.DisplayText.Organizer %></div>
                <div class="col-md-8 col-xs-8">
                    <asp:TextBox ID="txt_organizer" runat="server" class="form-control"></asp:TextBox>

                </div>
                <br />
            </div>
        </div>
        <div class="row ">
            <div class="col-md-8 col-xs-8 userregisterinfo">
                <br />
                <div class="col-md-4 col-xs-4"><%= Resources.DisplayText.Title %></div>
                <div class="col-md-8 col-xs-8">
                    <asp:TextBox ID="txt_title" runat="server" class="form-control"></asp:TextBox>
                </div>
                <br />
            </div>
        </div>
        <div class="row ">
            <div class="col-md-8 col-xs-8 userregisterinfo">
                <br />
                <div class="col-md-4 col-xs-4"><%= Resources.DisplayText.FromDate %></div>
                <div class="col-md-8 col-xs-8">
                    <div class='input-group date' id='datetimepicker2' style="display: flex; padding: 0;">
                        <input type='text' class="form-control" runat="server" ontextchanged="selectedFilterChanged" id="datetimepicker2" style="display: inline-block; border-right-width: 0px; width: 61%;" />
                        <span class="input-group-addon" style="flex-wrap: wrap; width: auto; display: inline-block; padding-left: 12px; margin-left: -5px; padding-top: 9px; padding-bottom: 6px;">
                            <span class="glyphicon glyphicon-calendar"></span>
                        </span>
                    </div>
                </div>
                <br />
            </div>
        </div>
        <div class="row ">
            <div class="col-md-8 col-xs-8 userregisterinfo">
                <br />
                <div class="col-md-4 col-xs-4"><%= Resources.DisplayText.ToDate %></div>
                <div class="col-md-8 col-xs-8">
                    <div class='input-group date' id='datetimepicker3' style="display: flex; padding: 0;">
                        <input type='text' class="form-control" runat="server" ontextchanged="selectedFilterChanged" id="datetimepicker3" style="display: inline-block; border-right-width: 0px; width: 61%;" />
                        <span class="input-group-addon" style="flex-wrap: wrap; width: auto; display: inline-block; padding-left: 12px; margin-left: -5px; padding-top: 9px; padding-bottom: 6px;">
                            <span class="glyphicon glyphicon-calendar"></span>
                        </span>
                    </div>
                </div>
                <br />
            </div>
        </div>
        <div class="row ">
            <div class="col-md-8 col-xs-8 userregisterinfo">
                <br />
                <div class="col-md-4 col-xs-4"><%= Resources.DisplayText.ConcourOutline %></div>
                <div class="col-md-8 col-xs-8">
                    <asp:TextBox ID="txt_outline" runat="server" class="form-control" TextMode="MultiLine" Rows="15"></asp:TextBox>
                </div>
                <br />
            </div>
        </div>
        <br />
        <div class="row col-md-4 col-xs-4">
            <asp:Button Visible="true" ID="btn_concours_cancel" CssClass="btn btn-danger pull-right" runat="server" Text="<%$Resources:DisplayText,Cancel %>" OnClick="btn_concours_cancel_Click" Style="margin-right: 10px;" />
            <%--<asp:Button Visible="true" ID="btn_concours_save" CssClass="btn btn-warning pull-right" runat="server" Text="<%$Resources:DisplayText,Update %>" OnClick="btn_concours_save_Click" Style="margin-right: 10px;" />--%>
            <asp:Button ID="btn_concours_add" CssClass="btn btn-primary pull-right" runat="server" Text="<%$Resources:DisplayText,Add %>" OnClick="btn_concours_add_Click" Style="margin-right: 10px;" />

        </div>

    </div>

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
