<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PerformanceGroupAddNew.aspx.cs" Inherits="AllClassicWeb.Views.PerformanceGroupAddNew" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <br />
            <h4 runat="server" id="headerlabelcontainer"><%= Resources.DisplayText.NewDataInputScreen %></h4>
            <hr style="margin-top: 0px;" />
            <div id="dataentryform" class="row">

                <div class="row ">

                    <div class="col-xs-12">
                        <div class="col-md-4 col-xs-4 userregisterinfo">
                            <br />
                            <div class="col-md-4 col-xs-4"><%= Resources.DisplayText.PerformanceGroup %>*</div>
                            <div class="col-md-8 col-xs-8">
                                <asp:TextBox ID="txt_pgname"  ValidationGroup="a" runat="server" class="form-control"></asp:TextBox>
                                 <asp:RequiredFieldValidator Display="Dynamic" runat="server" ForeColor="IndianRed" ValidationGroup="a" Font-Bold="true" ID="RequiredFieldValidator1" ControlToValidate="txt_pgname" ErrorMessage="<%$Resources:DisplayText,PleasefillPerformanceGroupfield %>" />

                            </div>
                            <br />
                        </div>
                        <div class="col-md-4 col-xs-4 userregisterinfo">
                            <br />
                            <div class="col-md-4 col-xs-4"><%= Resources.DisplayText.Alias %></div>
                            <div class="col-md-8 col-xs-8">
                                <asp:TextBox ID="txt_alias" runat="server" class="form-control"></asp:TextBox>

                            </div>
                            <br />
                        </div>
                        <div class="col-md-4 col-xs-4 userregisterinfo">
                            <br />
                            <div class="col-md-4 col-xs-4"><%= Resources.DisplayText.GroupType %>*</div>
                            <div class="col-md-8 col-xs-8">
                                <asp:DropDownList ID="DropDownList1_grouptype" runat="server" class="form-control" AutoPostBack="false" DataSourceID="SqlDataSource1_grouptypelist" DataTextField="SubCode" DataValueField="LookUpID"></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource1_grouptypelist" runat="server" ConnectionString="<%$ ConnectionStrings:AllClassicDBConnectionString %>" SelectCommand="SELECT LookUpID, MainCode, SubCode 
FROM Main.LookUpTbl
where maincode='GroupType'
"></asp:SqlDataSource>
                            </div>
                            <br />
                        </div>
                    </div>
                    <div class="col-xs-12">
                        <div class="col-md-4 col-xs-4 userregisterinfo">
                            <br />
                            <div class="col-md-4 col-xs-4"><%= Resources.DisplayText.City %>*</div>
                            <div class="col-md-8 col-xs-8">
                                <asp:DropDownList ID="DropDownList1_city" runat="server" class="form-control" AutoPostBack="false" DataSourceID="SqlDataSource1_city" DataTextField="SubCode" DataValueField="LookUpID"></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource1_city" runat="server" ConnectionString="<%$ ConnectionStrings:AllClassicDBConnectionString %>" SelectCommand="SELECT LookUpID, MainCode, SubCode 
FROM Main.LookUpTbl
where maincode='City'
"></asp:SqlDataSource>

                            </div>
                            <br />
                        </div>
                        <div class="col-md-4 col-xs-4 userregisterinfo">
                            <br />
                            <div class="col-md-4 col-xs-4"><%= Resources.DisplayText.Conductor %></div>
                            <div class="col-md-8 col-xs-8">
                                <asp:TextBox ID="txt_coductor" runat="server" class="form-control"></asp:TextBox>

                            </div>
                            <br />
                        </div>
                        <div class="col-md-4 col-xs-4 userregisterinfo">
                            <br />
                            <div class="col-md-4 col-xs-4"><%= Resources.DisplayText.SinceYear %>*</div>
                            <div class="col-md-8 col-xs-8">
                                <asp:TextBox ID="txt_sinceyear"  ValidationGroup="a" runat="server"  MaxLength="4"  class="form-control"></asp:TextBox>
                                 <asp:RequiredFieldValidator Display="Dynamic" runat="server" ForeColor="IndianRed" ValidationGroup="a" Font-Bold="true" ID="RequiredFieldValidator2" ControlToValidate="txt_sinceyear" ErrorMessage="<%$Resources:DisplayText,PleasefillSinceYearfield %>" />

                            </div>
                            <br />
                        </div>
                    </div>
                    <div class="col-xs-12">
                        <div class="col-md-4 col-xs-4 userregisterinfo">
                            <br />
                            <div class="col-md-4 col-xs-4"><%= Resources.DisplayText.Email %>*</div>
                            <div class="col-md-8 col-xs-8">
                                <asp:TextBox ID="txt_email" runat="server" ValidationGroup="a"  class="form-control" TextMode="Email"></asp:TextBox>
                                 <asp:RequiredFieldValidator Display="Dynamic" runat="server" ForeColor="IndianRed" ValidationGroup="a" Font-Bold="true" ID="RequiredFieldValidator3" ControlToValidate="txt_email" ErrorMessage="<%$Resources:DisplayText,PleasefillEmailfield %>" />

                            </div>
                            <br />
                        </div>
                        <div class="col-md-4 col-xs-4 userregisterinfo">
                            <br />
                            <div class="col-md-4 col-xs-4"><%= Resources.DisplayText.Address %>*</div>
                            <div class="col-md-8 col-xs-8">
                                <asp:TextBox ID="txt_address" ValidationGroup="a"  runat="server" class="form-control"></asp:TextBox>
                                 <asp:RequiredFieldValidator Display="Dynamic" runat="server" ForeColor="IndianRed" ValidationGroup="a" Font-Bold="true" ID="RequiredFieldValidator4" ControlToValidate="txt_address" ErrorMessage="<%$Resources:DisplayText,PleasefillAddressfield %>" />
                            </div>
                            <br />
                        </div>
                        <div class="col-md-4 col-xs-4 userregisterinfo">
                            <br />
                            <div class="col-md-4 col-xs-4"><%= Resources.DisplayText.ZipCode %>*</div>
                            <div class="col-md-8 col-xs-8">
                                <asp:TextBox ID="txt_zipcode"  ValidationGroup="a" MaxLength="6" runat="server" class="form-control"></asp:TextBox>
                                 <asp:RequiredFieldValidator Display="Dynamic" runat="server" ForeColor="IndianRed" ValidationGroup="a" Font-Bold="true" ID="RequiredFieldValidator5" ControlToValidate="txt_zipcode" ErrorMessage="<%$Resources:DisplayText,PleasefillZipCodefield %>" />

                            </div>
                            <br />
                        </div>
                    </div>
                    <div class="col-xs-12">
                        <div class="col-md-4 col-xs-4 userregisterinfo">
                            <br />
                            <div class="col-md-4 col-xs-4"><%= Resources.DisplayText.TelNo %>*</div>
                            <div class="col-md-8 col-xs-8">
                                <asp:TextBox ID="txt_telno"  ValidationGroup="a" runat="server" class="form-control"></asp:TextBox>
                                 <asp:RequiredFieldValidator Display="Dynamic" runat="server" ForeColor="IndianRed" ValidationGroup="a" Font-Bold="true" ID="RequiredFieldValidator6" ControlToValidate="txt_telno" ErrorMessage="<%$Resources:DisplayText,PleasefillTelNofield %>" />

                            </div>
                            <br />
                        </div>
                        <div class="col-md-4 col-xs-4 userregisterinfo">
                            <br />
                            <div class="col-md-4 col-xs-4"><%= Resources.DisplayText.FaxNo %></div>
                            <div class="col-md-8 col-xs-8">
                                <asp:TextBox ID="txt_faxno" runat="server" class="form-control"></asp:TextBox>

                            </div>
                            <br />
                        </div>
                        <div class="col-md-4 col-xs-4 userregisterinfo">
                            <br />
                            <div class="col-md-4 col-xs-4"><%= Resources.DisplayText.HomePage %></div>
                            <div class="col-md-8 col-xs-8">
                                <asp:TextBox ID="txt_homepage" runat="server" class="form-control"></asp:TextBox>

                            </div>
                            <br />
                        </div>
                    </div>

                </div>

            </div>

            <div class="row">
                <br />
                <div class="row col-md-12 col-xs-12">
                    <asp:Button Visible="true" ID="btn_pg_cancel" CssClass="btn btn-danger pull-right" runat="server" Text="<%$Resources:DisplayText,Cancel %>" OnClick="btn_pg_cancel_Click" Style="margin-right: 10px;" />
                    <asp:Button Visible="true" ID="btn_pg_save"  ValidationGroup="a"  CssClass="btn btn-warning pull-right" runat="server" Text="<%$Resources:DisplayText,Update %>" OnClick="btn_pg_save_Click" Style="margin-right: 10px;" />
                    <asp:Button ID="btn_pg_add" CssClass="btn btn-primary pull-right"  ValidationGroup="a"  runat="server" Text="<%$Resources:DisplayText,Add %>" OnClick="btn_pg_add_Click" Style="margin-right: 10px;" />
                </div>
            </div>

        </ContentTemplate>


        <Triggers>
            <%-- <asp:PostBackTrigger ControlID="btn_artist_add" />
                <asp:PostBackTrigger ControlID="btn_artist_save" />--%>
            <%--<asp:PostBackTrigger ControlID="btn_artist_save" />--%>
        </Triggers>
    </asp:UpdatePanel>

    <style>
        .userregisterinfo div {
            padding: 0px;
        }
    </style>

</asp:Content>
