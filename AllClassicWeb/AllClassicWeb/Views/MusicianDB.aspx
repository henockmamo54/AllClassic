<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MusicianDB.aspx.cs" Inherits="AllClassicWeb.Views.MusicianDB" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <br />
            <div class="row">
                <div class=" col-xs-12" >
                   <div class="pull-right" style="padding: 0px; ">
                        <asp:Button runat="server" ID="inquiry" Text="<%$Resources:DisplayText,Inquiry %>" CssClass="btn btn-primary contentButton" OnClick="selectedFilterChanged" />
                    </div>
                    <div class="pull-right" style="padding: 0px; padding-right: 15px;">
                        <span style="display: inline-block;" class="filedName"><%= Resources.DisplayText.Repertory %> </span>
                        <asp:TextBox AutoPostBack="true" ID="txt_repertoryfilter" runat="server" CssClass="form-control" Style="width: 150px; display: inline-block;"></asp:TextBox>

                    </div>
                   <div class="pull-right" style="padding: 0px; padding-right: 15px;">
                        <span style="display: inline-block;" class="filedName"><%= Resources.DisplayText.Major %>  </span>
                        <asp:DropDownList Style="display: inline-block; width: 100px;" ID="DropDownList1_Majorfilter" runat="server" class="form-control" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="SubCode" DataValueField="LookUpID"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AllClassicDBConnectionString %>" SelectCommand="SELECT LookUpID=-1, MainCode='ALL', SubCode='ALL' 
Union
SELECT LookUpID, MainCode, SubCode 
FROM Main.LookUpTbl
where maincode='Instrument'
or maincode='Composer'
or maincode='Conductor'
"></asp:SqlDataSource>
                    </div>
                   <div class="pull-right" style="padding: 0px; padding-right: 15px;">
                        <span style="display: inline-block;" class="filedName"><%= Resources.DisplayText.FullName %>  </span>
                        <asp:TextBox AutoPostBack="true" ID="txtbox_namefilter" runat="server" CssClass="form-control" Style="width: 150px; display: inline-block;"></asp:TextBox>
                    </div>
                </div>

            </div>

            <div class="row">
            <br />
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
                <div class="col-xs-12" style="border: 1px solid lightgray; border-radius: 5px; max-height: 250px; height: 250px; overflow-y: scroll;box-shadow: 0px 2px 30px rgba(0, 0, 0, 0.3);">

                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th scope="col" class="contentHeader"><%= Resources.DisplayText.FullName %></th>
                                <th scope="col" class="contentHeader"><%= Resources.DisplayText.Major %></th>
                                <th scope="col" class="contentHeader"><%= Resources.DisplayText.Affiliation %></th>
                                <th scope="col" class="contentHeader"><%= Resources.DisplayText.PosterEmailID %></th>
                            </tr>
                        </thead>
                        <tbody>

                            <asp:Repeater runat="server" ID="artistPageRepeater" DataSourceID="SqlDataSource1_getrecent20artists">
                                <ItemTemplate>
                                    <tr>
                                        <td class="col-xs-3">
                                            <asp:LinkButton runat="server" ID="headertableItem" CssClass="filedDisplay" Style="text-decoration: none; color: inherit;" OnCommand="onclick_headertableItem" CommandArgument='<%#Eval("MusicianID")%>'><%#Eval("Name") %></asp:LinkButton></td>
                                        <td class="col-xs-3 Contentdisplay"><%#Eval("majorsubocode") %></td>
                                        <td class="col-xs-3 Contentdisplay"><%#Eval("Affliation") %></td>
                                        <td class="col-xs-3 Contentdisplay"><%#Eval("useremailID") %></td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>

                        </tbody>
                    </table>

                </div>
            </div>

            <div class="row">
                <hr />
                <asp:ListView runat="server" ID="artistListContainer" DataKeyNames="MusicianID" DataSourceID="SqlDataSource1_artistlist" GroupItemCount="3" Style="width: 100%;">
                    
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
                        <div class="col-sm-4 col-xs-4" style="padding: 0;padding-right: 10px;">
                            <div class=" col-xs-12 shadowedbox2" style="box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.3) !important; border-radius: 3px; margin-bottom: 10px; padding-left: 0; background-color: white; font-family: Roboto, Arial, sans-serif;">
                                <div class="col-sm-6 col-xs-6" style="padding: 0;">
                                    <img style="width: 100%; height: 18.25rem; padding: 3px; border-radius: 7px;" class="card-img-top img-rounded" src="../Doc/artist/<%#Eval("Photo1") %>" alt="Card image cap">
                                </div>
                                <div class="col-sm-6 col-xs-6" style="margin: 0px; padding: 0px; padding-left: 8px; font-size: 1.2rem;">
                                    <div class="card-body ">
                                        <br />
                                        <h4 class="card-title contentHeader" style="margin: 0; margin-top: 5px; margin-bottom: 5px;"><strong><%#Eval("Name") %> </strong></h4>
                                        <p class="card-text" style="color: dimgray; font-size:13px;">
                                            <span class="filedName"><%# Resources.DisplayText.Affiliation %>: </span>
                                            <span class="filedDisplay"><%#Eval("Affliation") %> </span>
                                            <br />
                                            <span class="filedName"><%# Resources.DisplayText.Major %>: </span>
                                            <span class="filedDisplay"><%#Eval("majorsubocode") %> </span>
                                        </p>
                                        <a href="MusicianDetailPage.aspx?ID=<%#Eval("MusicianID") %> " class="btn btn-default contentButton"><%= Resources.DisplayText.Seemore %></a>
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
                <asp:Button runat="server" ID="btn_addNewMusician" CssClass="btn btn-success pull-right contentButton" Text="<%$Resources:DisplayText,AddNewData %>" OnClick="onclick_btn_addNewMusician" />
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>
    <style>
        .shadowedbox2 {
            background-color: #d3d3d31f;
            /* box-shadow: 3px 3px 3px #d0d0d0 !important; */
            box-shadow: 5px 5px 5px 3px #d0d0d0 !important;
            border: 1px solid #d4d3d3;
        }
    </style>
    <script type="text/javascript">

          function onclick_headertableItem(x) {
              alert(x);
          }
    </script>
</asp:Content>


