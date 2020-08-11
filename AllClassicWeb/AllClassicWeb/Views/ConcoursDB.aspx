﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ConcoursDB.aspx.cs" Inherits="AllClassicWeb.Views.ConcoursDB" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <asp:UpdatePanel runat="server">
        <ContentTemplate>

            <%--<link href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/css/bootstrap-datetimepicker.css" rel="stylesheet" />
            <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.js"></script>
            <script src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.15.2/moment.min.js"></script>
            <script src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.js"></script>
            <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>--%>


            <link href="https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css"
                rel="stylesheet">
            <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
            <script src="https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>

            <script>
                $(function () {
                    bindDateTime();
                });

                function bindDateTime() {
                    $("#MainContent_datetimepicker2").datepicker({
                        showOn: "button",
                        buttonImage: "../Content/img/day.png",
                        dateFormat: "mm/dd/yy",
                        buttonImageOnly: true
                    });

                    $("#MainContent_datetimepicker3").datepicker({
                        showOn: "button",
                        buttonImage: "../Content/img/day.png",
                        dateFormat: "mm/dd/yy",
                        buttonImageOnly: true
                    });
                }
            </script>


            <div class="conbox">


                <div class="con_section1">
                    <div class="subtit">Agora</div>
                    <ul class="submenu">
                        <li><a runat="server" href="~/Views/AuditionDB.aspx"><%= Resources.DisplayText.Auditions %></a></li>
                        <li class="on"><a runat="server" href="~/Views/ConcoursDB.aspx"><%= Resources.DisplayText.Concours %></a></li>
                        <li><a runat="server" href="~/Views/RepairShopDB.aspx"><%= Resources.DisplayText.RepairShop %></a></li>
                        <li><a runat="server" href="~/Views/MusicShopDB.aspx"><%= Resources.DisplayText.MusicShop %></a></li>
                        <li><a runat="server" href="~/Views/ConcertVenuDB.aspx"><%= Resources.DisplayText.ConcertVenue %></a></li>
                        <li><a runat="server" href="~/Views/PeopleAndJobDB.aspx"><%= Resources.DisplayText.PeopleOrJob %></a></li>
                        <li><a runat="server" href="~/Views/QADbNew.aspx">Q&amp;A</a></li>
                    </ul>
                </div>

                <div class="con_section2">

                    <h2><%= Resources.DisplayText.Concours %></h2>

                    <div class="conlist">
                        <ul class="agora">
                            <li><%= Resources.DisplayText.Title %>
                                <asp:TextBox AutoPostBack="true" ID="txt_title" runat="server" Style="display: inline-block;"></asp:TextBox>
                            <li><%= Resources.DisplayText.Organizer %>
                                <asp:TextBox AutoPostBack="true" ID="txt_organizer" runat="server" Style="display: inline-block;"></asp:TextBox>
                            <li><%= Resources.DisplayText.FromDate %>
                                <input runat="server" type="text" id="datetimepicker2">
                            </li>
                            <li><%= Resources.DisplayText.ToDate %>

                                <input runat="server" type="text" id="datetimepicker3">
                            </li>
                        </ul>
                        <div class="btn3">
                            <asp:LinkButton ID="inquiry" runat="server" OnClick="selectedFilterChanged" Text="<%$Resources:DisplayText, Inquiry %>" />
                        </div>


                        <asp:SqlDataSource ID="SqlDataSource1_getrecent20artists" runat="server" ConnectionString="<%$ ConnectionStrings:AllClassicDBConnectionString %>" SelectCommand="
select top 20 a.*, u.FullName userName, U.EmailID  from Auxiliary.ConcourTbl a
                    join Main.UserTbl u on u.UserID=a.UserID
order by UpdateTimeStamp desc"></asp:SqlDataSource>
                        <table>
                            <thead>
                                <tr>
                                    <th><strong><%= Resources.DisplayText.Organizer %></strong></th>
                                    <th><strong><%= Resources.DisplayText.Title %></strong></th>
                                    <th><strong><%= Resources.DisplayText.FromDate %></strong></th>
                                    <th><strong><%= Resources.DisplayText.ToDate %></strong></th>
                                    <th><strong><%= Resources.DisplayText.PosterEmailID %></strong></th>
                                </tr>
                            </thead>
                            <tbody>


                                <asp:Repeater runat="server" ID="artistPageRepeater" DataSourceID="SqlDataSource1_getrecent20artists">

                                    <ItemTemplate>
                                        <tr>
                                            <td><%# Eval("Title") %></td>
                                            <td><%# Eval("Organizer") %></td>
                                            <td><%# DataBinder.Eval(Container.DataItem,"FromDate","{0:d/M/yyyy}") %></td>
                                            <td><%# DataBinder.Eval(Container.DataItem,"ToDate","{0:d/M/yyyy}") %></td>
                                            <td><%# Eval("EmailID") %></td>
                                        </tr>
                                    </ItemTemplate>
                                    <AlternatingItemTemplate>
                                        <tr>
                                            <td class="td2"><%# Eval("Title") %></td>
                                            <td class="td2"><%# Eval("Organizer") %></td>
                                            <td class="td2"><%# DataBinder.Eval(Container.DataItem,"FromDate","{0:d/M/yyyy}") %></td>
                                            <td class="td2"><%# DataBinder.Eval(Container.DataItem,"ToDate","{0:d/M/yyyy}") %></td>
                                            <td class="td2"><%# Eval("EmailID") %></td>
                                        </tr>
                                    </AlternatingItemTemplate>
                                </asp:Repeater>

                            </tbody>
                        </table>


                    </div>


                    <div class="agoralist1">


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
                                <div>
                                    <div>
                                        <asp:Label runat="server" ID="tumbinallink" Style="text-decoration: none;">

                                            <li>
                                                <div class="name"><%# Eval("Title")%></div>
                                                <ul class="txt">
                                                    <li><span><%= Resources.DisplayText.Organizer %>: <%# Eval("Organizer")%> [<%=Resources.DisplayText.FromDate %>:  <%# DataBinder.Eval(Container.DataItem,"FromDate","{0:d/M/yyyy}") %>
                                    - <%=Resources.DisplayText.ToDate %>: <%# DataBinder.Eval(Container.DataItem,"ToDate","{0:d/M/yyyy}") %>] </span></li>

                                                    <li><%#Server.HtmlDecode(Eval("ConcourOutline").ToString()) %><br>
                                                    </li>
                                                </ul>
                                                <a class="Contentdisplay" data-toggle="modal" data-target="#myModal<%#Eval("ConcourID")%>"><%# Resources.DisplayText.Seemore %> </a>
                                                <asp:LinkButton class="Contentdisplay" runat="server" ID="edit" OnCommand="editConcourClicked" CommandArgument='<%# Eval("ConcourID") %>'><%= Resources.DisplayText.Edit %></asp:LinkButton>
                                                <asp:LinkButton runat="server" CssClass="Contentdisplay" Style="margin-left: 5px;" ID="delete" OnClientClick='<%# "deletebtnclicked(" +Eval("ConcourID") + " );" %>' Text="<%$Resources:DisplayText,delete %>"></asp:LinkButton>

                                                <span class="Contentdisplay" style="color: #a7a7a7; font-size: 10px; float: right;"><%# DataBinder.Eval(Container.DataItem,"UpdateTimeStamp","{0:d/M/yyyy}") %></span>
                                            </li>


                                            <div class="caption" style="padding-bottom: 3px;">
                                                <br />

                                                <br />
                                                <div>
                                                </div>


                                                <hr style="margin-top: 5px; margin-bottom: 10px; border-color: lightgray;" />



                                                <!-- Modal -->
                                                <div id="myModal<%#Eval("ConcourID")%>" class="modal fade" role="dialog">
                                                    <div class="modal-dialog">

                                                        <!-- Modal content-->
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                                <h4 class="modal-title"><%# Eval("Title")%> - <%# Resources.DisplayText.AuditionOutlineandApplicationInfo %></h4>
                                                            </div>
                                                            <div class="modal-body">
                                                                <span><%#Server.HtmlDecode(Eval("ConcourOutline").ToString()) %></span>
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>




                                            </div>

                                        </asp:Label>
                                    </div>
                                </div>

                            </ItemTemplate>
                            <LayoutTemplate>
                                <div class="col-xs-12" id="groupPlaceholderContainer" runat="server" style="padding: 0px;">

                                    <div id="groupPlaceholder" runat="server">
                                    </div>
                                    <div class="col-xs-12" style="text-align: center; margin-top: 10px;">
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

                </div>


                <div class="row">
                    <asp:Button runat="server" ID="btn_addconcours" CssClass="btn btn-success pull-right contentButton" Text="<%$Resources:DisplayText,AddNewData %>" OnClick="onclick_btn_addConcours" />
                </div>

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

    </script>

</asp:Content>
