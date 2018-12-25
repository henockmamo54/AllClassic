<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MusicCollegeDBAddNew.aspx.cs" Inherits="AllClassicWeb.Views.MusicCollegeDBAddNew" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <asp:UpdatePanel runat="server">
        <ContentTemplate>

            <div class="row ">

                <div class="col-md-8 col-xs-8 userregisterinfo">
                    <br />
                    <div class="col-md-4 col-xs-4 filedName"><%= Resources.DisplayText.Name %>*</div>
                    <div class="col-md-8 col-xs-8">
                        <asp:TextBox ID="txt_name" ValidationGroup="a" runat="server" class="form-control filedDisplay" MaxLength="40" ></asp:TextBox>
                        <asp:RequiredFieldValidator Display="Dynamic" runat="server" ForeColor="IndianRed" ValidationGroup="a" Font-Bold="true" ID="RequiredFieldValidator1" ControlToValidate="txt_name" ErrorMessage="<%$Resources:DisplayText,Pleasefillthenamefield %>" />
                    </div>
                    <br />
                </div>
            </div>
            <div class="row ">
                <div class="col-md-8 col-xs-8 userregisterinfo">
                    <br />
                    <div class="col-md-4 col-xs-4 filedName"><%= Resources.DisplayText.ShortName %>*</div>
                    <div class="col-md-8 col-xs-8">
                        <asp:TextBox ID="txt_shortname" ValidationGroup="a" runat="server" class="form-control filedDisplay" MaxLength="40" ></asp:TextBox>
                        <asp:RequiredFieldValidator Display="Dynamic" runat="server" ForeColor="IndianRed" ValidationGroup="a" Font-Bold="true" ID="RequiredFieldValidator2" ControlToValidate="txt_shortname" ErrorMessage="<%$Resources:DisplayText,Pleasefilltheshortnamefield %>" />

                    </div>
                    <br />
                </div>
            </div>
            <div class="row ">
                <div class="col-md-8 col-xs-8 userregisterinfo">
                    <br />
                    <div class="col-md-4 col-xs-4 filedName"><%= Resources.DisplayText.HomePage %>*</div>
                    <div class="col-md-8 col-xs-8">
                        <asp:TextBox ID="txt_homepage" ValidationGroup="a" runat="server" class="form-control filedDisplay" MaxLength="30" ></asp:TextBox>
                        <asp:RequiredFieldValidator Display="Dynamic" runat="server" ForeColor="IndianRed" ValidationGroup="a" Font-Bold="true" ID="RequiredFieldValidator3" ControlToValidate="txt_homepage" ErrorMessage="<%$Resources:DisplayText,PleasefilltheHomepagefield %>" />

                    </div>
                    <br />
                </div>
            </div>
            <div class="row ">
                <div class="col-md-8 col-xs-8 userregisterinfo">
                    <br />
                    <div class="col-md-4 col-xs-4 filedName"><%= Resources.DisplayText.Country %>*</div>
                    <div class="col-md-8 col-xs-8">
                        <asp:TextBox ID="txt_country" ValidationGroup="a" runat="server" class="form-control filedDisplay" MaxLength="20" ></asp:TextBox>
                        <asp:RequiredFieldValidator Display="Dynamic" runat="server" ForeColor="IndianRed" ValidationGroup="a" Font-Bold="true" ID="RequiredFieldValidator4" ControlToValidate="txt_country" ErrorMessage="<%$Resources:DisplayText,Pleasefillthecountryfield %>" />

                    </div>
                    <br />
                </div>
            </div>
            <div class="row ">
                <div class="col-md-8 col-xs-8 userregisterinfo">
                    <br />
                    <div class="col-md-4 col-xs-4 filedName"><%= Resources.DisplayText.CollegePhoto %></div>
                    <div class="col-md-8 col-xs-8">
                        <asp:FileUpload runat="server" ID="FileUpload_photo1" />
                    </div>
                    <br />
                </div>
            </div>
            <div class="row ">
                <div class="col-md-8 col-xs-8 userregisterinfo">
                    <br />
                    <div class="col-md-4 col-xs-4 filedName"><%= Resources.DisplayText.LocationMap %></div>
                    <div class="col-md-8 col-xs-8">
                        <asp:TextBox ID="txt_locationmap" runat="server" class="form-control filedDisplay" MaxLength="30" ></asp:TextBox>
                    </div>
                    <br />
                </div>
            </div>
            <div class="row ">
                <div class="col-md-8 col-xs-8 userregisterinfo">
                    <br />
                    <div class="col-md-4 col-xs-4 filedName"><%= Resources.DisplayText.Introduction %></div>
                    <div class="col-md-8 col-xs-8">
                        <asp:TextBox ID="txt_introduction" runat="server" class="form-control filedDisplay" TextMode="MultiLine" Rows="10"></asp:TextBox>
                    </div>
                    <br />
                </div>
            </div>
            <br />
            <div class="row col-md-4 col-xs-4">
                <asp:Button Visible="true" ID="btn_musiccollege_cancel" CssClass="btn btn-danger pull-right contentButton" runat="server" Text="<%$Resources:DisplayText,Cancel %>" OnClick="btn_musiccollege_cancel_Click" Style="margin-right: 10px;" />
                <asp:Button Visible="true" ID="btn_musiccollege_save" ValidationGroup="a" CssClass="btn btn-warning pull-right contentButton" runat="server" Text="<%$Resources:DisplayText,Update %>" OnClick="btn_musiccollege_save_Click" Style="margin-right: 10px;" />
                <asp:Button ID="btn_musiccollege_add" ValidationGroup="a" CssClass="btn btn-primary pull-right contentButton" runat="server" Text="<%$Resources:DisplayText,Add %>" OnClick="musiccollege_add_Click" Style="margin-right: 10px;" />

            </div>


        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btn_musiccollege_save" />
           <asp:PostBackTrigger ControlID="btn_musiccollege_add" />

        </Triggers>
    </asp:UpdatePanel>

    <script type="text/javascript">
        
        function ShowMessage() {
            alert('Data inserted succssfuly');
            window.location.href = 'MusicCollegeDB.aspx';
        }

    </script>


    <%--<script type="text/javascript">
        document.getElementById("MusicCollegetab").style.backgroundColor = "white";
        document.getElementById("MusicCollegetab").style.borderBottom = "none";
    </script>--%>

</asp:Content>
