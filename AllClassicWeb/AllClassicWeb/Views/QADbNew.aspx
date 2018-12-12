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
                        <div class=" col-xs-12" style="margin-bottom: 1em;">

                            <div class="row">
                                <div class="col-xs-2">
                                    <%# Container.DataItemIndex+1 %>
                                </div>
                                <div class="col-xs-3">
                                    <%#Eval("Question") %>
                                </div>
                                <div class="col-xs-2">
                                    <%# DataBinder.Eval(Container.DataItem,"timestamp","{0:d/M/yyyy}") %>
                                </div>
                                <div class="col-xs-3">
                                    <%#Eval("posterEmailID") %>
                                </div>
                                <div class="col-xs-2">
                                    <a class="link" id='lnkReplyParent<%# Eval("QuestionID") %>' href="javascript:void(0)" onclick='showReply(<%# Eval("QuestionID") %>,"Main"); return false;'><%=Resources.DisplayText.Reply %></a>
                                    <a class="link" id="lnkCancel" href="javascript:void(0)" onclick='closeReply(<%# Eval("QuestionID") %>,"Main"); return false;'><%=Resources.DisplayText.Cancel %></a>
                                </div>

                            </div>
                            <div class="row">

                                <div id='divReplyMain<%# Eval("QuestionID") %>' style="display: none; margin-top: 5px;">
                                    <asp:TextBox ID="txtAddParentAnswer" runat="server" TextMode="MultiLine" Rows="1" Width="100%" Height="60px" Style="display: inline-block; border-radius: 5px; vertical-align: middle; max-width: 85%;"></asp:TextBox>
                                    <asp:Button ID="btnReplyParent1" runat="server" CssClass="btn btn-primary contentButton" Text="<%$Resources:DisplayText,Reply %>" Style="float: right; margin: 5px; vertical-align: central"
                                        OnCommand="btnAddAnswer_Click" CommandName="MyUpdate" CommandArgument='<%#Eval("QuestionID") %>' />
                                </div>


                                <%--<asp:Repeater runat="server" ID="testrepeater">
                                    <ItemTemplate>
                                        <%#Eval("answer") %> <br />
                                    </ItemTemplate>
                                </asp:Repeater>--%>

                                <asp:Repeater ID="ParentRepeater" runat="server" OnItemDataBound="ParentRepeater_ItemDataBound">
                                    <ItemTemplate>
                                        <div class="col-md-11">
                                            <hr style="border-top: 1px solid #dedada;" />
                                            <table style="margin: 3px 5px; width: 100%; font-size: 1.3rem; font-family: Roboto, Arial, sans-serif;">
                                                <tr>
                                                    <td style="padding: 0px 5px; text-align: left; vertical-align: top;">
                                                        <asp:Label ID="lblCommentID" runat="server" Visible="false" Text='<%#Eval("AnswerID") %>'></asp:Label>

                                                        <asp:Label ID="Label1" runat="server" Text='<% #Eval("Answer") %>'> </asp:Label>
                                                        <asp:Label ID="Label2" runat="server" Text='<% #Eval("timestamp") %>'> dte</asp:Label>
                                                        <asp:Label ID="lblCommentMessage" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "UserTbl.FullName") %>'></asp:Label>


                                                        <a class="link" id='lnkReplyParent<%# Eval("AnswerID") %>' href="javascript:void(0)" onclick='showReply(<%# Eval("AnswerID") %>,"Parent"); return false;'><%=Resources.DisplayText.Reply %></a>
                                                        <a class="link" id="lnkCancel" href="javascript:void(0)" onclick='closeReply(<%# Eval("AnswerID") %>,"Parent"); return false;'><%=Resources.DisplayText.Cancel %></a>

                                                        <div id='divReplyParent<%# Eval("AnswerID") %>' style="display: none; margin-top: 5px;">
                                                            <asp:TextBox ID="txtCommentReplyParent" runat="server" TextMode="MultiLine" Rows="1" Width="100%" Height="60px" Style="display: inline-block; border-radius: 5px; vertical-align: middle; max-width: 85%;"></asp:TextBox>
                                                            <asp:Button ID="btnReplyParent" runat="server" CssClass="btn btn-primary contentButton" Text="<%$Resources:DisplayText,Reply %>" Style="float: right; margin: 5px; vertical-align: central"
                                                                OnCommand="btnAddDetailComment_Click" CommandName="MyUpdate" CommandArgument='<%#Eval("AnswerID") %>' />
                                                        </div>

                                                        <asp:Repeater ID="FirstChildRepeater" runat="server" OnItemDataBound="FirstChildRepeater_onItemDatabound">

                                                            <ItemTemplate>
                                                                <div class="row" style="padding-left: 30px;">
                                                                    <hr style="margin: 1em;" />
                                                                    <table style="margin: 3px 5px; width: 100%;">
                                                                        <tr>
                                                                            <td style="padding: 0px 5px; text-align: left; vertical-align: top;">
                                                                                <asp:Label ID="lblCommentID" runat="server" Visible="false" Text='<%#Eval("AnswerID") %>'></asp:Label>

                                                                                <asp:Label ID="Label1" runat="server" Text='<% #Eval("Answer") %>'> </asp:Label>
                                                                                <asp:Label ID="Label2" runat="server" Text='<% #Eval("timestamp") %>'> dte</asp:Label>
                                                                                <asp:Label ID="lblCommentMessage" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "UserTbl.FullName") %>'></asp:Label>

                                                                                <a class="link" id='lnkReplyParent<%# Eval("AnswerID") %>' href="javascript:void(0)" onclick="showReply(<%# Eval("AnswerID") %>,'FirstChild'); return false;"><%=Resources.DisplayText.Reply %></a>
                                                                                <a class="link" id="lnkCancel" href="javascript:void(0)" onclick="closeReply(<%# Eval("AnswerID") %>,'FirstChild'); return false;"><%=Resources.DisplayText.Cancel %></a>

                                                                                <asp:Repeater ID="SecondChildRepeater" runat="server">

                                                                                    <ItemTemplate>
                                                                                        <div class="row"  style="padding-left: 30px;">
                                                                                            <hr style="margin: 1em;" />
                                                                                            <table style="margin: 3px 5px; width: 100%;">
                                                                                                <tr>
                                                                                                    <td style="padding: 0px 5px; text-align: left; vertical-align: top;">
                                                                                                        <asp:Label ID="lblCommentID" runat="server" Visible="false" Text='<%#Eval("AnswerID") %>'></asp:Label>

                                                                                                        <asp:Label ID="Label1" runat="server" Text='<% #Eval("Answer") %>'> </asp:Label>
                                                                                                        <asp:Label ID="Label2" runat="server" Text='<% #Eval("timestamp") %>'> dte</asp:Label>
                                                                                                        <asp:Label ID="lblCommentMessage" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "UserTbl.FullName") %>'></asp:Label>

                                                                                                    </td>
                                                                                                </tr>
                                                                                            </table>
                                                                                        </div>
                                                                                    </ItemTemplate>
                                                                                </asp:Repeater>

                                                                                <div id='divReplyFirstChild<%# Eval("AnswerID") %>' style="display: none; margin-top: 5px;">
                                                                                    <asp:TextBox ID="txtCommentReplyParent" runat="server" TextMode="MultiLine" Rows="1" Width="100%" Height="60px" Style="display: inline-block; border-radius: 5px; vertical-align: middle; max-width: 85%;"></asp:TextBox>
                                                                                    <asp:Button ID="btnReplyParent" CssClass="btn btn-primary contentButton" runat="server" Text="<%$Resources:DisplayText,Reply %>" Style="float: right; margin: 5px;"
                                                                                        OnCommand="btnAddDetailDetailComment_Click" CommandName="MyUpdate" CommandArgument='<%#Eval("AnswerID") %>' />
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </div>
                                                            </ItemTemplate>



                                                        </asp:Repeater>



                                                    </td>
                                                </tr>
                                            </table>
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
