<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="QADbNew.aspx.cs" Inherits="AllClassicWeb.QADbNew" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel runat="server">
        <ContentTemplate>

            <link href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/css/bootstrap-datetimepicker.css" rel="stylesheet" />
            <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.js"></script>
            <script src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.15.2/moment.min.js"></script>
            <script src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.js"></script>
            <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>


            <!-- conbox --------------------------------------->
            <div class="conbox">

                <div class="con_section1">
                    <div class="subtit">Agora</div>
                    <ul class="submenu">
                        <li><a runat="server" href="~/Views/AuditionDB.aspx"><%= Resources.DisplayText.Auditions %></a></li>
                        <li><a runat="server" href="~/Views/ConcoursDB.aspx"><%= Resources.DisplayText.Concours %></a></li>
                        <li><a runat="server" href="~/Views/RepairShopDB.aspx"><%= Resources.DisplayText.RepairShop %></a></li>
                        <li><a runat="server" href="~/Views/MusicShopDB.aspx"><%= Resources.DisplayText.MusicShop %></a></li>
                        <li><a runat="server" href="~/Views/ConcertVenuDB.aspx"><%= Resources.DisplayText.ConcertVenue %></a></li>
                        <li><a runat="server" href="~/Views/PeopleAndJobDB.aspx"><%= Resources.DisplayText.PeopleOrJob %></a></li>
                        <li class="on"><a runat="server" href="~/Views/QADbNew.aspx">Q&amp;A</a></li>
                    </ul>
                </div>

                <div class="con_section2">

                    <h2>Q&amp;A</h2>

                    <div class="conlist">
                        <ul class="agora">
                            <li><%= Resources.DisplayText.PosterEmailID %>
                                <asp:TextBox AutoPostBack="true" ID="txtbox_emailfilter" runat="server" Style="display: inline-block;" OnTextChanged="selectedFilterChanged"></asp:TextBox></li>
                            <li><%= Resources.DisplayText.Date %>
                                <div style="display: inline-block;">
                                    <div class='input-group date' id='datetimepicker2' style="display: flex;">
                                        <input type='text' class="form-control filedDisplay" runat="server" onchange="selectedFilterChanged" ontextchanged="selectedFilterChanged" id="datetimefilter" style="display: inline-block; border-right-width: 0px; width: 100px;" />
                                        <span class="input-group-addon" style="flex-wrap: wrap; width: auto; display: inline-block; padding-left: 12px; margin-left: -5px; padding-top: 9px; padding-bottom: 6px;">
                                            <span class="glyphicon glyphicon-calendar"></span>
                                        </span>
                                    </div>
                                </div>
                            </li>
                            <li><%= Resources.DisplayText.Question %>
                                <asp:TextBox AutoPostBack="true" ID="txt_question" runat="server" CssClass="form-control filedDisplay" Style="width: 150px; display: inline-block;"></asp:TextBox></li>
                        </ul>
                        <div class="btn5">
                            <asp:LinkButton ID="inquiry" runat="server" OnClick="selectedFilterChanged" Text="<%$Resources:DisplayText,Inquiry %>" />
                        </div>


                        <div class="row">
                            <asp:ListView runat="server" ID="collegeListContainer" DataKeyNames="QuestionID" DataSourceID="SqlDataSource1_Collegelist"
                                GroupItemCount="1" Style="width: 100%;" OnItemDataBound="collegeListContainer_ItemDataBound">
                                <EmptyDataTemplate>
                                    <h3>No records available.</h3>
                                </EmptyDataTemplate>
                                <GroupTemplate>
                                    <div id="itemPlaceholderContainer" runat="server">
                                        <div id="itemPlaceholder" runat="server">
                                        </div>
                                    </div>
                                </GroupTemplate>
                                <ItemTemplate>
                                    <table>
                                        <tr style="padding: 10px;">
                                            <td style="width: 5%; display: inline-block;">
                                                <%# Container.DataItemIndex+1 %>
                                            </td>
                                            <td style="width: 48%; display: inline-block; overflow-wrap: break-word;">
                                                <%#Eval("Question") %>
                                            </td>
                                            <td style="width: 10%; display: inline-block;">
                                                <%# DataBinder.Eval(Container.DataItem,"timestamp","{0:d/M/yyyy}") %>
                                            </td>
                                            <td style="width: 20%; display: inline-block;">
                                                <%#Eval("posterEmailID") %>
                                            </td>
                                            <td style="width: 15%; display: inline-block;">
                                                <a class="link btn btn-primary" style="display: inline-block" id='lnkReplyParent<%# Eval("QuestionID") %>' href="javascript:void(0)" onclick='showReply(<%# Eval("QuestionID") %>,"Main"); return false;'><%=Resources.DisplayText.Answer %></a>

                                                <asp:LinkButton class="link btn btn-danger" runat="server" ID='DlnkReplyParent' OnCommand="btnRemoveQuestion_Click" CommandArgument='<%#Eval("QuestionID") %>'>  <%=Resources.DisplayText.Delete %>  </asp:LinkButton>

                                            </td>
                                        </tr>
                                    </table>
                                    <div>

                                        <div id='divReplyMain<%# Eval("QuestionID") %>' style="display: none;">
                                            <asp:TextBox ID="txtAddParentAnswer" runat="server" TextMode="MultiLine" Rows="1" CssClass="form-control" Width="100%" Style="display: inline-block; border-radius: 5px; vertical-align: middle; max-width: 85%;"></asp:TextBox>
                                            <asp:Button ID="btnReplyParent1" runat="server" CssClass="btn btn-primary contentButton" Text="<%$Resources:DisplayText,Reply %>" Style="vertical-align: central"
                                                OnCommand="btnAddAnswer_Click" CommandName="MyUpdate" CommandArgument='<%#Eval("QuestionID") %>' />
                                            <a class="link " id="lnkCancel" href="javascript:void(0)" onclick='closeReply(<%# Eval("QuestionID") %>,"Main"); return false;'><%=Resources.DisplayText.Cancel %></a>
                                        </div>

                                        <asp:Repeater ID="ParentRepeater" runat="server" OnItemDataBound="ParentRepeater_ItemDataBound">
                                            <ItemTemplate>
                                                <div>
                                                    <div style="padding-left: 30px; margin-bottom: 5px; margin-top: 5px; margin-right: 0px; margin-left: 0px; width: 100% !important; padding-right: 0px;">

                                                        <div style="background-color: #202e2f; padding: 5px; margin-right: 0px; width: 100%;">
                                                            <div style="width: 50%; display: inline-block; overflow-wrap: break-word;">
                                                                <%#Eval("Answer") %>
                                                            </div>
                                                            <div style="width: 10%; display: inline-block;">
                                                                <%# DataBinder.Eval(Container.DataItem,"timestamp","{0:d/M/yyyy}") %>
                                                            </div>
                                                            <div style="width: 20%; display: inline-block;">
                                                                <%# DataBinder.Eval(Container.DataItem, "UserTbl.FullName") %>
                                                            </div>

                                                            <a class="link" id='lnkReplyParent<%# Eval("AnswerID") %>' href="javascript:void(0)" onclick='showReply(<%# Eval("AnswerID") %>,"Parent"); return false;'><%=Resources.DisplayText.Reply %></a>

                                                            <asp:LinkButton class="link" runat="server" ID='DlnkReplyParent' OnCommand="btnRemoveAnswer_Click" CommandArgument='<%#Eval("AnswerID") %>'>
                                                        <%=Resources.DisplayText.Delete %>
                                                            </asp:LinkButton>


                                                        </div>

                                                        <div id='divReplyParent<%# Eval("AnswerID") %>' style="display: none; margin-top: 5px;">
                                                            <asp:TextBox ID="txtCommentReplyParent" runat="server" TextMode="MultiLine" CssClass="form-control" Rows="1" Width="100%" Style="display: inline-block; border-radius: 5px; vertical-align: middle; max-width: 85%;"></asp:TextBox>
                                                            <asp:Button ID="btnReplyParent" runat="server" CssClass="btn btn-primary contentButton" Text="<%$Resources:DisplayText,Reply %>" Style="margin: 5px; vertical-align: central"
                                                                OnCommand="btnAddDetailComment_Click" CommandName="MyUpdate" CommandArgument='<%#Eval("AnswerID") %>' />

                                                            <a class="link" id="lnkCancel" href="javascript:void(0)" onclick='closeReply(<%# Eval("AnswerID") %>,"Parent"); return false;'><%=Resources.DisplayText.Cancel %></a>
                                                        </div>

                                                        <asp:Repeater ID="FirstChildRepeater" runat="server" OnItemDataBound="FirstChildRepeater_onItemDatabound">

                                                            <ItemTemplate>
                                                                <div style="padding-left: 30px; margin-bottom: 5px; margin-top: 5px; margin-right: 0px; margin-left: 0px; width: 100% !important; padding-right: 0px;">

                                                                    <div style="background-color: #202e2f; padding: 5px; margin-right: 0px; width: 100%;">
                                                                        <div style="width: 50%; display: inline-block; overflow-wrap: break-word;">
                                                                            <%#Eval("Answer") %>
                                                                        </div>
                                                                        <div style="width: 10%; display: inline-block;">
                                                                            <%# DataBinder.Eval(Container.DataItem,"timestamp","{0:d/M/yyyy}") %>
                                                                        </div>
                                                                        <div style="width: 20%; display: inline-block;">
                                                                            <%# DataBinder.Eval(Container.DataItem, "UserTbl.FullName") %>
                                                                        </div>

                                                                        <a class="link" id='lnkReplyParent<%# Eval("AnswerID") %>' href="javascript:void(0)" onclick="showReply(<%# Eval("AnswerID") %>,'FirstChild'); return false;"><%=Resources.DisplayText.Reply %></a>

                                                                        <asp:LinkButton class="link" runat="server" ID='DlnkReplyParent' OnCommand="btnRemoveAnswer_Click" CommandArgument='<%#Eval("AnswerID") %>'>
                                                        <%=Resources.DisplayText.Delete %>
                                                                        </asp:LinkButton>

                                                                    </div>


                                                                    <asp:Repeater ID="SecondChildRepeater" runat="server" OnItemDataBound="SecondChildRepeater_onItemDatabound">

                                                                        <ItemTemplate>
                                                                            <div style="padding-left: 30px; margin-bottom: 5px; margin-top: 5px; margin-right: 0px; margin-left: 0px; width: 100% !important; padding-right: 0px;">

                                                                                <div style="background-color: #202e2f; padding: 5px; margin-right: 0px;">
                                                                                    <div style="width: 50%; display: inline-block; overflow-wrap: break-word;">
                                                                                        <%#Eval("Answer") %>
                                                                                    </div>
                                                                                    <div style="width: 10%; display: inline-block;">
                                                                                        <%# DataBinder.Eval(Container.DataItem,"timestamp","{0:d/M/yyyy}") %>
                                                                                    </div>
                                                                                    <div style="width: 20%; display: inline-block;">
                                                                                        <%# DataBinder.Eval(Container.DataItem, "UserTbl.FullName") %>
                                                                                    </div>

                                                                                    <asp:LinkButton class="link" runat="server" ID='DlnkReplyParent' OnCommand="btnRemoveAnswer_Click" CommandArgument='<%#Eval("AnswerID") %>'>
                                                        <%=Resources.DisplayText.Delete %>
                                                                                    </asp:LinkButton>
                                                                                </div>
                                                                            </div>
                                                                        </ItemTemplate>
                                                                    </asp:Repeater>

                                                                    <div id='divReplyFirstChild<%# Eval("AnswerID") %>' style="display: none; margin-top: 5px;">
                                                                        <asp:TextBox ID="txtCommentReplyParent" runat="server" TextMode="MultiLine" CssClass="form-control" Rows="1" Width="100%" Style="display: inline-block; border-radius: 5px; vertical-align: middle; max-width: 85%;"></asp:TextBox>
                                                                        <asp:Button ID="btnReplyParent" CssClass="btn btn-primary contentButton" runat="server" Text="<%$Resources:DisplayText,Reply %>" Style="margin: 5px;"
                                                                            OnCommand="btnAddDetailDetailComment_Click" CommandName="MyUpdate" CommandArgument='<%#Eval("AnswerID") %>' />

                                                                        <a class="link" id="lnkCancel" href="javascript:void(0)" onclick="closeReply(<%# Eval("AnswerID") %>,'FirstChild'); return false;"><%=Resources.DisplayText.Cancel %></a>
                                                                    </div>

                                                                </div>
                                                            </ItemTemplate>



                                                        </asp:Repeater>
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:Repeater>




                                    </div>
                                </ItemTemplate>
                                <LayoutTemplate>
                                    <div class="col-xs-12" id="groupPlaceholderContainer" runat="server" style="padding: 0px;">

                                        <div id="groupPlaceholder" runat="server">
                                        </div>
                                        <div class="col-xs-12" style="text-align: center;">
                                            <asp:DataPager ID="DataPager1" runat="server" PageSize="12">
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
select p.*, u.EmailID as posterEmailID from Auxiliary.QuestionsTbl p
left join main.usertbl u on p.userID= u.userid            
order by timestamp desc"></asp:SqlDataSource>
                        </div>



                    </div>


                </div>

                <div class="row">
                    <asp:Button runat="server" ID="btn_addNew" CssClass="btn btn-success pull-right contentButton" Text="<%$Resources:DisplayText,NewQuestion %>" OnClick="onclick_btn_addNew" />
                </div>
            </div>




        </ContentTemplate>
    </asp:UpdatePanel>

    <script type="text/javascript">


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


        function closeReply(n, t) {
            $("#divReply" + t + n).hide();
            return false;
        }

        function DeleteQuestion(n) {
            console.log(n);
            $.support.cors = true;

            //check confirmation
            if (confirm("Are you sure you want to delete?")) {
                // check for user login

                $.ajax({
                    type: "POST",
                    url: "QADbNew.aspx/DeleteQuestionByID", //Pagename/Functionname
                    contentType: "application/json;charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ id: n }), //{ },//data
                    success: function (data) {
                        //alert('success') 

                        //if log in show the reply message 
                        if (data.d) {

                            alert('Entry deleted!!!');
                            location.reload();
                        }

                        else {
                            alert('Entry not deleted!!!');
                        }

                    },
                    error: function (result) {
                        console.log(result)
                        //alert("error")

                    }
                });

            }
        }


        function DeleteAnswer(n) {
            console.log(n);
            $.support.cors = true;

            //check confirmation
            if (confirm("Are you sure you want to delete?")) {
                // check for user login

                $.ajax({
                    type: "POST",
                    url: "QADbNew.aspx/DeleteAnswerByID", //Pagename/Functionname
                    contentType: "application/json;charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ id: n }), //{ },//data
                    success: function (data) {
                        //alert('success') 

                        //if log in show the reply message 
                        if (data.d) {

                            alert('Entry deleted!!!');
                            location.reload();
                        }

                        else {
                            alert('Entry not deleted!!!');
                        }

                    },
                    error: function (result) {
                        console.log(result)
                        //alert("error")

                    }
                });

            }
        }

        function showReply(n, t) {
            console.log(n);
            $.support.cors = true;
            // check for user login
            $.ajax({
                type: "POST",
                url: "QADbNew.aspx/checkLoginStatus", //Pagename/Functionname
                contentType: "application/json;charset=utf-8",
                dataType: "json",
                data: JSON.stringify({ n: 1 }), //{ },//data
                success: function (data) {
                    //alert('success') 

                    //if log in show the reply message 
                    if (data.d) {

                        $("#divReply" + t + n).show();
                        return false;
                        return false;
                    }

                    else {
                        alert('Please sign in to write comments!!!');
                    }

                },
                error: function (result) {
                    console.log(result)
                    //alert("error")

                }
            });
        }

    </script>

</asp:Content>
