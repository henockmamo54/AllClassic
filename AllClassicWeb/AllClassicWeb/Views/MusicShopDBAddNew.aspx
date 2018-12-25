<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MusicShopDBAddNew.aspx.cs" Inherits="AllClassicWeb.Views.MusicShopDBAddNew" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <br />
    <h4 class="contentHeader">New Data Input</h4>
    <hr />

    <div class="row">

        <div class="col-xs-4" style="padding: 0;">
            <div class="col-xs-4 filedName"><%=Resources.DisplayText.ShopName %></div>
            <div class="col-xs-6" style="padding: 0;">
                <asp:TextBox runat="server" ID="txt_shopname" class="form-control filedDisplay"   MaxLength="30"/>
            </div>
        </div>
        <div class="col-xs-4" style="padding: 0;">
            <div class="col-xs-4 filedName"><%=Resources.DisplayText.Alias %></div>
            <div class="col-xs-6" style="padding: 0;">
                <asp:TextBox runat="server" ID="txt_alias" class="form-control filedDisplay"   MaxLength="30" />
            </div>
        </div>
        <div class="col-xs-4" style="padding: 0;">
            <div class="col-xs-4 filedName"><%=Resources.DisplayText.Expertise %></div>
            <div class="col-xs-6" style="padding: 0;">
                <asp:TextBox runat="server" ID="txt_experties" class="form-control filedDisplay"   MaxLength="80" />
            </div>
        </div>

    </div>

    <br />
    <div class="row">

        <div class="col-xs-4" style="padding: 0;">
            <div class="col-xs-4 filedName"><%=Resources.DisplayText.City %></div>
            <div class="col-xs-6" style="padding: 0;">
                <asp:DropDownList ID="DropDownList3_city" runat="server" class="form-control" AutoPostBack="false" DataSourceID="SqlDataSource1_city" DataTextField="SubCode" DataValueField="LookUpID" OnDataBound="DropDownList3_city_DataBound"></asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1_city" runat="server" ConnectionString="<%$ ConnectionStrings:AllClassicDBConnectionString %>" SelectCommand="SELECT LookUpID, MainCode, SubCode 
FROM Main.LookUpTbl
where maincode='City'
"></asp:SqlDataSource>
            </div>
        </div>
        <div class="col-xs-4" style="padding: 0;">
            <div class="col-xs-4 filedName"><%=Resources.DisplayText.OwnerName %></div>
            <div class="col-xs-6" style="padding: 0;">
                <asp:TextBox runat="server" ID="txt_ownername" class="form-control filedDisplay"   MaxLength="20" />
            </div>
        </div>
        <div class="col-xs-4" style="padding: 0;">
            <div class="col-xs-4 filedName"><%=Resources.DisplayText.SinceYear %></div>
            <div class="col-xs-6" style="padding: 0;">
                <asp:TextBox runat="server" ID="txt_sinceyear" MaxLength="4" class="form-control filedDisplay" />
            </div>
        </div>

    </div>


    <br />

    <div class="row">

        <div class="col-xs-4" style="padding: 0;">
            <div class="col-xs-4 filedName"><%=Resources.DisplayText.Email %></div>
            <div class="col-xs-6" style="padding: 0;">
                <asp:TextBox runat="server" ID="txt_email" TextMode="Email" class="form-control filedDisplay"  MaxLength="30"  />
            </div>
        </div>
        <div class="col-xs-4" style="padding: 0;">
            <div class="col-xs-4 filedName"><%=Resources.DisplayText.Address %></div>
            <div class="col-xs-6" style="padding: 0;">
                <asp:TextBox runat="server" ID="txt_address" class="form-control filedDisplay"   MaxLength="80" />
            </div>
        </div>
        <div class="col-xs-4" style="padding: 0;">
            <div class="col-xs-4 filedName"><%=Resources.DisplayText.ZipCode %></div>
            <div class="col-xs-6" style="padding: 0;">
                <asp:TextBox runat="server" ID="txt_zipcode" MaxLength="4" class="form-control filedDisplay" />
            </div>
        </div>

    </div>

    <br />
    <div class="row">

        <div class="col-xs-4" style="padding: 0;">
            <div class="col-xs-4 filedName"><%=Resources.DisplayText.TelNo %></div>
            <div class="col-xs-6" style="padding: 0;">
                <asp:TextBox runat="server" ID="txt_telno" class="form-control filedDisplay"  MaxLength="20"  />
            </div>
        </div>
        <div class="col-xs-4" style="padding: 0;">
            <div class="col-xs-4 filedName"><%=Resources.DisplayText.FaxNo %></div>
            <div class="col-xs-6" style="padding: 0;">
                <asp:TextBox runat="server" ID="txt_faxno" class="form-control filedDisplay"   MaxLength="20" />
            </div>
        </div>
        <div class="col-xs-4" style="padding: 0;">
            <div class="col-xs-4 filedName"><%=Resources.DisplayText.HomePage %></div>
            <div class="col-xs-6" style="padding: 0;">
                <asp:TextBox runat="server" ID="txt_homepage"  class="form-control filedDisplay"   MaxLength="30" />
            </div>
        </div>

    </div>

    <br />

    <div class="row col-md-4 col-xs-4">
        <asp:Button Visible="true" ID="btn_musicshop_cancel" CssClass="btn btn-danger pull-right contentButton" runat="server" Text="<%$Resources:DisplayText,Cancel %>" OnClick="btn_musicshop_cancel_Click" Style="margin-right: 10px;" />
        <asp:Button Visible="true" ID="btn_musicshop_save" CssClass="btn btn-warning pull-right contentButton" runat="server" Text="<%$Resources:DisplayText,Update %>" OnClick="btn_musicshop_save_Click" Style="margin-right: 10px;" />
        <asp:Button ID="btn_musicshop_add" CssClass="btn btn-primary pull-right contentButton" runat="server" Text="<%$Resources:DisplayText,Add %>" OnClick="btn_musicshop_add_Click" Style="margin-right: 10px;" />

    </div>

    <script type="text/javascript">
        document.getElementById("MusicShopDBtab").style.backgroundColor = "white";
        document.getElementById("MusicShopDBtab").style.borderRight = "none";
    </script>
    <script type="text/javascript">
        
        function ShowMessage() {
            alert('Data inserted succssfuly');
            window.location.href = 'MusicShopDB.aspx';
        }

    </script>
</asp:Content>
