<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="QADbNew.aspx.cs" Inherits="AllClassicWeb.QADbNew" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel runat="server">
        <ContentTemplate>

            <br />
            <hr />

            <div class="row">
                <asp:ListView runat="server" ID="collegeListContainer" DataKeyNames="QuestionID" DataSourceID="SqlDataSource1_Collegelist" GroupItemCount="1" Style="width: 100%;">



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

                            <%--                            <div class="panel panel-success shadowedbox_hover">
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
                                            <tr>
                                                <td class="filedName"><%# Resources.DisplayText.Description %>:</td>
                                                <td class="filedDisplay"><%#Eval("Description") %></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <asp:LinkButton runat="server" ID="LinkButton1" OnCommand="editClicked" CommandArgument='<%# Eval("PeopleAndJobID") %>'><%= Resources.DisplayText.Edit %></asp:LinkButton>
                                </div>
                            </div>--%>
                            <div class="row">
                                <div class="col-xs-2">
                                    <%# Container.DataItemIndex+1 %>
                                </div>
                                <div class="col-xs-6">
                                    <%#Eval("Question") %>
                                </div>
                                <div class="col-xs-2">
                                    <%# DataBinder.Eval(Container.DataItem,"timestamp","{0:d/M/yyyy}") %>
                                </div>
                                <div class="col-xs-2">
                                    <%#Eval("posterEmailID") %>
                                </div>

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
</asp:Content>
