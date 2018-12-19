<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MusicShopDB.aspx.cs" Inherits="AllClassicWeb.Views.MusicShopDB" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <br />
            <div class="row">
                <div class="row col-md-12 col-xs-12  col-xs-12">
                    <div class="col-md-3 col-xs-3 ">
                        <h5 style="display: inline-block;" class="filedName"><%= Resources.DisplayText.Name %> </h5>
                        <asp:TextBox AutoPostBack="true" ID="txtbox_namefilter" runat="server" class="form-control filedDisplay" Style="width: 70%; display: inline-block;"></asp:TextBox>
                    </div>
                    <div class="col-md-3 col-xs-3  ">
                        <h5 style="display: inline-block;" class="filedName"><%= Resources.DisplayText.Alias %>  </h5>
                        <asp:TextBox AutoPostBack="true" ID="txtbox_aliasfilter" runat="server" class="form-control filedDisplay" Style="width: 70%; display: inline-block;"></asp:TextBox>
                    </div>
                    <div class="col-md-3 col-xs-3 ">
                        <h5 style="display: inline-block;" class="filedName"><%= Resources.DisplayText.Expertise %>  </h5>
                        <asp:TextBox AutoPostBack="true" ID="txt_experties" runat="server" class="form-control filedDisplay" Style="width: 69%; display: inline-block;"></asp:TextBox>
                    </div>
                    <div class="col-md-3 col-xs-3 " style="padding-right: 0;">
                        <h5 style="display: inline-block;" class="filedName"><%= Resources.DisplayText.City %>  </h5>
                        <asp:DropDownList Style="display: inline-block; width: 85%;" ID="DropDownList1_cityfilter" runat="server" class="form-control" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="SubCode" DataValueField="LookUpID"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AllClassicDBConnectionString %>" SelectCommand="SELECT   LookUpID=-1, MainCode='ALL', SubCode='ALL'
Union
SELECT LookUpID, MainCode, SubCode 
FROM Main.LookUpTbl
where maincode='City'
"></asp:SqlDataSource>
                    </div>
                </div>
            </div>
            <br />
            <div class="col-md-12 col-xs-12">
                <asp:Button ID="inquiry" runat="server" CssClass="btn btn-primary pull-right contentButton" OnClick="selectedFilterChanged" Text="<%$Resources:DisplayText, Inquiry %>" />
            </div>
            <br />


            <div class="row" style="padding-right: 15px;">

                <br />
                <asp:SqlDataSource ID="SqlDataSource1_getrecent20artists" runat="server" ConnectionString="<%$ ConnectionStrings:AllClassicDBConnectionString %>" SelectCommand="
select top 20 c.*,u.EmailID posteremailiD, ci.SubCode as cityname from Auxiliary.MusicShopTbl c
join Main.usertbl u on c.Userid=u.userid
            join(SELECT LookUpID, MainCode, SubCode 
FROM Main.LookUpTbl
where maincode='City' ) ci on ci.LookUpID=c.City
order by UpdateTimeStamp desc"></asp:SqlDataSource>
                <div class="col-xs-12" style="border: 1px solid lightgray; border-radius: 5px; max-height: 250px; height: 250px; overflow-y: scroll;">

                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th class="contentHeader"><%= Resources.DisplayText.Name %> </th>
                                <th class="contentHeader"><%= Resources.DisplayText.Alias %> </th>
                                <th class="contentHeader"><%= Resources.DisplayText.Expertise %> </th>
                                <th class="contentHeader"><%= Resources.DisplayText.City %> </th>
                                <th class="contentHeader"><%= Resources.DisplayText.PosterEmailID %> </th>
                            </tr>
                        </thead>
                        <tbody>



                            <asp:Repeater runat="server" ID="artistPageRepeater" DataSourceID="SqlDataSource1_getrecent20artists">

                                <ItemTemplate>
                                    <tr>
                                        <td class="Contentdisplay"><%#Eval("Name") %></td>
                                        <td class="Contentdisplay"><%#Eval("Alias") %> </td>
                                        <td class="Contentdisplay"><%#Eval("Expertise") %> </td>
                                        <td class="Contentdisplay"><%#Eval("cityname") %> </td>
                                        <td class="Contentdisplay"><%#Eval("posteremailiD") %> </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>

                        </tbody>
                    </table>
                </div>
            </div>


            <div class="row">
                <hr />
                <asp:ListView runat="server" ID="collegeListContainer" DataKeyNames="MusicShopID" DataSourceID="SqlDataSource1_Collegelist" GroupItemCount="3" Style="width: 100%;" OnItemDataBound="collegeListContainer_OnItemDataBound">

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
                        <div class="col-md-4 col-xs-4" style="margin-bottom: 1em; padding-left: 0px;">

                            <div class="panel panel-default shadowedPanel shadowedbox_hover">
                                <div class="panel-heading contentHeader" style="background-color: #eaf2f7;">
                                    <h4><%# (Eval("Name")) .ToString().Length>15?
                                        (Eval("Name")) .ToString().Substring(0,15)+ " ....":
                                        (Eval("Name")) .ToString()%></h4>
                                </div>
                                <div class="panel-body">
                                    <table>
                                        <tbody class="rowwithbottomborder ">
                                            <tr>
                                                <td class="filedName"><%# Resources.DisplayText.Alias %>:</td>
                                                <td class="filedDisplay"><%#Eval("Alias") %></td>
                                            </tr>
                                            <tr>
                                                <td class="filedName"><%# Resources.DisplayText.Expertise %>:</td>
                                                <td class="filedDisplay"><%#Eval("Expertise") %></td>
                                            </tr>
                                            <tr>
                                                <td class="filedName"><%# Resources.DisplayText.City %>:</td>
                                                <td class="filedDisplay"><%#Eval("cityname") %></td>
                                            </tr>

                                            <tr>
                                                <td class="filedName"><%# Resources.DisplayText.OwnerName %>:</td>
                                                <td class="filedDisplay"><%#Eval("OwnerName") %></td>
                                            </tr>
                                            <tr>
                                                <td class="filedName"><%# Resources.DisplayText.SinceYear %>:</td>
                                                <td class="filedDisplay"><%#Eval("SinceYear") %></td>
                                            </tr>
                                            <tr>
                                                <td class="filedName"><%# Resources.DisplayText.Email %>:</td>
                                                <td class="filedDisplay"><%#Eval("EmailID") %></td>
                                            </tr>
                                            <tr>
                                                <td class="filedName"><%# Resources.DisplayText.Address %>:</td>
                                                <td class="filedDisplay"><%#Eval("Address").ToString().Length>15?Eval("Address").ToString().Substring(0,15):Eval("Address").ToString() %></td>
                                            </tr>
                                            <tr>
                                                <td class="filedName"><%# Resources.DisplayText.ZipCode %>:</td>
                                                <td class="filedDisplay"><%#Eval("ZipCode") %></td>
                                            </tr>
                                            <tr>
                                                <td class="filedName"><%# Resources.DisplayText.TelNo %>:</td>
                                                <td class="filedDisplay"><%#Eval("TelNO") %></td>
                                            </tr>
                                            <tr>
                                                <td class="filedName"><%# Resources.DisplayText.FaxNo %>:</td>
                                                <td class="filedDisplay"><%#Eval("FaxNo") %></td>
                                            </tr>
                                            <tr>
                                                <td class="filedName"><%# Resources.DisplayText.HomePage %>:</td>
                                                <td class="filedDisplay">
                                                    <asp:LinkButton runat="server" target="_blank" Text='<%# Eval("HomePage") %>' href='http://<%# Eval("HomePage") %>'></asp:LinkButton></td>
                                                <%--href='http://<%# Eval("HomePage") %>'--%>
                                            </tr>
                                            <tr>
                                                <td><br /></td>
                                                <td>
                                                    <asp:LinkButton runat="server" ID="edit" OnCommand="editMusicShopClicked" CommandArgument='<%# Eval("MusicShopID") %>'><%= Resources.DisplayText.Edit %></asp:LinkButton>

                                                    <asp:LinkButton runat="server" CssClass="Contentdisplay" Style="margin-left: 5px;" ID="delete" OnClientClick='<%# "deletebtnclicked(" +Eval("MusicShopID") + " );" %>' Text="<%$Resources:DisplayText,delete %>"></asp:LinkButton>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>

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
                <asp:SqlDataSource ID="SqlDataSource1_Collegelist" runat="server" ConnectionString="<%$ ConnectionStrings:AllClassicDBConnectionString %>" SelectCommand="
select r.*, r.EmailID,c.SubCode cityname  from Auxiliary.MusicShopTbl r
            join Main.usertbl u on r.Userid=u.userid
                    left join (select lookupid, Maincode, subcode from main.lookuptbl where maincode='City') c on c.LookUpID=r.City
order by UpdateTimeStamp desc"></asp:SqlDataSource>
            </div>

            <div class="row">
                <asp:Button runat="server" ID="btn_addNewMusicShop" CssClass="btn btn-success pull-right contentButton" Text="<%$Resources:DisplayText,AddNewData %>" OnClick="onclick_btn_addNewMusicShop" />
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
