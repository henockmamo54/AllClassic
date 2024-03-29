﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ArticleDB.aspx.cs" Inherits="AllClassicWeb.Views.ArticleDB" %>

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
                    <div class="col-xs-4">
                        <div class="col-xs-6" style="vertical-align: sub; padding: 0;">
                            <span style="display: inline-block;"><%= Resources.DisplayText.PostingDate %> </span>
                        </div>
                        <div class="col-xs-6" style="padding: 0;">
                            <div class='input-group date' id='datetimepicker2' style="display: flex;">
                                <input type='text' class="form-control" runat="server" onchange="selectedFilterChanged" ontextchanged="selectedFilterChanged" id="datetimefilter" style="display: inline-block; border-right-width: 0px;" />
                                <span class="input-group-addon" style="flex-wrap: wrap; width: auto; display: inline-block; padding-left: 12px; margin-left: -5px; padding-top: 9px; padding-bottom: 6px;">
                                    <span class="glyphicon glyphicon-calendar"></span>
                                </span>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-6">
                        <h5 style="display: inline-block;"><%= Resources.DisplayText.PosterEmailID %>  </h5>
                        <asp:TextBox AutoPostBack="true" ID="txtbox_emailfilter" runat="server" CssClass="form-control" Style="width: 70%; display: inline-block;" OnTextChanged="selectedFilterChanged"></asp:TextBox>
                    </div>

                    <div class="col-md-2 col-xs-2">
                        <asp:Button ID="inquiry" runat="server" CssClass="btn btn-primary" OnClick="selectedFilterChanged" Text="<%$Resources:DisplayText,Inquiry %>" />
                    </div>
                </div>

            </div>

            <br />

            <div class="row" style="padding-right: 15px;">
                <asp:SqlDataSource ID="SqlDataSource1_getrecent20artists" runat="server" ConnectionString="<%$ ConnectionStrings:AllClassicDBConnectionString %>" SelectCommand="
select top 20 a.*, u.FullName userName, u.emailid from Auxiliary.ArticleTbl a
join Main.UserTbl u on u.UserID=a.UserID
order by UpdateTimeStamp desc"></asp:SqlDataSource>
                <div class="col-xs-12" style="border: 1px solid lightgray; border-radius: 5px; max-height: 220px; height: 220px; overflow-y: scroll;">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th class="col-xs-3"><strong><%= Resources.DisplayText.PostingDate %></strong></th>
                                <th class="col-xs-3"><strong><%= Resources.DisplayText.ArticleTitle %></strong></th>
                                <th class="col-xs-3"><strong><%= Resources.DisplayText.ArticleURL %></strong></th>
                                <th class="col-xs-3"><strong><%= Resources.DisplayText.PosterEmailID %></strong></th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater runat="server" ID="artistPageRepeater" DataSourceID="SqlDataSource1_getrecent20artists">
                                <ItemTemplate>
                                    <tr>
                                        <td class="col-xs-3"><%# DataBinder.Eval(Container.DataItem,"UpdateTimeStamp","{0:d/M/yyyy}") %></td>
                                        <td class="col-xs-3">
                                            <asp:LinkButton runat="server" ID="headertableItem" Style="text-decoration: none;" OnCommand="ArticleClicked" CommandArgument='<%#Eval("ArticleUrl")%>'><%#Eval("ArticleTitle") %></asp:LinkButton></td>
                                        <td class="col-xs-3"><%#Eval("ArticleUrl") %></td>
                                        <td class="col-xs-3"><%#Eval("EmailID") %></td>

                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>

                        </tbody>
                    </table>

                </div>
            </div>


            <div class="row" style="margin-top:40px;">

                <asp:ListView runat="server" ID="collegeListContainer" DataKeyNames="ArticleID" DataSourceID="SqlDataSource1_Collegelist" GroupItemCount="1" Style="width: 100%;">

                    <GroupTemplate>
                        <div id="itemPlaceholderContainer" runat="server">
                            <div id="itemPlaceholder" runat="server">
                            </div>
                        </div>
                    </GroupTemplate>
                    <ItemTemplate>
                        <div class="col-md-8 col-xs-8" style="margin-bottom: 0;">
                            <div>
                                <asp:LinkButton runat="server" ID="tumbinallink" Style="text-decoration: none;" OnCommand="ArticleClicked" CommandArgument='<%# Eval("ArticleUrl") %>'>

                                    <div class="caption" style="padding-bottom: 3px;">
                                        <h4 style="padding: 0px; margin: 0px;    color: dimgray;"><%# Eval("ArticleTitle")%></h4>
                                        <asp:LinkButton runat="server" ID="navigation" Text='<%# (Eval("ArticleUrl"))%>' OnCommand="ArticleClicked" CommandArgument='<%# Eval("ArticleUrl") %>'></asp:LinkButton>
                                        <br />
                                        <span runat="server" style="color:#a7a7a7;"><%# (Eval("userName")) %> [<%# (Eval("UpdateTimeStamp")) %>]</span>
                                        <asp:LinkButton runat="server" ID="edit" OnCommand="editArticleClicked" CommandArgument='<%# Eval("ArticleID") %>'><%= Resources.DisplayText.Edit %></asp:LinkButton>
                                        <hr style="margin-top: 5px; margin-bottom: 5px;" />
                                    </div>

                                </asp:LinkButton>
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
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ButtonCssClass="btn" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                        <asp:NumericPagerField />
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ButtonCssClass="btn" ShowNextPageButton="False" ShowPreviousPageButton="False" />
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
select a.*, u.FullName userName from Auxiliary.ArticleTbl a
                    join Main.UserTbl u on u.UserID=a.UserID
order by UpdateTimeStamp desc"></asp:SqlDataSource>
            </div>


            <div class="row">
                <asp:Button runat="server" ID="btn_addArticle" CssClass="btn btn-success pull-right" Text="<%$Resources:DisplayText,AddNewData %>" OnClick="onclick_btn_addArticle" />
            </div>

        </ContentTemplate>
        <Triggers>
            <%--<asp:PostBackTrigger ControlID="btn_addnewArticle" />--%>
        </Triggers>
    </asp:UpdatePanel>

    <script type="text/javascript">
        document.getElementById("articletab").style.backgroundColor = "rgb(255, 255, 255) ";
        document.getElementById("articletab").style.borderRight = "none";
    </script>
    <script type="text/javascript">
        function bindDateTime() {
            $('#datetimepicker2').datetimepicker({
                format: 'MM/DD/YYYY'
            });
        }
        $(function () {
            $('#datetimepicker2').datetimepicker({
                format: 'MM/DD/YYYY'
            });
        });
    </script>
</asp:Content>
