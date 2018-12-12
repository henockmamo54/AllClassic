<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="QADbNew.aspx.cs" Inherits="AllClassicWeb.QADbNew" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel runat="server">
        <ContentTemplate>

            <br />
            <hr />

            <div class="row">
                <asp:ListView runat="server" ID="collegeListContainer" DataKeyNames="QuestionID" DataSourceID="SqlDataSource1_Collegelist" GroupItemCount="1" Style="width: 100%;" OnItemDataBound="collegeListContainer_ItemDataBound">



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
                        <div class=" col-xs-12 filedDisplay" style="margin-bottom: 1em;">

                            <div class="row">
                                <div style="width: 5%; display: inline-block;">
                                    <%# Container.DataItemIndex+1 %>
                                </div>
                                <div style="width: 50%; display: inline-block; overflow-wrap: break-word;">
                                    <%#Eval("Question") %>
                                </div>
                                <div style="width: 10%; display: inline-block;">
                                    <%# DataBinder.Eval(Container.DataItem,"timestamp","{0:d/M/yyyy}") %>
                                </div>
                                <div style="width: 20%; display: inline-block;">
                                    <%#Eval("posterEmailID") %>
                                </div>
                                <div style="width: 10%; display: inline-block;">
                                    <a class="link btn btn-primary" style="display: inline-block" id='lnkReplyParent<%# Eval("QuestionID") %>' href="javascript:void(0)" onclick='showReply(<%# Eval("QuestionID") %>,"Main"); return false;'><%=Resources.DisplayText.Answer %></a>
                                </div>
                            </div>
                            <div class="row" style="margin-right: 0px; margin-top:5px; border-bottom:1px solid  #d3d3d333;">

                                <div id='divReplyMain<%# Eval("QuestionID") %>' style="display: none; margin-top: 15px; margin-bottom: 15px; padding-left: 30px;">
                                    <asp:TextBox ID="txtAddParentAnswer" runat="server" TextMode="MultiLine" Rows="1" CssClass="form-control" Width="100%" Style="display: inline-block; border-radius: 5px; vertical-align: middle; max-width: 85%;"></asp:TextBox>
                                    <asp:Button ID="btnReplyParent1" runat="server" CssClass="btn btn-primary contentButton" Text="<%$Resources:DisplayText,Reply %>" Style="vertical-align: central"
                                        OnCommand="btnAddAnswer_Click" CommandName="MyUpdate" CommandArgument='<%#Eval("QuestionID") %>' />
                                    <a class="link " id="lnkCancel" href="javascript:void(0)" onclick='closeReply(<%# Eval("QuestionID") %>,"Main"); return false;'><%=Resources.DisplayText.Cancel %></a>
                                </div>

                                <asp:Repeater ID="ParentRepeater" runat="server" OnItemDataBound="ParentRepeater_ItemDataBound">
                                    <ItemTemplate>
                                        <div class="col-md-11">
                                            <div style="padding-left: 30px; margin-bottom: 5px; margin-top: 5px; margin-right: 0px; margin-left: 0px; width: 100% !important; padding-right: 0px;">
                                                 
                                                    <div style="background-color: #d3d3d333; padding: 5px; border-radius: 5px; margin-right: 0px; width: 100%;">
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

                                                                <div style="background-color: #d3d3d333; padding: 5px; border-radius: 5px; margin-right: 0px; width: 100%;">
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
                                                                </div>


                                                                <asp:Repeater ID="SecondChildRepeater" runat="server">

                                                                    <ItemTemplate>
                                                                        <div style="padding-left: 30px; margin-bottom: 5px; margin-top: 5px; margin-right: 0px; margin-left: 0px; width: 100% !important; padding-right: 0px;">

                                                                            <div style="background-color: #d3d3d333; padding: 5px; border-radius: 5px; margin-right: 0px;">
                                                                                <div style="width: 50%; display: inline-block; overflow-wrap: break-word;">
                                                                                    <%#Eval("Answer") %>
                                                                                </div>
                                                                                <div style="width: 10%; display: inline-block;">
                                                                                    <%# DataBinder.Eval(Container.DataItem,"timestamp","{0:d/M/yyyy}") %>
                                                                                </div>
                                                                                <div style="width: 20%; display: inline-block;">
                                                                                    <%# DataBinder.Eval(Container.DataItem, "UserTbl.FullName") %>
                                                                                </div>

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
order by UpdateTimeStamp desc"></asp:SqlDataSource>
            </div>

            <div class="row">
                <asp:Button runat="server" ID="btn_addNew" CssClass="btn btn-success pull-right contentButton" Text="<%$Resources:DisplayText,AddNewData %>" OnClick="onclick_btn_addNew" />
            </div>


        </ContentTemplate>
    </asp:UpdatePanel>

    <script type="text/javascript">

        function closeReply(n, t) {
            $("#divReply" + t + n).hide();
            return false;
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
