<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ConcoursDB.aspx.cs" Inherits="AllClassicWeb.Views.ConcoursDB" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <asp:UpdatePanel runat="server">
        <ContentTemplate>

            <link href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/css/bootstrap-datetimepicker.css" rel="stylesheet" />
            <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.js"></script>
            <script src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.15.2/moment.min.js"></script>
            <script src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.js"></script>
            <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>

            <br />

            <div class="row">
                <div class="row col-md-12 col-xs-12  col-xs-12">


                    <div class="col-md-6 col-xs-6 ">
                        <div class="col-md-4 col-xs-4" style="margin-top: 10px; margin-bottom: 10px; padding: 0;">

                            <h5 style="display: inline-block;" class="filedName"><%= Resources.DisplayText.Organizer %>  </h5>
                        </div>
                        <div class="col-md-6 col-xs-6" style="padding: 0;">
                            <asp:TextBox AutoPostBack="true" ID="txt_organizer" runat="server" CssClass="form-control" Style="display: inline-block;"></asp:TextBox>

                        </div>

                    </div>

                    <div class="col-md-6 col-xs-6 ">
                        <div class="col-md-4 col-xs-4" style="margin-top: 10px; margin-bottom: 10px; padding: 0;">

                            <h5 style="display: inline-block;" class="filedName"><%= Resources.DisplayText.Title %>  </h5>
                        </div>
                        <div class="col-md-6 col-xs-6">

                            <asp:TextBox AutoPostBack="true" ID="txt_title" runat="server" CssClass="form-control" Style="display: inline-block;"></asp:TextBox>
                        </div>
                    </div>


                    <div class="col-md-6 col-xs-6" style="padding: 0;">
                        <div class="col-md-4 col-xs-4" style="margin-top: 10px; margin-bottom: 10px;">
                            <span style="display: inline-block;" class="filedName"><%= Resources.DisplayText.FromDate %> </span>
                        </div>
                        <div class="col-md-6 col-xs-6" style="padding: 0;">
                            <div class='input-group date' id='datetimepicker2' style="display: flex; padding: 0;">
                                <input type='text' class="form-control" runat="server" ontextchanged="selectedFilterChanged" id="datetimepicker2" style="display: inline-block; border-right-width: 0px;" />
                                <span class="input-group-addon" style="flex-wrap: wrap; width: auto; display: inline-block; padding-left: 12px; margin-left: -5px; padding-top: 9px; padding-bottom: 6px;">
                                    <span class="glyphicon glyphicon-calendar"></span>
                                </span>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6 col-xs-6">
                        <div class="col-md-4 col-xs-4" style="margin-top: 10px; margin-bottom: 10px; padding: 0;">
                            <span style="display: inline-block;" class="filedName"><%= Resources.DisplayText.ToDate %> </span>
                        </div>
                        <div class="col-md-6 col-xs-6">
                            <div class='input-group date' id='datetimepicker3' style="display: flex;">
                                <input type='text' class="form-control" runat="server" ontextchanged="selectedFilterChanged" id="datetimepicker3" style="display: inline-block; border-right-width: 0px;" />
                                <span class="input-group-addon" style="flex-wrap: wrap; width: auto; display: inline-block; padding-left: 12px; margin-left: -5px; padding-top: 9px; padding-bottom: 6px;">
                                    <span class="glyphicon glyphicon-calendar"></span>
                                </span>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-12 col-xs-12">

                        <asp:Button ID="inquiry" runat="server" CssClass="btn btn-primary pull-right contentButton" OnClick="selectedFilterChanged" Text="<%$Resources:DisplayText, Inquiry %>" />
                    </div>
                </div>

            </div>

            <br />

            <div class="row" style="padding-right: 15px;">
                <asp:SqlDataSource ID="SqlDataSource1_getrecent20artists" runat="server" ConnectionString="<%$ ConnectionStrings:AllClassicDBConnectionString %>" SelectCommand="
select top 20 a.*, u.FullName userName, U.EmailID  from Auxiliary.ConcourTbl a
                    join Main.UserTbl u on u.UserID=a.UserID
order by UpdateTimeStamp desc"></asp:SqlDataSource>
                <div class="col-xs-12" style="border: 1px solid lightgray; border-radius: 5px; max-height: 250px; height: 250px; overflow-y: scroll;">

                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th class="col-xs-2 contentHeader"><strong><%= Resources.DisplayText.Organizer %></strong></th>
                                <th class="col-xs-2 contentHeader"><strong><%= Resources.DisplayText.Title %></strong></th>
                                <th class="col-xs-2 contentHeader"><strong><%= Resources.DisplayText.FromDate %></strong></th>
                                <th class="col-xs-2 contentHeader"><strong><%= Resources.DisplayText.ToDate %></strong></th>
                                <th class="col-xs-2 contentHeader"><strong><%= Resources.DisplayText.PosterEmailID %></strong></th>
                            </tr>
                        </thead>
                        <tbody>


                            <asp:Repeater runat="server" ID="artistPageRepeater" DataSourceID="SqlDataSource1_getrecent20artists">

                                <ItemTemplate>
                                    <tr>
                                        <td class="col-xs-2 Contentdisplay"><%# Eval("Title") %></td>
                                        <td class="col-xs-2 Contentdisplay"><%# Eval("Organizer") %></td>
                                        <td class="col-xs-2 Contentdisplay"><%# DataBinder.Eval(Container.DataItem,"FromDate","{0:d/M/yyyy}") %></td>
                                        <td class="col-xs-2 Contentdisplay"><%# DataBinder.Eval(Container.DataItem,"ToDate","{0:d/M/yyyy}") %></td>
                                        <td class="col-xs-2 Contentdisplay"><%# Eval("EmailID") %></td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>

                        </tbody>
                    </table>
                </div>
            </div>

            <br />
            <br />

            <div class="row">

                <asp:ListView runat="server" ID="collegeListContainer" DataKeyNames="ConcourID" DataSourceID="SqlDataSource1_Collegelist" GroupItemCount="1" Style="width: 100%;" OnItemDataBound="collegeListContainer_OnItemDataBound">

                    <EmptyDataTemplate>
                        <div class=" col-xs-12 contentHeader">
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
                        <div class="col-md-8 col-xs-8" style="margin-bottom: 0;">
                            <div>
                                <asp:Label runat="server" ID="tumbinallink" Style="text-decoration: none;">

                                    <div class="caption" style="padding-bottom: 3px;">
                                        <%--<h4 style="padding: 0px; margin: 0px; color: dimgray;">[<%# Eval("Organizer")%>] <%# Eval("Title")%></h4> <span  style="color:#a7a7a7;"> (<%# DataBinder.Eval(Container.DataItem,"UpdateTimeStamp","{0:d/M/yyyy}") %>)</span>
                                <span runat="server"><%=Resources.DisplayText.FromDate %>:  <%# DataBinder.Eval(Container.DataItem,"FromDate","{0:d/M/yyyy}") %>
                                    - <%=Resources.DisplayText.ToDate %>: <%# DataBinder.Eval(Container.DataItem,"ToDate","{0:d/M/yyyy}") %></span>
                                <br />
                                <span runat="server"><%# Eval("ConcourOutline") %> </span>
                                 <asp:LinkButton runat="server" ID="edit" OnCommand="editConcourClicked" CommandArgument='<%# Eval("ConcourID") %>'><%= Resources.DisplayText.Edit %></asp:LinkButton>                               
                                <hr style="margin-top: 5px; margin-bottom: 5px;" />--%>

                                        <h4 style="padding: 0px; margin: 0px; font-weight: 800; color: black;" class="contentHeader"><%# Eval("Title")%></h4>

                                        <span class="Contentdisplay" runat="server" style="color: #0684f1; font-size: 14px;"><%=Resources.DisplayText.FromDate %>:  <%# DataBinder.Eval(Container.DataItem,"FromDate","{0:d/M/yyyy}") %>
                                    - <%=Resources.DisplayText.ToDate %>: <%# DataBinder.Eval(Container.DataItem,"ToDate","{0:d/M/yyyy}") %></span>
                                        <br />
                                        <span class="Contentdisplay" style="color: black; font-size: 14px;"><%= Resources.DisplayText.Organizer %>: <%# Eval("Organizer")%></span>
                                        <br />
                                        <div class="Contentdisplay" runat="server" style="color: black; font-size: 14px; color: #0a0a0a; background-color: #f7f7f7; padding: 5px; border-radius: 5px;">
                                            <%#Server.HtmlDecode(Eval("ConcourOutline").ToString()) %>
                                        </div>
                                        <asp:LinkButton class="Contentdisplay" runat="server" ID="edit" OnCommand="editConcourClicked" CommandArgument='<%# Eval("ConcourID") %>'><%= Resources.DisplayText.Edit %></asp:LinkButton>
                                        <asp:LinkButton runat="server" CssClass="Contentdisplay" Style="margin-left: 5px;" ID="delete" OnClientClick='<%# "deletebtnclicked(" +Eval("ConcourID") + " );" %>' Text="<%$Resources:DisplayText,delete %>"></asp:LinkButton>

                                        <br />
                                        <span class="Contentdisplay" style="color: #a7a7a7; font-size: 10px;"><%# DataBinder.Eval(Container.DataItem,"UpdateTimeStamp","{0:d/M/yyyy}") %></span>

                                        <hr style="margin-top: 5px; margin-bottom: 5px;" />


                                    </div>

                                </asp:Label>
                            </div>
                        </div>

                    </ItemTemplate>
                    <LayoutTemplate>
                        <div class="col-xs-12" id="groupPlaceholderContainer" runat="server" style="padding: 0px;">

                            <div id="groupPlaceholder" runat="server">
                            </div>
                            <div class="col-xs-12" style="text-align: center;">
                                <asp:DataPager ID="DataPager1" runat="server" PageSize="6">
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
                <asp:SqlDataSource ID="SqlDataSource1_Collegelist" runat="server" ConnectionString="<%$ ConnectionStrings:AllClassicDBConnectionString %>" SelectCommand="
select a.*, u.FullName userName from Auxiliary.ConcourTbl a
                    join Main.UserTbl u on u.UserID=a.UserID
order by UpdateTimeStamp desc"></asp:SqlDataSource>
            </div>

            <div class="row">
                <asp:Button runat="server" ID="btn_addconcours" CssClass="btn btn-success pull-right contentButton" Text="<%$Resources:DisplayText,AddNewData %>" OnClick="onclick_btn_addConcours" />
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>


    <script type="text/javascript">

        function deletebtnclicked(id) {
            var txt;
            if (confirm('Are you sure you want to delete?')) {
                txt = "You pressed OK!";

                $.ajax({
                    type: "POST",
                    url: "ConcoursDB.aspx/DeleteConcours", //Pagename/Functionname
                    contentType: "application/json;charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ n: id }), //{ },//data
                    success: function (data) {

                        if (data.d) {

                            alert('Entry deleted!!!');
                            location.reload();
                        }

                        else {
                            alert('Entry not  deleted!!!');
                        }

                    },
                    error: function (result) {
                        console.log(result)
                        //alert("error")

                    }
                });


            } else {
                txt = "You pressed Cancel!";
            }
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
