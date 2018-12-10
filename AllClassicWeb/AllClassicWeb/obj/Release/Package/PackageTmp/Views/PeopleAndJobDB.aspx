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
                <div class="row  col-xs-12" style="padding-right: 0px;">

                    <div class="col-xs-3" style="padding-left: 0;">
                        <h5 style="display: inline-block;"><%=Resources.DisplayText.PeopleOrJob %></h5>
                        <asp:DropDownList ID="DropDownList1_type" runat="server" class="form-control" Style="display: inline-block; width: 60%;">
                            <asp:ListItem Value="-1" Text="ALL"></asp:ListItem>
                            <asp:ListItem Value="-2" Text="<%$Resources:DisplayText,Job %>"></asp:ListItem>
                            <asp:ListItem Value="-3" Text="<%$Resources:DisplayText,People %>"></asp:ListItem>
                        </asp:DropDownList>

                    </div>


                    <div class="col-xs-3" >
                        <h5 style="display: inline-block;"><%=Resources.DisplayText.Title %></h5>
                        <asp:TextBox runat="server" ID="txt_title" CssClass="form-control" Style="display: inline-block; width: 60%;" />

                    </div>

                    <div class="col-xs-3" style="padding: 0;">
                        <div class=" col-xs-6" style="margin-top: 10px; margin-bottom: 10px; padding: 0;">
                            <span style="display: inline-block;"><%= Resources.DisplayText.ValidDate %> </span>
                        </div>
                        <div class=" col-xs-6" style="padding: 0;">
                            <div class='input-group date' id='datetimepicker3' style="display: flex;">
                                <input type='text' class="form-control" runat="server" ontextchanged="selectedFilterChanged" id="datetimepicker3" style="display: inline-block; border-right-width: 0px;" />
                                <span class="input-group-addon" style="flex-wrap: wrap; width: auto; display: inline-block; padding-left: 12px; margin-left: -5px; padding-top: 9px; padding-bottom: 6px;">
                                    <span class="glyphicon glyphicon-calendar"></span>
                                </span>
                            </div>
                        </div>
                    </div>

                    <div class="col-xs-3" style="padding: 0;">
                        <div class="col-xs-4" style="margin-top: 10px; margin-bottom: 10px;"><%=Resources.DisplayText.City %></div>
                        <div class="col-xs-8" style="padding: 0;">
                            <asp:DropDownList ID="DropDownList3_city" runat="server" class="form-control" AutoPostBack="false" DataSourceID="SqlDataSource1_city" DataTextField="SubCode" DataValueField="LookUpID"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1_city" runat="server" ConnectionString="<%$ ConnectionStrings:AllClassicDBConnectionString %>" SelectCommand="
                                SELECT LookUpID=-1, MainCode='ALL', SubCode='ALL' 
                                union
                                SELECT LookUpID, MainCode, SubCode 
FROM Main.LookUpTbl
where maincode='City'
"></asp:SqlDataSource>
                        </div>
                    </div>


                    <div class="col-md-12 col-xs-12" style="padding-right: 0px;">

                        <asp:Button ID="inquiry" runat="server" CssClass="btn btn-primary pull-right" OnClick="selectedFilterChanged" Text="<%$Resources:DisplayText, Inquiry %>" />
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
                <div class="col-xs-12" style="border: 1px solid lightgray; border-radius: 5px; max-height: 200px; height: 200px; overflow-y: scroll;">

                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th><strong><%= Resources.DisplayText.PeopleOrJob %></strong></th>
                                <th><strong><%= Resources.DisplayText.Title %></strong></th>
                                <th><strong><%= Resources.DisplayText.ValidDate %></strong></th>
                                <th><strong><%= Resources.DisplayText.City %></strong></th>
                                <th><strong><%= Resources.DisplayText.PosterEmailID %></strong></th>
                            </tr>
                        </thead>
                        <tbody>



                            <asp:Repeater runat="server" ID="artistPageRepeater" DataSourceID="SqlDataSource1_getrecent20artists">

                                <ItemTemplate>
                                    <tr>
                                        <td><%# Eval("PeopleOrJob") %></td>
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

            <hr style="margin-top: 0px;" />

            <div class="row">
                <asp:ListView runat="server" ID="collegeListContainer" DataKeyNames="PeopleAndJobID" DataSourceID="SqlDataSource1_Collegelist" GroupItemCount="3" Style="width: 100%;">
                    
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
                        <div class="col-md-4 col-xs-4" style="margin-bottom: 1em;">
                            <div class="thumbnail shadowedbox shadowedbox_hover" style="box-shadow: 2px 2px 2px #d0d0d0;">

                                <div class="caption" style="padding-bottom: 3px;">
                                    <h4><%# (Eval("PeopleOrJob"))%></h4>
                                    <hr />
                                    <div><strong><%=Resources.DisplayText.Title %>:</strong> <%# (Eval("Title"))%></div>
                                    <div><strong><%=Resources.DisplayText.ValidDate %>:</strong> <%# DataBinder.Eval(Container.DataItem,"ValidDate","{0:d/M/yyyy}") %></div>
                                    <div><strong><%=Resources.DisplayText.City %>:</strong> <%# (Eval("cityname"))%></div>
                                    <div><strong><%=Resources.DisplayText.ContactName %>:</strong> <%# (Eval("ContactName"))%></div>
                                    <div><strong><%=Resources.DisplayText.TelNo %>:</strong> <%# (Eval("TelNo"))%></div>
                                    <div><strong><%=Resources.DisplayText.Email %>:</strong> <%# (Eval("EmailID"))%></div>
                                    <div><strong><%=Resources.DisplayText.Description %>:</strong> <%# (Eval("Description"))%></div>

                                    <asp:LinkButton runat="server" ID="edit" OnCommand="editClicked" CommandArgument='<%# Eval("PeopleAndJobID") %>'><%= Resources.DisplayText.Edit %></asp:LinkButton>

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
                                        <asp:NextPreviousPagerField ButtonType="Button" ButtonCssClass="btn " ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" FirstPageText="<%$Resources:DisplayText,First %>" />
                                        <asp:NumericPagerField />
                                        <asp:NextPreviousPagerField ButtonType="Button" ButtonCssClass="btn " ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" LastPageText="<%$Resources:DisplayText,Last %>" />
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
                <asp:Button runat="server" ID="btn_addNew" CssClass="btn btn-success pull-right" Text="<%$Resources:DisplayText,AddNewData %>" OnClick="onclick_btn_addNew" />
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
    </script>
</asp:Content>
