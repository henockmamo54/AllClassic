<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserInformationRegistration.aspx.cs" Inherits="AllClassicWeb.Views.SignUp.UserInformationRegistration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <asp:UpdatePanel runat="server" ID="updatepanel1">
        <ContentTemplate>
            <%--<link href="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.css" rel="stylesheet" />--%>
            <link href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/css/bootstrap-datetimepicker.css" rel="stylesheet" />
            <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.js"></script>
            <script src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.15.2/moment.min.js"></script>
            <script src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.js"></script>
            <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>

            <h4>Sign Up</h4>
            <div class="row">
                <div class="col-md-2 col-xs-2">
                    <ul class="list-group">
                        <a class="list-group-item list-group-item-action" href="TermsOfUsePage.aspx"><%= Resources.DisplayText.AcceptTerms %></a>
                        <a class="list-group-item list-group-item-action active"><%= Resources.DisplayText.UserInfo %></a>
                    </ul>
                </div>
                <div class="col-md-10 col-xs-10">
                    <div class="col-md-12 col-xs-12 shadowedPanel" style="background-color: white;">
                        <div class="rwo" style="padding-bottom: 10px;">
                            <label><%= Resources.DisplayText.WhatkindOfUserAreyou %> <%= Resources.DisplayText.Pleaseclickasmanyasyouthinkyouare %> </label>
                            <hr style="margin-top: 5px;" />

                            <div class="row">

                                <div class="col-md-6 col-xs-6 form-group">

                                    <asp:CheckBox runat="server" ID="chk_composer" Text="<%$Resources:DisplayText,Composer %>" Style="padding: 5px;" AutoPostBack="true" /><br />
                                    <asp:CheckBox runat="server" ID="chk_conductor" Text="<%$Resources:DisplayText,Conductor %>" Style="padding: 5px;" AutoPostBack="true" /><br />
                                    <asp:CheckBox runat="server" ID="chk_professor" Text="<%$Resources:DisplayText,TeacherProfessor %>" Style="padding: 5px;" AutoPostBack="true" /><br />
                                    <asp:CheckBox runat="server" ID="chk_promusician" Text="<%$Resources:DisplayText,ProMusician %>" Style="padding: 5px;" AutoPostBack="true" /><br />
                                    <asp:CheckBox runat="server" ID="chk_student" Text="<%$Resources:DisplayText,Student %>" Style="padding: 5px;" AutoPostBack="true" /><br />
                                    <asp:CheckBox runat="server" ID="chk_amaturemusician" Text="<%$Resources:DisplayText,AmatureMusician %>" Style="padding: 5px;" AutoPostBack="true" /><br />
                                    <asp:CheckBox runat="server" ID="chk_reporter" Text="<%$Resources:DisplayText,Reporter %>" Style="padding: 5px;" AutoPostBack="true" /><br />

                                </div>

                                <div class="col-md-6 col-xs-6 form-group">

                                    <asp:CheckBox runat="server" ID="chk_classicmani" Text="<%$Resources:DisplayText,ClassicMania %>" Style="padding: 5px;" AutoPostBack="true" /><br />
                                    <asp:CheckBox runat="server" ID="chk_adminofPerformanceGroup" Text="<%$Resources:DisplayText,AdmistraterOfPerformanceGroup %>" Style="padding: 5px;" AutoPostBack="true" /><br />
                                    <asp:CheckBox runat="server" ID="chk_adminofpromotor" Text="<%$Resources:DisplayText,AdmistraterOfPromoter %>" Style="padding: 5px;" AutoPostBack="true" /><br />
                                    <asp:CheckBox runat="server" ID="chk_adminofagent" Text="<%$Resources:DisplayText,AdmistraterOfAgent %>" Style="padding: 5px;" AutoPostBack="true" /><br />
                                    <asp:CheckBox runat="server" ID="chk_adminoforganizer" Text="<%$Resources:DisplayText,AdmistraterOfOrganizer %>" Style="padding: 5px;" AutoPostBack="true" /><br />
                                    <asp:CheckBox runat="server" ID="chk_shopowner" Text="<%$Resources:DisplayText,ShopOwner %>" Style="padding: 5px;" AutoPostBack="true" /><br />
                                    <asp:CheckBox runat="server" ID="chk_blogger" Text="<%$Resources:DisplayText,Blogger %>" Style="padding: 5px;" AutoPostBack="true" /><br />
                                    <asp:CheckBox runat="server" ID="chk_other" Text="<%$Resources:DisplayText,Other %>" Style="padding: 5px;" AutoPostBack="true" /><br />

                                </div>

                            </div>

                            <div class="row col-md-10 col-xs-10 userregisterinfo">
                                <div class="col-md-12 col-xs-12">
                                    <br />
                                    <div class="col-md-2 col-xs-2"><%= Resources.DisplayText.Email %>*</div>
                                    <div class="col-md-4 col-xs-4">
                                        <asp:TextBox ID="uemail" ValidationGroup="a"  TextMode="Email" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-md-4 col-xs-4">
                                        <asp:RequiredFieldValidator runat="server" ForeColor="IndianRed" ID="reqName" ValidationGroup="a"  Font-Bold="true" ControlToValidate="uemail" ErrorMessage="<%$Resources:DisplayText,PleaseenteryourEmail %>" />
                                    </div>
                                    <br />

                                </div>
                                <div class="col-md-12 col-xs-12">

                                    <div class="col-md-2 col-xs-2"><%= Resources.DisplayText.Password %>*</div>
                                    <div class="col-md-4 col-xs-4">
                                        <asp:TextBox ID="upassword" ValidationGroup="a"  TextMode="Password" runat="server" class="form-control" MaxLength="12"></asp:TextBox>
                                    </div>
                                    <div class="col-md-4 col-xs-4">
                                        <asp:RequiredFieldValidator runat="server" ForeColor="IndianRed" ValidationGroup="a" Font-Bold="true" ID="RequiredFieldValidator1" ControlToValidate="upassword" ErrorMessage="<%$Resources:DisplayText,PleaseenteryourPassword %>" />
                                    </div>
                                    <br />

                                </div>
                                <div class="col-md-12 col-xs-12">

                                    <div class="col-md-2 col-xs-2"><%= Resources.DisplayText.FullName %>*</div>
                                    <div class="datetimepicker2_start col-md-4 col-xs-4">
                                        <asp:TextBox ID="uname" ValidationGroup="a"  runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-md-4 col-xs-4">
                                        <asp:RequiredFieldValidator  runat="server" ForeColor="IndianRed" ValidationGroup="a" Font-Bold="true" ID="RequiredFieldValidator2" ControlToValidate="uname" ErrorMessage="<%$Resources:DisplayText,PleaseenteryourFullName %>"  />
                                    </div>
                                    <br />
                                </div>
                                <div class="col-md-12 col-xs-12">

                                    <div class="col-md-2 col-xs-2"><%= Resources.DisplayText.NickName %></div>
                                    <div class="datetimepicker2_start col-md-4 col-xs-4">
                                        <asp:TextBox ID="unickname" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                    <br />
                                </div>
                                <div class="col-md-12 col-xs-12">

                                    <div class="col-md-2 col-xs-2"><%= Resources.DisplayText.MobileNo %></div>
                                    <div class="datetimepicker2_start col-md-4 col-xs-4">
                                        <asp:TextBox ID="umobile" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                    <br />
                                </div>
                                <div class="col-md-12 col-xs-12">

                                    <div class="col-md-2 col-xs-2"><%= Resources.DisplayText.FacebookURL %></div>
                                    <div class="datetimepicker2_start col-md-4 col-xs-4">
                                        <asp:TextBox ID="ufacebookurl" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                    <br />
                                </div>
                                <div class="col-md-12 col-xs-12">

                                    <div class="col-md-2 col-xs-2"><%= Resources.DisplayText.TwitterURL %></div>
                                    <div class="datetimepicker2_start col-md-4 col-xs-4">
                                        <asp:TextBox ID="utwitterurl" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                    <br />
                                </div>
                                <div class="col-md-12 col-xs-12">

                                    <div class="col-md-2 col-xs-2"><%= Resources.DisplayText.KakaoTalkID %></div>
                                    <div class="datetimepicker2_start col-md-4 col-xs-4">
                                        <asp:TextBox ID="ukakaotalkid" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                    <br />
                                </div>
                                <div class="col-md-12 col-xs-12">

                                    <div class="col-md-2 col-xs-2"><%= Resources.DisplayText.OtherSNS %></div>
                                    <div class="datetimepicker2_start col-md-4 col-xs-4">
                                        <asp:TextBox ID="uothersns" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                    <br />
                                </div>
                                <div class="col-md-12 col-xs-12">

                                    <div class="col-md-2 col-xs-2"><%= Resources.DisplayText.YourAffilation %></div>
                                    <div class="col-md-4 col-xs-4">

                                        <asp:TextBox ID="uaffilation" runat="server" placeholder="Your Affilation" class="form-control"></asp:TextBox>
                                        <%--<asp:DropDownList ID="DropDownList1_youraffilation" runat="server" class="form-control" AutoPostBack="True"></asp:DropDownList>--%>
                                        <%--<asp:DropDownList ID="DropDownList1_Affilation" runat="server" class="form-control" DataSourceID="SqlDataSource1_allOrchestra" DataTextField="OfficialName" DataValueField="ID" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_Affilation_SelectedIndexChanged"></asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource1_allOrchestra" runat="server" ConnectionString="<%$ ConnectionStrings:OrchestraDBConnectionString %>" SelectCommand="SELECT [OfficialName]='Other', [ID]=-1 FROM  core.[Orchestra]
union
SELECT [OfficialName], [ID] FROM  core.[Orchestra]"></asp:SqlDataSource>--%>
                                    </div>
                                    <br />
                                </div>

                                <%--<div class="col-md-12 col-xs-12">

                                    <div class="col-md-4 col-xs-4"></div>
                                    <div class="col-md-6 col-xs-6">

                                        <asp:TextBox ID="uaffilation" runat="server" placeholder="Your Affilation" class="form-control"></asp:TextBox>
                                    </div>
                                    <br />
                                </div>--%>

                                <div class="col-md-12 col-xs-12">

                                    <div class="col-md-2 col-xs-2"><%= Resources.DisplayText.Birthday %></div>
                                    <div class="col-md-4 col-xs-4">
                                        <div class='input-group date' id='datetimepicker2' style="display: flex;">
                                            <input type='text' class="form-control" runat="server" id="userBirthDate" style="display: inline-block; border-right-width: 0px;" />
                                            <span class="input-group-addon" style="flex-wrap: wrap; width: auto; display: inline-block; padding-left: 12px; margin-left: -5px; padding-top: 9px; padding-bottom: 6px;">
                                                <span class="glyphicon glyphicon-calendar"></span>
                                            </span>
                                        </div>
                                    </div>
                                    <br />
                                </div>
                                <div class="col-md-12 col-xs-12">

                                    <div class="col-md-2 col-xs-2"><%= Resources.DisplayText.ZipCode %></div>
                                    <div class="col-md-4 col-xs-4">
                                        <asp:TextBox ID="uzipcode" runat="server" class="form-control" MaxLength="6"></asp:TextBox>
                                    </div>
                                    <br />
                                </div>
                                <div class="col-md-12 col-xs-12">

                                    <div class="col-md-2 col-xs-2"><%= Resources.DisplayText.Address %></div>
                                    <div class="col-md-4 col-xs-4">
                                        <asp:TextBox ID="uaddress" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                    <br />
                                </div>



                            </div>

                            <%-- --%>
                            <div class="col-md-12 col-xs-12 pull-right" style="text-align: center;">
                                <br />
                                <asp:Button ID="Button1" CssClass="btn btn-danger " runat="server" Text="<%$Resources:DisplayText,Cancel %>" OnClick="btn_cancel_click" />
                                <asp:Button ID="Button2" CssClass="btn btn-success " ValidationGroup="a"  runat="server" Text="<%$Resources:DisplayText,Register %>" OnClick="btn_reguserInfo_click" />
                            </div>


                        </div>

                    </div>
                    <br />
                </div>

            </div>

        </ContentTemplate>

        <Triggers>
        </Triggers>

    </asp:UpdatePanel>

    <script type="text/javascript">
        function closeModal() {
            $('#exampleModalLong').modal('hide');
            $('.modal-backdrop').remove();
            $('body').removeClass('modal-open');

            //alert('test');
        }
        function bindDateTime() {
            $('#datetimepicker2').datetimepicker({
                format: 'MM/DD/YYYY'
            });
        }
        $(function () {
            $('#datetimepicker2').datetimepicker({
                format: 'MM/DD/YYYY'
            });
        });

        document.getElementById("signuptab").style.backgroundColor = "rgb(255, 255, 255) ";
        document.getElementById("signuptab").style.borderRight = "none";

    </script>

    <style>
        .shadowedPanel {
            border: 1px solid transparent;
            border-radius: 4px;
            border-color: #dddddd;
            padding: 1em;
            box-shadow: 2px 2px 2px 2px #f5f5f5;
        }

        #endorserdiv .col-md-12 col-xs-12 {
            padding: 0 !important;
        }

        #endorserdiv .col-md-4 col-xs-4 {
            padding: 0 !important;
        }

        .userregisterinfo div {
            padding: 0px;
            margin: 2px;
        }

        .userregisterinfo {
            padding-left: 20px;
        }
    </style>




</asp:Content>
