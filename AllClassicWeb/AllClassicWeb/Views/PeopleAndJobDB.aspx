<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PeopleAndJobDB.aspx.cs" Inherits="AllClassicWeb.Views.PeopleAndJobDB" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel runat="server">
        <ContentTemplate>


            <link href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/css/bootstrap-datetimepicker.css" rel="stylesheet" />
            <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.js"></script>
            <script src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.15.2/moment.min.js"></script>
            <script src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.js"></script>
            <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>


            <div class="conbox">

                <div class="con_section1">
                    <div class="subtit">Agora</div>
                    <ul class="submenu">
                        <li><a runat="server" href="~/Views/AuditionDB.aspx"><%= Resources.DisplayText.Auditions %></a></li>
                        <li><a runat="server" href="~/Views/ConcoursDB.aspx"><%= Resources.DisplayText.Concours %></a></li>
                        <li><a runat="server" href="~/Views/RepairShopDB.aspx"><%= Resources.DisplayText.RepairShop %></a></li>
                        <li><a runat="server" href="~/Views/MusicShopDB.aspx"><%= Resources.DisplayText.MusicShop %></a></li>
                        <li><a runat="server" href="~/Views/ConcertVenuDB.aspx"><%= Resources.DisplayText.ConcertVenue %></a></li>
                        <li class="on"><a runat="server" href="~/Views/PeopleAndJobDB.aspx"><%= Resources.DisplayText.PeopleOrJob %></a></li>
                        <li><a runat="server" href="~/Views/QADbNew.aspx">Q&amp;A</a></li>
                    </ul>
                </div>

                <div class="con_section2">

                    <h2><%= Resources.DisplayText.PeopleOrJob %></h2>

                    <div class="conlist">
                        <ul class="agora">
                            <li>
                                <%=Resources.DisplayText.PeopleOrJob %>
                                <asp:DropDownList ID="DropDownList1_type" runat="server" Style="display: inline-block;">
                                    <asp:ListItem Value="0" Text="ALL"></asp:ListItem>
                                    <asp:ListItem Value="1" Text="<%$Resources:DisplayText,Job %>"></asp:ListItem>
                                    <asp:ListItem Value="2" Text="<%$Resources:DisplayText,People %>"></asp:ListItem>
                                </asp:DropDownList>
                            </li>
                            <li>
                                <%=Resources.DisplayText.Title %>
                                <asp:TextBox runat="server" ID="txt_title" CssClass="form-control filedDisplay" Style="display: inline-block;" /></li>
                            <li>
                                <%= Resources.DisplayText.City %>

                                <asp:DropDownList ID="DropDownList3_city" runat="server" class="form-control filedDisplay" Style="display: inline-block;" AutoPostBack="false" DataSourceID="SqlDataSource1_city" DataTextField="SubCode" DataValueField="LookUpID"></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource1_city" runat="server" ConnectionString="<%$ ConnectionStrings:AllClassicDBConnectionString %>" SelectCommand="
                                SELECT LookUpID=-1, MainCode='ALL', SubCode='ALL' 
                                union
                                SELECT LookUpID, MainCode, SubCode 
FROM Main.LookUpTbl
where maincode='City'
"></asp:SqlDataSource>
                            </li>
                            <li>
                                <%= Resources.DisplayText.ValidDate %>
                                <div class='input-group date' id='datetimepicker3' style="display: inline-flex;">
                                    <input type='text' class="form-control filedDisplay" runat="server" ontextchanged="selectedFilterChanged" id="datetimepicker3" style="display: inline-block; border-right-width: 0px; width: 100px;" />
                                    <span class="input-group-addon" style="flex-wrap: wrap; width: auto; display: inline-block; padding-left: 12px; margin-left: -5px; padding-top: 9px; padding-bottom: 6px;">
                                        <span class="glyphicon glyphicon-calendar"></span>
                                    </span>
                                </div>
                            </li>
                        </ul>
                        <div class="btn5">
                            <asp:LinkButton ID="inquiry" runat="server" OnClick="selectedFilterChanged" Text="<%$Resources:DisplayText, Inquiry %>" />
                        </div>


                        <asp:SqlDataSource ID="SqlDataSource1_getrecent20artists" runat="server" ConnectionString="<%$ ConnectionStrings:AllClassicDBConnectionString %>" SelectCommand="
select p.*, c.subcode as cityname, u.FullName userName,U.EmailID as useremailid from Auxiliary.PeopleAndJobTbl p
            left join (
            SELECT LookUpID, MainCode, SubCode 
FROM Main.LookUpTbl
where maincode='City'
            ) c on c.LookUpID=p.city
        left  join Main.UserTbl u on u.UserID=p.UserID
order by UpdateTimeStamp desc"></asp:SqlDataSource>
                        <div style="max-height: 250px; overflow-y: scroll; width: 100%;">

                            <table>
                                <thead>
                                    <tr>
                                        <th><%= Resources.DisplayText.PeopleOrJob %> </th>
                                        <th><%= Resources.DisplayText.Title %> </th>
                                        <th><%= Resources.DisplayText.ValidDate %> </th>
                                        <th><%= Resources.DisplayText.City %> </th>
                                        <th><%= Resources.DisplayText.PosterEmailID %> </th>
                                    </tr>
                                </thead>
                                <tbody>



                                    <asp:Repeater runat="server" ID="artistPageRepeater" DataSourceID="SqlDataSource1_getrecent20artists">

                                        <ItemTemplate>
                                            <tr>
                                                <td class="td2"><%# (Eval("PeopleOrJob")).ToString()=="1"? Resources.DisplayText.Job :Resources.DisplayText.People %></td>
                                                <td class="td2"><%# Eval("Title") %></td>
                                                <td class="td2"><%# DataBinder.Eval(Container.DataItem,"ValidDate","{0:d/M/yyyy}") %></td>
                                                <td class="td2"><%# Eval("cityname") %></td>
                                                <td class="td2"><%# Eval("useremailid") %></td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>


                                </tbody>
                            </table>
                        </div>

                    </div>

                    <div class="agoralist2">

                        <asp:ListView runat="server" ID="collegeListContainer" DataKeyNames="PeopleAndJobID" DataSourceID="SqlDataSource1_Collegelist" GroupItemCount="3" Style="width: 100%;" OnItemDataBound="collegeListContainer_OnItemDataBound">

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

                                <li>
                                    <div class="name">
                                        <%# (Eval("Title")) .ToString().Length>15?
                                        (Eval("Title")) .ToString().Substring(0,15)+ " ....":
                                        (Eval("Title")) .ToString()%>
                                    </div>
                                    <ul class="txt">
                                        <li><span>- <%# Resources.DisplayText.PeopleOrJob %> :</span><%# (Eval("PeopleOrJob")).ToString()=="1"? Resources.DisplayText.Job :Resources.DisplayText.People %></li>
                                        <li><span>- <%# Resources.DisplayText.ValidDate %> :</span><%# DataBinder.Eval(Container.DataItem,"ValidDate","{0:d/M/yyyy}") %></li>
                                        <li><span>- <%# Resources.DisplayText.City %> :</span><%#Eval("cityname") %></li>
                                        <li><span>- <%# Resources.DisplayText.ContactName %> :</span><%#Eval("ContactName") %></li>
                                        <li><span>- <%# Resources.DisplayText.TelNo %> :</span><%#Eval("TelNO") %></li>
                                        <li><span>- <%# Resources.DisplayText.Email %></span><%#Eval("EmailID") %></li>
                                        <li><span>- <a data-toggle="modal" data-target="#myModal<%#Eval("PeopleAndJobID")%>"><%# Resources.DisplayText.Seemore %></span></li>
                                        <li>
                                            <asp:LinkButton runat="server" Style="display: inline-block" ID="edit" OnCommand="editClicked" CommandArgument='<%# Eval("PeopleAndJobID") %>'><%= Resources.DisplayText.Edit %></asp:LinkButton>
                                            <asp:LinkButton runat="server" Style="display: inline-block" ID="delete" OnClientClick='<%# "deletebtnclicked(" +Eval("PeopleAndJobID") + " );" %>' Text="<%$Resources:DisplayText,delete %>"></asp:LinkButton>
                                        </li>
                                    </ul>
                                </li>


                                <!-- Modal -->
                                <div id="myModal<%#Eval("PeopleAndJobID")%>" class="modal fade" role="dialog">
                                    <div class="modal-dialog">

                                        <!-- Modal content-->
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                <h4 class="modal-title"><%# (Eval("PeopleOrJob")).ToString()=="1"? Resources.DisplayText.Job :Resources.DisplayText.People %>
                                                                - <%# (Eval("Title")) .ToString().Length>15?  (Eval("Title")) .ToString().Substring(0,15)+ " ....":  (Eval("Title")) .ToString()%></h4>
                                            </div>
                                            <div class="modal-body">
                                                <p><%#Server.HtmlDecode(Eval("Description").ToString()) %></p>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                            </div>
                                        </div>

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
select p.*, c.subcode as cityname from Auxiliary.PeopleAndJobTbl p
            left join (
            SELECT LookUpID, MainCode, SubCode 
FROM Main.LookUpTbl
where maincode='City'
            ) c on c.LookUpID=p.city
order by UpdateTimeStamp desc"></asp:SqlDataSource>
                    </div>



                    <div>
                        <asp:Button runat="server" ID="btn_addNew" CssClass="btn btn-success pull-right contentButton" Text="<%$Resources:DisplayText,AddNewData %>" OnClick="onclick_btn_addNew" />
                    </div>
                </div>

            </div>


            <br />





        </ContentTemplate>
    </asp:UpdatePanel>

    <script type="text/javascript">
        function bindDateTime() {
            $('#datetimepicker3').datetimepicker({
                format: 'DD/MM/YYYY'
            });
        }
        $(function () {
            $('#datetimepicker3').datetimepicker({
                format: 'DD/MM/YYYY'
            });
        });


        function deletebtnclicked(id) {
            var txt;
            if (confirm('Are you sure you want to delete?')) {
                txt = "You pressed OK!";

                $.ajax({
                    type: "POST",
                    url: "PeopleAndJobDB.aspx/DeleteEntry", //Pagename/Functionname
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

    <style>
        /*.rowwithbottomborder > tr > td {
            border-bottom: 1px solid #eaeaea;
            padding-bottom: 10px;
            padding-right: 5px;
            color: black !important;
        }

        .shadowedbox_hover {
            background-color: #d3d3d31f;
             box-shadow: 3px 3px 3px #d0d0d0 !important; 
            box-shadow: 5px 5px 5px 3px #d0d0d0 !important;
        }*/
    </style>

</asp:Content>
