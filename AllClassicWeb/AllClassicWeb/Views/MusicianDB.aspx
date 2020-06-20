<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MusicianDB.aspx.cs" Inherits="AllClassicWeb.Views.MusicianDB" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel runat="server">
        <ContentTemplate>

            <div class="conbox">

                <h2>Musician</h2>

                <div class="conlist">
                    <ul>
                        <li><%= Resources.DisplayText.FullName %>
                            <asp:TextBox AutoPostBack="true" ID="txtbox_namefilter" runat="server" CssClass="form-control" Style="display: inline-block;"></asp:TextBox>

                        </li>
                        <li><%= Resources.DisplayText.Major %>
                            <asp:DropDownList Style="display: inline-block; width: 100px;" ID="DropDownList1_Majorfilter" runat="server" class="form-control" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="SubCode" DataValueField="LookUpID"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AllClassicDBConnectionString %>" SelectCommand="SELECT LookUpID=-1, MainCode='ALL', SubCode='ALL' 
Union
SELECT LookUpID, MainCode, SubCode 
FROM Main.LookUpTbl
where maincode='Instrument'
or maincode='Composer'
or maincode='Conductor'
"></asp:SqlDataSource>


                            <li><%= Resources.DisplayText.Repertory %>
                                <asp:TextBox AutoPostBack="true" ID="txt_repertoryfilter" runat="server" CssClass="form-control" Style="display: inline-block;"></asp:TextBox>

                            </li>
                    </ul>
                    <div class="btn1">
                        <asp:LinkButton ID="inquiry" runat="server" OnClick="selectedFilterChanged"><%= Resources.DisplayText.Inquiry %> </asp:LinkButton>

                        <%--<asp:Button runat="server" ID="inquiry" Text="<%$Resources:DisplayText,Inquiry %>" CssClass="btn btn-primary contentButton" OnClick="selectedFilterChanged" />--%>
                    </div>

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
                    <div class="col-xs-12" style="max-height: 250px; height: 250px; overflow-y: scroll; box-shadow: 0px 2px 30px rgba(0, 0, 0, 0.3);">

                        <table>
                            <thead>
                                <tr>
                                    <th scope="col"><%= Resources.DisplayText.FullName %></th>
                                    <th scope="col"><%= Resources.DisplayText.Major %></th>
                                    <th scope="col"><%= Resources.DisplayText.Affiliation %></th>
                                    <th scope="col"><%= Resources.DisplayText.PosterEmailID %></th>
                                </tr>
                            </thead>
                            <tbody>

                                <asp:Repeater runat="server" ID="artistPageRepeater" DataSourceID="SqlDataSource1_getrecent20artists">
                                    <ItemTemplate>
                                        <tr>
                                            <td >
                                                <asp:LinkButton runat="server" ID="headertableItem" CssClass="filedDisplay" Style="text-decoration: none; color: inherit;" OnCommand="onclick_headertableItem" CommandArgument='<%#Eval("MusicianID")%>'><%#Eval("Name") %></asp:LinkButton></td>
                                            <td ><%#Eval("majorsubocode") %></td>
                                            <td ><%#Eval("Affliation") %></td>
                                            <td ><%#Eval("useremailID") %></td>
                                        </tr>
                                    </ItemTemplate>
                                    <AlternatingItemTemplate>
                                        <tr>
                                            <td class="td2">
                                                <asp:LinkButton runat="server" ID="headertableItem" CssClass="filedDisplay" Style="text-decoration: none; color: inherit;" OnCommand="onclick_headertableItem" CommandArgument='<%#Eval("MusicianID")%>'><%#Eval("Name") %></asp:LinkButton></td>
                                            <td class="td2"><%#Eval("majorsubocode") %></td>
                                            <td class="td2"><%#Eval("Affliation") %></td>
                                            <td class="td2"><%#Eval("useremailID") %></td>
                                        </tr>
                                    </AlternatingItemTemplate>
                                </asp:Repeater>

                            </tbody>
                        </table>

                    </div>

                </div>

                <ul class="manlist">

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
                            <div style="padding: 0; padding-right: 10px;">
                                <a href="MusicianDetailPage.aspx?ID=<%#Eval("MusicianID") %> ">
                                    <li>
                                        <div class="man">
                                            <img src="../Doc/artist/<%#Eval("Photo1") %>">
                                        </div>
                                        <div class="box">
                                            <div class="name"><%#Eval("Name") %></div>
                                            <div class="txt">
                                                <%#Eval("majorsubocode") %><br />
                                                <%#Eval("Affliation") %>
                                            </div>
                                            <div class="go">
                                                <img src="../Content/img/mango.png" />
                                            </div>
                                        </div>
                                    </li>
                                </a>

                            </div>

                        </ItemTemplate>
                        <LayoutTemplate>
                            <div class="col-xs-12" id="groupPlaceholderContainer" runat="server" style="padding: 0px;">

                                <div id="groupPlaceholder" runat="server">
                                </div>
                                <div class="col-xs-12" style="text-align: center; margin-top:10px;">
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

                </ul>

                <div>
                    <asp:Button runat="server" ID="btn_addNewMusician" CssClass="btn btn-success pull-right contentButton" Text="<%$Resources:DisplayText,AddNewData %>" OnClick="onclick_btn_addNewMusician" />
                </div>
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


