<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ConcertVenuDB.aspx.cs" Inherits="AllClassicWeb.Views.ConcertVenuDB" %>

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
                        <li><a runat="server" href="~/Views/MusicShopDB.aspx"><%= Resources.DisplayText.MusicShop %></a></li>
                        <li class="on"><a runat="server" href="~/Views/ConcertVenuDB.aspx"><%= Resources.DisplayText.ConcertVenue %></a></li>
                        <li><a runat="server" href="~/Views/PeopleAndJobDB.aspx"><%= Resources.DisplayText.PeopleOrJob %></a></li>
                        <li><a runat="server" href="~/Views/QADbNew.aspx">Q&amp;A</a></li>
                    </ul>
                </div>

                <div class="con_section2">

                    <h2><%= Resources.DisplayText.ConcertVenue %></h2>

                    <div class="conlist">
                        <ul class="agora">
                            <li><%= Resources.DisplayText.City %>
                                <asp:DropDownList Style="display: inline-block;" ID="DropDownList1_cityfilter" runat="server" class="form-control filedDisplay" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="SubCode" DataValueField="LookUpID"></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AllClassicDBConnectionString %>" SelectCommand="SELECT   LookUpID=-1, MainCode='ALL', SubCode='ALL'
Union
SELECT LookUpID, MainCode, SubCode 
FROM Main.LookUpTbl
where maincode='City'
"></asp:SqlDataSource>
                            </li>
                            <li><%= Resources.DisplayText.Alias %>
                                <asp:TextBox AutoPostBack="true" ID="txtbox_aliasfilter" runat="server" class="form-control filedDisplay" Style="display: inline-block;"></asp:TextBox></li>
                            <li><%= Resources.DisplayText.VenuName %>
                                <asp:TextBox AutoPostBack="true" ID="txtbox_namefilter" runat="server" class="form-control filedDisplay" Style="display: inline-block;"></asp:TextBox></li>
                        </ul>
                        <div class="btn5">
                            <asp:LinkButton ID="inquiry" runat="server" OnClick="selectedFilterChanged" Text="<%$Resources:DisplayText, Inquiry %>" />

                        </div>
                        <asp:SqlDataSource ID="SqlDataSource1_getrecent20artists" runat="server" ConnectionString="<%$ ConnectionStrings:AllClassicDBConnectionString %>" SelectCommand="
select top 20 c.*,u.EmailID posteremailiD, ci.SubCode as cityname from Auxiliary.VenueTbl c
left join Main.usertbl u on c.Userid=u.userid
            left join(SELECT LookUpID, MainCode, SubCode 
FROM Main.LookUpTbl
where maincode='City' ) ci on ci.LookUpID=c.City
order by UpdateTimeStamp desc"></asp:SqlDataSource>
                        <div style="max-height: 250px; overflow-y: scroll; width: 100%;">

                            <table>
                                <thead>
                                    <tr>
                                        <th><%= Resources.DisplayText.VenuName %></th>
                                        <th><%= Resources.DisplayText.Alias %></th>
                                        <th><%= Resources.DisplayText.City %></th>
                                        <th><%= Resources.DisplayText.PosterEmailID %></th>
                                    </tr>
                                </thead>
                                <tbody>



                                    <asp:Repeater runat="server" ID="artistPageRepeater" DataSourceID="SqlDataSource1_getrecent20artists">

                                        <ItemTemplate>
                                            <tr>
                                                <td><%#Eval("Name") %></td>
                                                <td><%#Eval("Alias") %></td>
                                                <td><%#Eval("cityname") %></td>
                                                <td><%#Eval("posteremailiD") %></td>
                                            </tr>
                                        </ItemTemplate>
                                        <AlternatingItemTemplate>
                                            <tr>
                                                <td class='td2'><%#Eval("Name") %></td>
                                                <td class='td2'><%#Eval("Alias") %></td>
                                                <td class='td2'><%#Eval("cityname") %></td>
                                                <td class='td2'><%#Eval("posteremailiD") %></td>
                                            </tr>
                                        </AlternatingItemTemplate>
                                    </asp:Repeater>

                                </tbody>
                            </table>
                        </div>

                    </div>

                    <%--<ul class="agoralist2">
                        
                    </ul>--%>


                    <div class="agoralist2" style="width: 100%">

                        <asp:ListView runat="server" ID="collegeListContainer" DataKeyNames="VenueID" DataSourceID="SqlDataSource1_Collegelist" GroupItemCount="2"
                            OnItemDataBound="collegeListContainer_OnItemDataBound">

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
                                        <li><span>- <%# Resources.DisplayText.City %> :</span><%#Eval("cityname") %></li>
                                        <li><span>- <%# Resources.DisplayText.OwnerName %> :</span><%#Eval("OwnerName") %></li>
                                        <li><span>- <%# Resources.DisplayText.SinceYear %> :</span><%#Eval("SinceYear") %></li>
                                        <li><span>- <%# Resources.DisplayText.Email %> :</span><%#Eval("EmailID") %></li>
                                        <li><span>- <%# Resources.DisplayText.Address %></span><%#Eval("Address").ToString().Length>15?Eval("Address").ToString().Substring(0,15):Eval("Address").ToString() %></li>
                                        <li><span>- <%# Resources.DisplayText.ZipCode %></span><%#Eval("ZipCode") %></li>
                                        <li><span>- <%# Resources.DisplayText.TelNo %></span><%#Eval("TelNO") %></li>
                                        <li><span>- <%# Resources.DisplayText.FaxNo %></span><%#Eval("FaxNo") %></li>
                                        <li><span><%# Resources.DisplayText.HomePage %></span><asp:LinkButton runat="server" Style="display: inline-block;" target="_blank" Text='<%# Eval("HomePage") %>' href='http://<%# Eval("HomePage") %>'></asp:LinkButton></td></li>
                                        <li>
                                            <asp:LinkButton runat="server" Style="display: inline-block;" ID="edit" OnCommand="editvenuClicked" CommandArgument='<%# Eval("VenueID") %>'><%= Resources.DisplayText.Edit %></asp:LinkButton>
                                            <asp:LinkButton runat="server" Style="display: inline-block;" ID="delete" OnClientClick='<%# "deletebtnclicked(" +Eval("VenueID") + " );" %>' Text="<%$Resources:DisplayText,delete %>"></asp:LinkButton>
                                        </li>
                                    </ul>
                                </li>
                            </ItemTemplate>
                            <LayoutTemplate>
                                <div id="groupPlaceholderContainer" runat="server">

                                    <div id="groupPlaceholder" runat="server">
                                    </div>
                                    <div class="col-lg-12" style="text-align: center; margin-top: 10px;">
                                        <asp:DataPager ID="DataPager1" runat="server" PageSize="4">
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
select r.*, r.EmailID, ci.SubCode as cityname,u.UserID from Auxiliary.VenueTbl r
           left join Main.usertbl u on r.Userid=u.userid
                    left join(SELECT LookUpID, MainCode, SubCode 
FROM Main.LookUpTbl
where maincode='City' ) ci on ci.LookUpID=r.City
order by UpdateTimeStamp desc"></asp:SqlDataSource>

                    </div>


                    <div>
                        <asp:Button runat="server" ID="btn_addNewConcertVenu" CssClass="btn btn-success pull-right" Text="<%$Resources:DisplayText,AddNewData %>" OnCommand="onclick_btn_addNewConcertVenu" OnClick="onclick_btn_addNewConcertVenu" />
                    </div>

                </div>

            </div>




        </ContentTemplate>
    </asp:UpdatePanel>

    <script type="text/javascript">

        function deletebtnclicked(id) {
            var txt;
            if (confirm('Are you sure you want to delete?')) {
                txt = "You pressed OK!";

                $.ajax({
                    type: "POST",
                    url: "ConcertVenuDB.aspx/DeleteVenu", //Pagename/Functionname
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

    <style>
        .rowwithbottomborder > tr > td {
            /*border-bottom: 1px solid #eaeaea;*/
            padding-bottom: 10px;
            padding-right: 5px;
            color: black !important;
        }
    </style>
</asp:Content>
