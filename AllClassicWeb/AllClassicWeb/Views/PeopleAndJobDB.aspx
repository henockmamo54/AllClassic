<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PeopleAndJobDB.aspx.cs" Inherits="AllClassicWeb.Views.PeopleAndJobDB" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel runat="server">
        <ContentTemplate>

            
            <br />

            <div class="row">
                <div class="row col-md-12 col-xs-12  col-xs-12">


                    <div class="col-md-6 col-xs-6 ">
                        <div class="col-md-4 col-xs-4" style="margin-top: 10px; margin-bottom: 10px; padding: 0;">

                            <h5 style="display: inline-block;"><%= Resources.DisplayText.PeopleOrJob %>  </h5>
                        </div>
                        <div class="col-md-6 col-xs-6" style="padding: 0;">
                            <asp:TextBox AutoPostBack="true" ID="txt_organizer" runat="server" CssClass="form-control" Style="display: inline-block;"></asp:TextBox>

                        </div>

                    </div>

                    <div class="col-md-6 col-xs-6 ">
                        <div class="col-md-4 col-xs-4" style="margin-top: 10px; margin-bottom: 10px; padding: 0;">

                            <h5 style="display: inline-block;"><%= Resources.DisplayText.Title %>  </h5>
                        </div>
                        <div class="col-md-6 col-xs-6">

                            <asp:TextBox AutoPostBack="true" ID="txt_title" runat="server" CssClass="form-control" Style="display: inline-block;"></asp:TextBox>
                        </div>
                    </div>
                    
                    <div class="col-md-6 col-xs-6">
                        <div class="col-md-4 col-xs-4" style="margin-top: 10px; margin-bottom: 10px; padding: 0;">
                            <span style="display: inline-block;"><%= Resources.DisplayText.ToDate %> </span>
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
                <div class="col-xs-12" style="border: 1px solid lightgray; border-radius: 5px; max-height: 150px; height: 150px; overflow-y: scroll;">
                    <asp:Repeater runat="server" ID="artistPageRepeater" DataSourceID="SqlDataSource1_getrecent20artists">
                        <HeaderTemplate>
                            <div class="col-xs-2"><strong><%= Resources.DisplayText.PeopleOrJob %></strong></div>
                            <div class="col-xs-2"><strong><%= Resources.DisplayText.Title %></strong></div>
                            <div class="col-xs-2"><strong><%= Resources.DisplayText.ValidDate %></strong></div>
                            <div class="col-xs-2"><strong><%= Resources.DisplayText.City %></strong></div>
                            <div class="col-xs-2"><strong><%= Resources.DisplayText.PosterEmailID %></strong></div>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label runat="server" ID="headertableItem" Style="text-decoration: none;">
                                <div class=" row col-md-12 col-xs-12">
                                    <hr style="background-color: #5f755f; margin: 0; margin-top: 5px;" />
                                </div>
                                <div class="col-xs-2"><%# Eval("PeopleOrJob") %></div>
                                <div class="col-xs-2"><%# Eval("Title") %></div>
                                <div class="col-xs-2"><%# DataBinder.Eval(Container.DataItem,"ValidDate","{0:d/M/yyyy}") %></div>
                                <div class="col-xs-2"><%# Eval("cityname") %></div>
                                <div class="col-xs-2"><%# Eval("useremailid") %></div>
                            </asp:Label>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
            
            <hr style="margin-top: 0px;" />

            <div class="row">
                <asp:ListView runat="server" ID="collegeListContainer" DataKeyNames="PeopleAndJobID" DataSourceID="SqlDataSource1_Collegelist" GroupItemCount="3" Style="width: 100%;">

                    <GroupTemplate>
                        <div id="itemPlaceholderContainer" runat="server">
                            <div id="itemPlaceholder" runat="server">
                            </div>
                        </div>
                    </GroupTemplate>
                    <ItemTemplate>
                        <div class="col-md-4 col-xs-4" style="margin-bottom: 1em;">
                            <div class="thumbnail shadowedbox shadowedbox_hover" style="box-shadow: 2px 2px 2px #d0d0d0;">
                                <asp:LinkButton runat="server" ID="tumbinallink" Style="text-decoration: none;">
                                                                          
                                            <div class="caption" style="padding-bottom:3px;">
                                                <h4><%# (Eval("PeopleOrJob"))%></h4>
                                                <hr />
                                                <div> <strong><%=Resources.DisplayText.Title %>:</strong> <%# (Eval("Title"))%></div>
                                                <div> <strong><%=Resources.DisplayText.ValidDate %>:</strong> <%# DataBinder.Eval(Container.DataItem,"ValidDate","{0:d/M/yyyy}") %></div>
                                                <div> <strong><%=Resources.DisplayText.City %>:</strong> <%# (Eval("cityname"))%></div>
                                                <div> <strong><%=Resources.DisplayText.ContactName %>:</strong> <%# (Eval("ContactName"))%></div>
                                                <div> <strong><%=Resources.DisplayText.TelNo %>:</strong> <%# (Eval("TelNo"))%></div>
                                                <div> <strong><%=Resources.DisplayText.Email %>:</strong> <%# (Eval("EmailID"))%></div>
                                                <div> <strong><%=Resources.DisplayText.Description %>:</strong> <%# (Eval("Description"))%></div>
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
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                        <asp:NumericPagerField />
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
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
        document.getElementById("PeopleAndJobDBtab").style.backgroundColor = "rgb(255, 255, 255) ";
        document.getElementById("PeopleAndJobDBtab").style.borderRight = "none";
    </script>


</asp:Content>
