<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MusicianDetailPage.aspx.cs" Inherits="AllClassicWeb.Views.MusicianDetailPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <br /><br />
            <div class="row">
                <div class="col-md-6 col-xs-6 pull-left">
                    <asp:Image runat="server" ID="profileImage" Width="100%" CssClass="shadowedPanel" />
                    <hr />
                    <asp:Image runat="server" ID="profileImage2" Width="100%" CssClass="shadowedPanel" />

                </div>

                <div class="col-md-6 col-xs-6 pull-center">

                    <h3 runat="server" id="artistnamecontainer" style="font-weight: 800;" class="contentHeader"></h3>

                    <div>
                        <%--<asp:Image runat="server" ID="profileImage" />--%>
                        <div class=" row col-md-12 col-xs-12">
                            <div class="col-md-3 filedName "><%=Resources.DisplayText.Major %>: </div>
                            <div class="col-md-8 col-xs-8" >
                                <asp:Label runat="server" ID="major"  CssClass="filedDisplay" ></asp:Label>
                            </div>
                        </div>
                        <div class=" row col-md-12 col-xs-12">
                            <hr style="background-color: #5f755f; height: 0.2rem;" />
                        </div>

                        <div class=" row col-md-12 col-xs-12" style="padding: 10px; background-color: #d3d3d35c; border-radius: 5px; margin-top: 8px; margin-bottom: 8px;">
                            <div class="col-xs-12 filedName"><%=Resources.DisplayText.Repertory %> </div>
                            <div class="col-xs-12">
                                <asp:Label runat="server" ID="repertory"  CssClass="filedDisplay" ></asp:Label>
                            </div>
                        </div>
                        <div class=" row col-xs-12" style="padding: 10px; background-color: #d3d3d35c; border-radius: 5px; margin-top: 8px; margin-bottom: 8px;">
                            <div class="col-md-12 filedName"><%=Resources.DisplayText.ProfilePage %> </div>
                            <div class="  col-xs-12">
                                <asp:Label runat="server" ID="profilePage"  CssClass="filedDisplay" ></asp:Label>
                            </div>
                        </div>
                        <div class=" row col-md-12 col-xs-12">
                            <hr style="background-color: #5f755f; height: 0.2rem;" />
                        </div>
                        <%--==================================================================--%>

                        <div class=" row col-md-12 col-xs-12">
                            <div class="col-md-3 filedName"><%=Resources.DisplayText.Affiliation %>: </div>
                            <div class="col-md-8 col-xs-8">
                                <asp:Label runat="server" CssClass="filedDisplay"  ID="yourAffilation"></asp:Label>
                            </div>
                        </div>
                        <div class=" row col-md-12 col-xs-12">
                            <div class="col-md-3 filedName"><%=Resources.DisplayText.MobileNo %>: </div>
                            <div class="col-md-8 col-xs-8">
                                <asp:Label runat="server"  CssClass="filedDisplay" ID="mobileNo"></asp:Label>
                            </div>
                        </div>
                        <div class=" row col-md-12 col-xs-12">
                            <div class="col-md-3 filedName"><%=Resources.DisplayText.Email %>: </div>
                            <div class="col-md-8 col-xs-8">
                                <asp:Label runat="server" CssClass="filedDisplay"  ID="email"></asp:Label>
                            </div>
                        </div>
                        <div class=" row col-md-12 col-xs-12">
                            <div class="col-md-3 filedName"><%=Resources.DisplayText.Address %>: </div>
                            <div class="col-md-8 col-xs-8">
                                <asp:Label runat="server"  CssClass="filedDisplay" ID="address"></asp:Label>
                            </div>
                        </div>
                        <div class=" row col-md-12 col-xs-12">
                            <div class="col-md-3 filedName"><%=Resources.DisplayText.ZipCode %>: </div>
                            <div class="col-md-8 col-xs-8">
                                <asp:Label runat="server" CssClass="filedDisplay"  ID="zipCode"></asp:Label>
                            </div>
                        </div>
                        <div class=" row col-md-12 col-xs-12">
                            <div class="col-md-3 filedName"><%=Resources.DisplayText.KakaoTalkID %>: </div>
                            <div class="col-md-8 col-xs-8">
                                <asp:Label runat="server" CssClass="filedDisplay"  ID="kakaoTalkID"></asp:Label>
                            </div>
                        </div>
                        <div class=" row col-md-12 col-xs-12">
                            <div class="col-md-3 filedName"><%=Resources.DisplayText.FacebookURL %>: </div>
                            <div class="col-md-8 col-xs-8">
                                <asp:Label runat="server" CssClass="filedDisplay"  ID="facebook"></asp:Label>
                            </div>
                        </div>
                        <div class=" row col-md-12 col-xs-12">
                            <div class="col-md-3 filedName"><%=Resources.DisplayText.TwitterURL %>: </div>
                            <div class="col-md-8 col-xs-8">
                                <asp:Label runat="server" CssClass="filedDisplay" ID="twitter"></asp:Label>
                            </div>
                        </div>
                    </div>


                    <div class=" row col-md-12 col-xs-12">
                        <hr style="background-color: #5f755f; height: 0.2rem;" />
                    </div>
                    <div>
                        <div class="row col-xs-12">
                            <h4 class="contentHeader"><%=Resources.DisplayText.Endorser %></h4>
                        </div>

                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th class="contentHeader"><%=Resources.DisplayText.EndorserName %></th>
                                    <th class="contentHeader"><%=Resources.DisplayText.EndorserEmailID %></th>
                                </tr>
                            </thead>
                            <tbody>



                                <asp:Repeater runat="server" ID="repeater_endorser">
                                    <ItemTemplate>
                                        <tr>
                                            <td>
                                                <asp:Label CssClass="filedDisplay" runat="server"><%# Eval("EndorserName") %> </asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label  CssClass="filedDisplay" runat="server"><%# Eval("EndorserEmail") %></asp:Label>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>

                            </tbody>
                        </table>

                    </div>

                    <div class="col-xs-12">
                        <asp:Button CssClass="btn btn-primary contentButton" runat="server" ID="btn_editArtist" OnClick="onclick_btn_editArtist"  Text="<%$Resources:DisplayText,Edit %>" />
                        <asp:Button CssClass="btn btn-danger contentButton" runat="server" ID="btn_deleteArtist" OnClientClick = "deletebtnclicked('Are you sure you want to delete?');" Text="<%$Resources:DisplayText,delete %>" />
                    </div>
                </div>



            </div>
        </ContentTemplate>

    </asp:UpdatePanel>

    <script type="text/javascript">
        document.getElementById("artisttab").style.backgroundColor = "white";
        document.getElementById("artisttab").style.borderBottom = "none";

        
        function deletebtnclicked(msg) {
            var txt;
            if (confirm(msg)) {
                txt = "You pressed OK!";

                 $.ajax({
                type: "POST",
                url: "MusicianDetailPage.aspx/DeleteMusician", //Pagename/Functionname
                contentType: "application/json;charset=utf-8",
                dataType: "json",
                data: JSON.stringify({ n: 1 }), //{ },//data
                success: function (data) {
                     
                    if (data.d) {

                        alert('Entry deleted!!!');
                        window.location.href="MusicianDB.aspx";
                         //history.go(-1);
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
        .shadowedPanel {
            border: 1px solid transparent;
            border-radius: 10px;
            border-color: #dddddd;
            /*padding: 1em;*/
            box-shadow: 2px 2px 2px 2px #f5f5f5;
        }
    </style>
</asp:Content>
