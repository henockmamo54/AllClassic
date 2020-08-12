<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PerformanceGroupDetail.aspx.cs" Inherits="AllClassicWeb.Views.PerformanceGroupDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <div class="conbox" id="performancegroupinfocontainer shadowedbox">
                <br />
                <h4 style="color: #00796B; font-weight: 800;" class="contentHeader">
                    <asp:Label runat="server" ID="txt_name" Text="name container" />

                    [
                    <asp:Label runat="server" ID="txt_alias" Text="alias container" />
                    <asp:LinkButton OnClick="LinkButton_Click" runat="server" href='<%#Eval("homepageurl") %>'>Read more</asp:LinkButton>

                    <%--<asp:Label runat="server" ID="txt_alias" Text="alias container" />
                    <span class="filedName">
                        <asp:LinkButton ID="homepagenavigation" runat="server" OnClick="LinkButton_Click" OnCommand="LinkButton_Click" CommandArgument='<%#Eval("homepageurl") %>' target="_blank"> Read more
                            <%= Resources.DisplayText.Home %>
                        </asp:LinkButton>
                    </span>--%>
                    ]</h4>
                <hr />
                <div style="margin-left: 10px;">
                    <div class="col-xs-4">

                        <div>
                            <span class="filedName"><%= Resources.DisplayText.GroupType %>:</span>
                            <asp:Label CssClass="filedDisplay" runat="server" ID="txt_grouptype" Text="GroupType container" />
                        </div>
                        <br />
                        <div>
                            <span class="filedName"><%= Resources.DisplayText.SinceYear %>:</span>
                            <asp:Label runat="server" CssClass="filedDisplay" ID="txt_sinceyear" Text="SinceYear container" />
                        </div>
                        <br />
                        <div>
                            <span class="filedName"><%= Resources.DisplayText.City %>:</span>
                            <asp:Label runat="server" CssClass="filedDisplay" ID="txt_city" Text="city container" />
                        </div>
                        <br />

                    </div>
                    <div class="col-xs-4">
                        <div>
                            <span class="filedName"><%= Resources.DisplayText.Email %>:</span>
                            <asp:Label runat="server" CssClass="filedDisplay" ID="txt_email" Text="email container" />
                        </div>
                        <br />
                        <div>
                            <span class="filedName"><%= Resources.DisplayText.Conductor %>:</span>
                            <asp:Label runat="server" CssClass="filedDisplay" ID="txt_conductor" Text="Conductor container" />
                        </div>
                        <br />
                        <div>
                            <span class="filedName"><%= Resources.DisplayText.Address %>:</span>
                            <asp:Label runat="server" CssClass="filedDisplay" ID="txt_address" Text="Address container" />
                        </div>
                        <br />

                    </div>


                    <div class="col-xs-4">
                        <div>
                            <span class="filedName"><%= Resources.DisplayText.ZipCode %>:</span>
                            <asp:Label runat="server" CssClass="filedDisplay" ID="txt_zipcode" Text="ZipCode container" />
                        </div>
                        <br />
                        <div>
                            <span class="filedName"><%= Resources.DisplayText.TelNo %>:</span>
                            <asp:Label runat="server" CssClass="filedDisplay" ID="txt_telno" Text="TelNo container" />
                        </div>
                        <br />
                        <div>
                            <span class="filedName"><%= Resources.DisplayText.FaxNo %>:</span>
                            <asp:Label runat="server" CssClass="filedDisplay" ID="txt_fax" Text="FaxNo container" />
                        </div>
                        <br />
                        <div>
                            <%--<span class="filedName">
                                <asp:LinkButton runat="server" OnCommand="LinkButton_Click" CommandArgument='<%#Eval("homepageurl") %>' target="_blank">
                                    <asp:Label runat="server" ID="txt_homepageurl" Text="Read More" />
                                </asp:LinkButton>
                            </span>--%>
                        </div>
                    </div>

                </div>

                <div class="col-xs-6">
                    <asp:Button CssClass="btn btn-danger  pull-right  contentButton" Style="margin-left: 5px;" runat="server" ID="btn_delete" OnClientClick="deletebtnclicked('Are you sure you want to delete?');" Text="<%$Resources:DisplayText,delete %>" />
                    <asp:Button CssClass="btn btn-primary pull-right contentButton" runat="server" ID="btn_editpg" OnClick="onclick_btn_editpg" Text="<%$Resources:DisplayText,Edit %>" />
                </div>

            </div>

        </ContentTemplate>
    </asp:UpdatePanel>

    <script type="text/javascript">
        //document.getElementById("performancegrouptab").style.backgroundColor = "rgb(255, 255, 255) ";
        //document.getElementById("performancegrouptab").style.borderRight = "none";


        function openInNewTab(url) {
            var win = window.open(url, '_blank');
            win.focus();
        }



        function deletebtnclicked(msg) {
            var txt;
            if (confirm(msg)) {
                txt = "You pressed OK!";

                $.ajax({
                    type: "POST",
                    url: "PerformanceGroupDetail.aspx/DeletePerfromanceGroup", //Pagename/Functionname
                    contentType: "application/json;charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ n: 1 }), //{ },//data
                    success: function (data) {

                        if (data.d) {

                            alert('Entry deleted!!!');
                            //history.go(-1);

                            window.location.href = "PerformanceGroup.aspx";
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
