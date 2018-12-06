<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MusicianDB.aspx.cs" Inherits="AllClassicWeb.Views.MusicianDB" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <br />
            <div class="row">
                <div class="row  col-xs-12" style="padding-right: 0px;">
                    <div class="col-xs-3 pull-right" style="padding-right: 0px;">
                        <asp:Button runat="server" ID="inquiry" Text="<%$Resources:DisplayText,Inquiry %>" CssClass="btn btn-primary" OnClick="selectedFilterChanged" />
                    </div>
                    <div class="col-xs-3 pull-right" style="padding-right: 0px;">
                        <h5 style="display: inline-block;"><%= Resources.DisplayText.Repertory %> </h5>
                        <asp:TextBox AutoPostBack="true" ID="txt_repertoryfilter" runat="server" CssClass="form-control" Style="width: 70%; display: inline-block;"></asp:TextBox>

                    </div>
                    <div class="col-xs-3 pull-right" style="padding-right: 0px;">
                        <h5 style="display: inline-block;"><%= Resources.DisplayText.Major %>  </h5>
                        <asp:DropDownList Style="display: inline-block; width: 83%;" ID="DropDownList1_Majorfilter" runat="server" class="form-control" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="SubCode" DataValueField="LookUpID"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AllClassicDBConnectionString %>" SelectCommand="SELECT LookUpID=-1, MainCode='ALL', SubCode='ALL' 
Union
SELECT LookUpID, MainCode, SubCode 
FROM Main.LookUpTbl
where maincode='Instrument'
or maincode='Composer'
or maincode='Conductor'
"></asp:SqlDataSource>
                    </div>
                    <div class="col-xs-3 pull-right" style="padding-right: 0px;">
                        <h5 style="display: inline-block;"><%= Resources.DisplayText.FullName %>  </h5>
                        <asp:TextBox AutoPostBack="true" ID="txtbox_namefilter" runat="server" CssClass="form-control" Style="width: 70%; display: inline-block;"></asp:TextBox>
                    </div>
                </div>

            </div>
            <br />

            <div class="row" >
                <asp:SqlDataSource ID="SqlDataSource1_getrecent20artists" runat="server" ConnectionString="<%$ ConnectionStrings:AllClassicDBConnectionString %>" SelectCommand="
SELECT top 20 m.*,u.EmailID useremailID, majorsubocode FROM Main.[MusicianTbl] m
join Main.UserTbl u on m.UserID=u.UserID
left join (
select LookUpID,SubCode as majorsubocode from Main.LookUpTbl
where maincode='Instrument'
or maincode='Composer'
or maincode='Conductor'
) ml on m.Major=ml.LookUpID
order by m.UpdateTimeStamp desc"></asp:SqlDataSource>
                <div class="col-xs-12" style="border: 1px solid lightgray; border-radius: 5px; max-height: 230px; height: 230px; overflow-y: scroll;">

                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th scope="col"><%= Resources.DisplayText.FullName %></th>
                                <th scope="col"><%= Resources.DisplayText.Major %></th>
                                <th scope="col"><%= Resources.DisplayText.Affiliation %></th>
                                <th scope="col"><%= Resources.DisplayText.Email %></th>
                            </tr>
                        </thead>
                        <tbody>

                            <asp:Repeater runat="server" ID="artistPageRepeater" DataSourceID="SqlDataSource1_getrecent20artists">
                                <ItemTemplate>
                                    <tr>
                                        <td class="col-xs-3">
                                            <asp:LinkButton runat="server" ID="headertableItem" Style="text-decoration: none;" OnCommand="onclick_headertableItem" CommandArgument='<%#Eval("MusicianID")%>'><%#Eval("Name") %></asp:LinkButton></td>
                                        <td class="col-xs-3"><%#Eval("majorsubocode") %></td>
                                        <td class="col-xs-3"><%#Eval("Affliation") %></td>
                                        <td class="col-xs-3"><%#Eval("useremailID") %></td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>

                        </tbody>
                    </table>

                </div>
            </div>

            <div class="row">
                <br  />
                <asp:ListView runat="server" ID="artistListContainer" DataKeyNames="MusicianID" DataSourceID="SqlDataSource1_artistlist" GroupItemCount="3" Style="width: 100%;">

                    <GroupTemplate>
                        <div id="itemPlaceholderContainer" runat="server">
                            <div id="itemPlaceholder" runat="server">
                            </div>
                        </div>
                    </GroupTemplate>
                    <ItemTemplate>
                        <div class="col-sm-4 col-xs-4" style="padding-right: 0px;">
                            <div class="row col-sm-12 col-xs-12" style="box-shadow: 0px 0px 5px 2px #d4d3d3; border-radius: 3px; margin-bottom: 2rem; padding-left: 0; background-color: white; font-family: Roboto, Arial, sans-serif;">
                                <div class="col-sm-6 col-xs-6" style="padding: 0;">
                                    <img style="width: 100%; height: 18.25rem; padding: 3px; border-radius: 7px;" class="card-img-top img-rounded" src="../Doc/artist/<%#Eval("Photo1") %>" alt="Card image cap">
                                </div>
                                <div class="col-sm-6 col-xs-6" style="margin: 0px; padding: 0px; padding-left: 8px; font-size: 1.2rem;">
                                    <div class="card-body">
                                        <h5 class="card-title" style="margin: 0; margin-top: 5px; margin-bottom: 5px;"><strong><%#Eval("Name") %> </strong></h5>
                                        <p class="card-text" style="color: #555555;">
                                            <strong><%# Resources.DisplayText.Affiliation %>: </strong>
                                            <%#Eval("Affliation") %>
                                            <br />
                                            <strong><%# Resources.DisplayText.Major %>: </strong>
                                            <%#Eval("majorsubocode") %>
                                        </p>
                                        <a href="MusicianDetailPage.aspx?ID=<%#Eval("MusicianID") %> " class="btn btn-default"><%= Resources.DisplayText.HomePage %></a>
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
                <asp:SqlDataSource ID="SqlDataSource1_artistlist" runat="server" ConnectionString="<%$ ConnectionStrings:AllClassicDBConnectionString %>" SelectCommand="
SELECT  m.*,u.EmailID, majorsubocode FROM Main.[MusicianTbl] m
join Main.UserTbl u on m.UserID=u.UserID
left join (
select LookUpID,SubCode as majorsubocode from Main.LookUpTbl
where maincode='Instrument'
or maincode='Composer'
or maincode='Conductor'
) ml on m.Major=ml.LookUpID
order by m.UpdateTimeStamp desc"></asp:SqlDataSource>
            </div>
            <div class="row">
                <asp:Button runat="server" ID="btn_addNewMusician" CssClass="btn btn-success pull-right" Text="<%$Resources:DisplayText,AddNewData %>" OnClick="onclick_btn_addNewMusician" />
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>
    <script type="text/javascript">

        function onclick_headertableItem(x) {
            alert(x);
        }
    </script>
</asp:Content>


