<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RepairShopDBAddNew.aspx.cs" Inherits="AllClassicWeb.Views.RepairShopDBAddNew" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h4>New Data Input</h4>
    <hr />

    <div class="row">

        <div class="col-xs-4" style="padding: 0;">
            <div class="col-xs-4"><%=Resources.DisplayText.ShopName %></div>
            <div class="col-xs-6" style="padding: 0;">
                <asp:TextBox runat="server" ID="txt_shopname" CssClass="form-control" />
            </div>
        </div>
        <div class="col-xs-4" style="padding: 0;">
            <div class="col-xs-4"><%=Resources.DisplayText.Alias %></div>
            <div class="col-xs-6" style="padding: 0;">
                <asp:TextBox runat="server" ID="txt_alias" CssClass="form-control" />
            </div>
        </div>
        <div class="col-xs-4" style="padding: 0;">
            <div class="col-xs-4"><%=Resources.DisplayText.Expertise %></div>
            <div class="col-xs-6" style="padding: 0;">
                <asp:TextBox runat="server" ID="txt_experties" CssClass="form-control" />
            </div>
        </div>

    </div>

    <br />
    <div class="row">

        <div class="col-xs-4" style="padding: 0;">
            <div class="col-xs-4"><%=Resources.DisplayText.City %></div>
            <div class="col-xs-6" style="padding: 0;">
                <asp:DropDownList ID="DropDownList3_city" runat="server" class="form-control" AutoPostBack="false" DataSourceID="SqlDataSource1_city" DataTextField="SubCode" DataValueField="LookUpID" OnDataBound="DropDownList3_city_DataBound"></asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1_city" runat="server" ConnectionString="<%$ ConnectionStrings:AllClassicDBConnectionString %>" SelectCommand="SELECT LookUpID, MainCode, SubCode 
FROM Main.LookUpTbl
where maincode='City'
"></asp:SqlDataSource>
            </div>
        </div>
        <div class="col-xs-4" style="padding: 0;">
            <div class="col-xs-4"><%=Resources.DisplayText.OwnerName %></div>
            <div class="col-xs-6" style="padding: 0;">
                <asp:TextBox runat="server" ID="txt_ownername" CssClass="form-control" />
            </div>
        </div>
        <div class="col-xs-4" style="padding: 0;">
            <div class="col-xs-4"><%=Resources.DisplayText.SinceYear %></div>
            <div class="col-xs-6" style="padding: 0;">
                <asp:TextBox runat="server" ID="txt_sinceyear" MaxLength="4" CssClass="form-control" />
            </div>
        </div>

    </div>


    <br />

    <div class="row">

        <div class="col-xs-4" style="padding: 0;">
            <div class="col-xs-4"><%=Resources.DisplayText.Email %></div>
            <div class="col-xs-6" style="padding: 0;">
                <asp:TextBox runat="server" ID="txt_email" TextMode="Email" CssClass="form-control" />
            </div>
        </div>
        <div class="col-xs-4" style="padding: 0;">
            <div class="col-xs-4"><%=Resources.DisplayText.Address %></div>
            <div class="col-xs-6" style="padding: 0;">
                <asp:TextBox runat="server" ID="txt_address" CssClass="form-control" />
            </div>
        </div>
        <div class="col-xs-4" style="padding: 0;">
            <div class="col-xs-4"><%=Resources.DisplayText.ZipCode %></div>
            <div class="col-xs-6" style="padding: 0;">
                <asp:TextBox runat="server" ID="txt_zipcode" MaxLength="4" CssClass="form-control" />
            </div>
        </div>

    </div>

    <br />
    <div class="row">

        <div class="col-xs-4" style="padding: 0;">
            <div class="col-xs-4"><%=Resources.DisplayText.TelNo %></div>
            <div class="col-xs-6" style="padding: 0;">
                <asp:TextBox runat="server" ID="txt_telno" CssClass="form-control" />
            </div>
        </div>
        <div class="col-xs-4" style="padding: 0;">
            <div class="col-xs-4"><%=Resources.DisplayText.FaxNo %></div>
            <div class="col-xs-6" style="padding: 0;">
                <asp:TextBox runat="server" ID="txt_faxno" CssClass="form-control" />
            </div>
        </div>
        <div class="col-xs-4" style="padding: 0;">
            <div class="col-xs-4"><%=Resources.DisplayText.HomePage %></div>
            <div class="col-xs-6" style="padding: 0;">
                <asp:TextBox runat="server" ID="txt_homepage"   CssClass="form-control" />
            </div>
        </div>

    </div>

    <br />

    <div class="row col-md-4 col-xs-4">
        <asp:Button Visible="true" ID="btn_repairshop_cancel" CssClass="btn btn-danger pull-right" runat="server" Text="<%$Resources:DisplayText,Cancel %>" OnClick="btn_repairshop_cancel_Click" Style="margin-right: 10px;" />
        <asp:Button Visible="true" ID="btn_repairshop_save" CssClass="btn btn-warning pull-right" runat="server" Text="<%$Resources:DisplayText,Update %>" OnClick="btn_repairshop_save_Click" Style="margin-right: 10px;" />
        <asp:Button ID="btn_repairshop_add" CssClass="btn btn-primary pull-right" runat="server" Text="<%$Resources:DisplayText,Add %>" OnClick="btn_repairshop_add_Click" Style="margin-right: 10px;" />

    </div>

       
    <script type="text/javascript">
         document.getElementById("RepairShoptab").style.backgroundColor = "white";
        document.getElementById("RepairShoptab").style.borderRight = "none";
    </script>

</asp:Content>
