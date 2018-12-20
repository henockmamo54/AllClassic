<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PeopleAndJobDB.aspx.cs" Inherits="AllClassicWeb.Views.PeopleAndJobDB" %>

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
                <div class=" col-xs-12">

                    <div class="pull-right" style="padding: 0px;">
                        <asp:Button ID="inquiry" runat="server" CssClass="btn btn-primary pull-right contentButton" OnClick="selectedFilterChanged" Text="<%$Resources:DisplayText, Inquiry %>" />
                    </div>




                    <div class="pull-right" style="padding: 0px; padding-right: 15px;">

                        <span style="display: inline-block;padding-right: 5px;" class="filedName"><%= Resources.DisplayText.ValidDate %> </span>
                        <div style="display: inline-block;">
                            <div class='input-group date' id='datetimepicker3' style="display: flex;">
                                <input type='text' class="form-control filedDisplay" runat="server" ontextchanged="selectedFilterChanged" id="datetimepicker3" style="display: inline-block; border-right-width: 0px; width:100px;" />
                                <span class="input-group-addon" style="flex-wrap: wrap; width: auto; display: inline-block; padding-left: 12px; margin-left: -5px; padding-top: 9px; padding-bottom: 6px;">
                                    <span class="glyphicon glyphicon-calendar"></span>
                                </span>
                            </div>
                        </div>
                    </div>

                    <div class="pull-right" style="padding: 0px; padding-right: 15px;">

                        <span style="display: inline-block;padding-right: 5px;" class="filedName"><%= Resources.DisplayText.City %> </span>

                        <asp:DropDownList ID="DropDownList3_city" runat="server" class="form-control filedDisplay" Style="width: 100px;display: inline-block;" AutoPostBack="false" DataSourceID="SqlDataSource1_city" DataTextField="SubCode" DataValueField="LookUpID"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1_city" runat="server" ConnectionString="<%$ ConnectionStrings:AllClassicDBConnectionString %>" SelectCommand="
                                SELECT LookUpID=-1, MainCode='ALL', SubCode='ALL' 
                                union
                                SELECT LookUpID, MainCode, SubCode 
FROM Main.LookUpTbl
where maincode='City'
"></asp:SqlDataSource>

                    </div>


                    <div class="pull-right" style="padding: 0px; padding-right: 15px;">
                        <span style="display: inline-block;padding-right: 5px;" class="filedName"><%=Resources.DisplayText.Title %></span>
                        <asp:TextBox runat="server" ID="txt_title" CssClass="form-control filedDisplay" Style="display: inline-block; width: 150px;" />

                    </div>

                    <div class="pull-right" style="padding: 0px; padding-right: 15px;">
                        <span style="display: inline-block;padding-right: 5px;" class="filedName"><%=Resources.DisplayText.PeopleOrJob %></span>
                        <asp:DropDownList ID="DropDownList1_type" runat="server" class="form-control filedDisplay" Style="display: inline-block; width: 100px;">
                            <asp:ListItem Value="0" Text="ALL"></asp:ListItem>
                            <asp:ListItem Value="1" Text="<%$Resources:DisplayText,Job %>"></asp:ListItem>
                            <asp:ListItem Value="2" Text="<%$Resources:DisplayText,People %>"></asp:ListItem>
                        </asp:DropDownList>

                    </div>


                </div>

            </div>

            <br />

            <div class="row" style="padding-right: 15px;">
                <asp:SqlDataSource ID="SqlDataSource1_getrecent20artists" runat="server" ConnectionString="<%$ ConnectionStrings:AllClassicDBConnectionString %>" SelectCommand="
select p.*, c.subcode as cityname, u.FullName userName,U.EmailID as useremailid from Auxiliary.PeopleAndJobTbl p
            left join (
            SELECT LookUpID, MainCode, SubCode 
FROM Main.LookUpTbl
where maincode='City'
            ) c on c.LookUpID=p.city
        left  join Main.UserTbl u on u.UserID=p.UserID
order by UpdateTimeStamp desc"></asp:SqlDataSource>
                <div class="col-xs-12" style="border: 1px solid lightgray; border-radius: 5px; max-height: 250px; height: 250px; overflow-y: scroll;">

                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th class="contentHeader"><%= Resources.DisplayText.PeopleOrJob %> </th>
                                <th class="contentHeader"><%= Resources.DisplayText.Title %> </th>
                                <th class="contentHeader"><%= Resources.DisplayText.ValidDate %> </th>
                                <th class="contentHeader"><%= Resources.DisplayText.City %> </th>
                                <th class="contentHeader"><%= Resources.DisplayText.PosterEmailID %> </th>
                            </tr>
                        </thead>
                        <tbody>



                            <asp:Repeater runat="server" ID="artistPageRepeater" DataSourceID="SqlDataSource1_getrecent20artists">

                                <ItemTemplate>
                                    <tr class="Contentdisplay">
                                        <td><%# (Eval("PeopleOrJob")).ToString()=="1"? Resources.DisplayText.Job :Resources.DisplayText.People %></td>
                                        <td><%# Eval("Title") %></td>
                                        <td><%# DataBinder.Eval(Container.DataItem,"ValidDate","{0:d/M/yyyy}") %></td>
                                        <td><%# Eval("cityname") %></td>
                                        <td><%# Eval("useremailid") %></td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>


                        </tbody>
                    </table>
                </div>
            </div>


            <div class="row">
                <hr />
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
                        <div class="col-md-4 col-xs-4 " style="margin-bottom: 1em;">

                            <div class="panel panel-success shadowedPanel ">
                                <div class="panel-heading contentHeader" style="background-color: #eaf2f7;">
                                    <h4><%# (Eval("Title")) .ToString().Length>15?
                                        (Eval("Title")) .ToString().Substring(0,15)+ " ....":
                                        (Eval("Title")) .ToString()%></h4>
                                </div>
                                <div class="panel-body">
                                    <table>
                                        <tbody class="rowwithbottomborder ">
                                            <tr>
                                                <td class="filedName"><%# Resources.DisplayText.PeopleOrJob %>:</td>
                                                <td class="filedDisplay"><%# (Eval("PeopleOrJob")).ToString()=="1"? Resources.DisplayText.Job :Resources.DisplayText.People %></td>

                                            </tr>
                                            <tr>
                                                <td class="filedName"><%# Resources.DisplayText.ValidDate %>:</td>
                                                <td class="filedDisplay"><%# DataBinder.Eval(Container.DataItem,"ValidDate","{0:d/M/yyyy}") %></td>
                                            </tr>
                                            <tr>
                                                <td class="filedName"><%# Resources.DisplayText.City %>:</td>
                                                <td class="filedDisplay"><%#Eval("cityname") %></td>
                                            </tr>

                                            <tr>
                                                <td class="filedName"><%# Resources.DisplayText.ContactName %>:</td>
                                                <td class="filedDisplay"><%#Eval("ContactName") %></td>
                                            </tr>
                                            <tr>
                                                <td class="filedName"><%# Resources.DisplayText.TelNo %>:</td>
                                                <td class="filedDisplay"><%#Eval("TelNO") %></td>
                                            </tr>
                                            <tr>
                                                <td class="filedName"><%# Resources.DisplayText.Email %>:</td>
                                                <td class="filedDisplay"><%#Eval("EmailID") %></td>
                                            </tr>
                                            <%--<tr>
                                                <td class="filedName"><%# Resources.DisplayText.Description %>:</td>
                                                <td class="filedDisplay">  <%#Server.HtmlDecode(Eval("Description").ToString()) %> </td>
                                            </tr>--%>
                                            <tr>
                                                <td>
                                                    <a class="Contentdisplay" data-toggle="modal" data-target="#myModal<%#Eval("PeopleAndJobID")%>"><%# Resources.DisplayText.Seemore %> </a>
                                                </td>
                                                <td>
                                                    <asp:LinkButton runat="server" ID="edit" OnCommand="editClicked" CommandArgument='<%# Eval("PeopleAndJobID") %>'><%= Resources.DisplayText.Edit %></asp:LinkButton>
                                                    <asp:LinkButton runat="server" CssClass="Contentdisplay" Style="margin-left: 5px;" ID="delete" OnClientClick='<%# "deletebtnclicked(" +Eval("PeopleAndJobID") + " );" %>' Text="<%$Resources:DisplayText,delete %>"></asp:LinkButton>

                                                </td>
                                            </tr>

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

                                        </tbody>
                                    </table>

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

            <div class="row">
                <asp:Button runat="server" ID="btn_addNew" CssClass="btn btn-success pull-right contentButton" Text="<%$Resources:DisplayText,AddNewData %>" OnClick="onclick_btn_addNew" />
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>

    <script type="text/javascript">
        function bindDateTime() {
            $('#datetimepicker3').datetimepicker({
                format: 'MM/DD/YYYY'
            });
        }
        $(function () {
            $('#datetimepicker3').datetimepicker({
                format: 'MM/DD/YYYY'
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
