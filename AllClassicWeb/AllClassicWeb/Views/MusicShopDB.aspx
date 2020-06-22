<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MusicShopDB.aspx.cs" Inherits="AllClassicWeb.Views.MusicShopDB" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel runat="server">
        <ContentTemplate>

            <div class="conbox">

                <div class="con_section1">
                    <div class="subtit">Agora</div>
                    <ul class="submenu">
                        <li><a runat="server" href="~/Views/AuditionDB.aspx"><%= Resources.DisplayText.Auditions %></a></li>
                        <li><a runat="server" href="~/Views/ConcoursDB.aspx"><%= Resources.DisplayText.Concours %></a></li>
                        <li><a runat="server" href="~/Views/RepairShopDB.aspx"><%= Resources.DisplayText.RepairShop %></a></li>
                        <li class="on"><a runat="server" href="~/Views/MusicShopDB.aspx"><%= Resources.DisplayText.MusicShop %></a></li>
                        <li><a runat="server" href="~/Views/ConcertVenuDB.aspx"><%= Resources.DisplayText.ConcertVenue %></a></li>
                        <li><a runat="server" href="~/Views/PeopleAndJobDB.aspx"><%= Resources.DisplayText.PeopleOrJob %></a></li>
                        <li><a runat="server" href="~/Views/QADbNew.aspx">Q&amp;A</a></li>
                    </ul>
                </div>

                <div class="con_section2">

                    <h2><%= Resources.DisplayText.MusicShop %></h2>

                    <div class="conlist">
                        <ul class="agora">
                            <li><%= Resources.DisplayText.Name %>
                                <asp:TextBox AutoPostBack="true" ID="txtbox_namefilter" runat="server" Style="display: inline-block;"></asp:TextBox></li>
                            <li><%= Resources.DisplayText.Alias %>
                                <asp:TextBox AutoPostBack="true" ID="txtbox_aliasfilter" runat="server" Style="display: inline-block;"></asp:TextBox></li>
                            <li><%= Resources.DisplayText.City %>
                                <asp:DropDownList Style="display: inline-block;" ID="DropDownList1_cityfilter" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="SubCode" DataValueField="LookUpID"></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AllClassicDBConnectionString %>" SelectCommand="SELECT   LookUpID=-1, MainCode='ALL', SubCode='ALL'
Union
SELECT LookUpID, MainCode, SubCode 
FROM Main.LookUpTbl
where maincode='City'
"></asp:SqlDataSource>
                            </li>
                            <li><%= Resources.DisplayText.Expertise %>
                                <asp:TextBox AutoPostBack="true" ID="txt_experties" runat="server" Style="display: inline-block;"></asp:TextBox></li>
                        </ul>
                        <div class="btn4">
                            <asp:LinkButton ID="inquiry" runat="server" OnClick="selectedFilterChanged" Text="<%$Resources:DisplayText, Inquiry %>" />
                        </div>


                        <asp:SqlDataSource ID="SqlDataSource1_getrecent20artists" runat="server" ConnectionString="<%$ ConnectionStrings:AllClassicDBConnectionString %>" SelectCommand="
select top 20 c.*,u.EmailID posteremailiD, ci.SubCode as cityname from Auxiliary.MusicShopTbl c
join Main.usertbl u on c.Userid=u.userid
            join(SELECT LookUpID, MainCode, SubCode 
FROM Main.LookUpTbl
where maincode='City' ) ci on ci.LookUpID=c.City
order by UpdateTimeStamp desc"></asp:SqlDataSource>
                        <div class="col-xs-12" style="max-height: 250px; overflow-y: scroll;">

                            <table>
                                <thead>
                                    <tr>
                                        <th><%= Resources.DisplayText.Name %> </th>
                                        <th><%= Resources.DisplayText.Alias %> </th>
                                        <th><%= Resources.DisplayText.Expertise %> </th>
                                        <th><%= Resources.DisplayText.City %> </th>
                                        <th><%= Resources.DisplayText.PosterEmailID %> </th>
                                    </tr>
                                </thead>
                                <tbody>



                                    <asp:Repeater runat="server" ID="artistPageRepeater" DataSourceID="SqlDataSource1_getrecent20artists">

                                        <ItemTemplate>
                                            <tr>
                                                <td><%#Eval("Name") %></td>
                                                <td><%#Eval("Alias") %> </td>
                                                <td><%#Eval("Expertise") %> </td>
                                                <td><%#Eval("cityname") %> </td>
                                                <td><%#Eval("posteremailiD") %> </td>
                                            </tr>
                                        </ItemTemplate>
                                        <AlternatingItemTemplate>
                                            <tr>
                                                <td class="td2"><%#Eval("Name") %></td>
                                                <td class="td2"><%#Eval("Alias") %> </td>
                                                <td class="td2"><%#Eval("Expertise") %> </td>
                                                <td class="td2"><%#Eval("cityname") %> </td>
                                                <td class="td2"><%#Eval("posteremailiD") %> </td>
                                            </tr>
                                        </AlternatingItemTemplate>
                                    </asp:Repeater>

                                </tbody>
                            </table>
                        </div>


                    </div>

                    <div class="agoralist2">


                        <asp:ListView runat="server" ID="collegeListContainer" DataKeyNames="MusicShopID" DataSourceID="SqlDataSource1_Collegelist" GroupItemCount="3" OnItemDataBound="collegeListContainer_OnItemDataBound">

                            <EmptyDataTemplate>
                                <div>
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
                                <li>
                                    <div class="name">
                                        <%# (Eval("Name")) .ToString().Length>15?
                                        (Eval("Name")) .ToString().Substring(0,15)+ " ....":
                                        (Eval("Name")) .ToString()%>
                                    </div>
                                    <ul class="txt">
                                        <li><span>- <%# Resources.DisplayText.Alias %> :</span><%#Eval("Alias") %></li>
                                        <li><span>- <%# Resources.DisplayText.Expertise %> :</span><%#Eval("Expertise") %></li>
                                        <li><span>- <%# Resources.DisplayText.City %> :</span><%#Eval("cityname") %></li>
                                        <li><span>- <%# Resources.DisplayText.OwnerName %> :</span><%#Eval("OwnerName") %></li>
                                        <li><span>- <%# Resources.DisplayText.SinceYear %> :</span><%#Eval("SinceYear") %></li>
                                        <li><span>- <%# Resources.DisplayText.Email %> :</span><%#Eval("EmailID") %></li>
                                        <li><span>- <%# Resources.DisplayText.Address %> :</span><%#Eval("Address").ToString().Length>15?Eval("Address").ToString().Substring(0,15):Eval("Address").ToString() %></li>
                                        <li><span>- <%# Resources.DisplayText.ZipCode %> :</span><%#Eval("ZipCode") %></li>
                                        <li><span>- <%# Resources.DisplayText.TelNo %> :</span><%#Eval("TelNO") %></li>
                                        <li><span>- <%# Resources.DisplayText.FaxNo %> :</span><%#Eval("FaxNo") %></li>
                                        <li><span>- <%# Resources.DisplayText.HomePage %>: </span>
                                            <asp:LinkButton runat="server" target="_blank" Style="display: inline-block" Text='<%# Eval("HomePage") %>' href='http://<%# Eval("HomePage") %>'></asp:LinkButton></li>
                                        <li>
                                            <asp:LinkButton runat="server" Style="display: inline-block" ID="edit" OnCommand="editMusicShopClicked" CommandArgument='<%# Eval("MusicShopID") %>'><%= Resources.DisplayText.Edit %></asp:LinkButton>
                                            <asp:LinkButton runat="server" Style="display: inline-block" ID="delete" OnClientClick='<%# "deletebtnclicked(" +Eval("MusicShopID") + " );" %>' Text="<%$Resources:DisplayText,delete %>"></asp:LinkButton>
                                        </li>
                                    </ul>
                                </li>


                            </ItemTemplate>
                            <LayoutTemplate>
                                <div id="groupPlaceholderContainer" runat="server">

                                    <div id="groupPlaceholder" runat="server" style="margin-bottom: 10px;">
                                    </div>
                                    <div style="text-align: center; margin-top: 10px">
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
                        <asp:SqlDataSource ID="SqlDataSource1_Collegelist" runat="server" ConnectionString="<%$ ConnectionStrings:AllClassicDBConnectionString %>" SelectCommand="
select r.*, r.EmailID,c.SubCode cityname  from Auxiliary.MusicShopTbl r
            join Main.usertbl u on r.Userid=u.userid
                    left join (select lookupid, Maincode, subcode from main.lookuptbl where maincode='City') c on c.LookUpID=r.City
order by UpdateTimeStamp desc"></asp:SqlDataSource>



                    </div>

                </div>



                <div class="row">
                    <asp:Button runat="server" ID="btn_addNewMusicShop" CssClass="btn btn-success pull-right contentButton" Text="<%$Resources:DisplayText,AddNewData %>" OnClick="onclick_btn_addNewMusicShop" />
                </div>

            </div>



        </ContentTemplate>
    </asp:UpdatePanel>
    <style>
        .rowwithbottomborder > tr > td {
            /*border-bottom: 1px solid #eaeaea;*/
            padding-bottom: 10px;
            padding-right: 5px;
            color: black !important;
        }
    </style>

    <script type="text/javascript">

        function deletebtnclicked(id) {
            var txt;
            if (confirm('Are you sure you want to delete?')) {
                txt = "You pressed OK!";

                $.ajax({
                    type: "POST",
                    url: "MusicShopDB.aspx/DeleteMusicShop", //Pagename/Functionname
                    contentType: "application/json;charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ n: id }), //{ },//data
                    success: function (data) {

                        if (data.d) {

                            alert('Entry deleted!!!');
                            location.reload();
                        }

                        else {
                            alert('Entry not  deleted!!!');
                        }

                    },
                    error: function (result) {
                        console.log(result)
                        //alert("error")

                    }
                });


            } else {
                txt = "You pressed Cancel!";
            }
        }

    </script>

</asp:Content>
