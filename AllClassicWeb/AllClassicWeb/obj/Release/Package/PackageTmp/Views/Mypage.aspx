<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Mypage.aspx.cs" Inherits="AllClassicWeb.Views.Mypage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/css/bootstrap-datetimepicker.css" rel="stylesheet" />
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.15.2/moment.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>


    <br />

    <asp:UpdatePanel runat="server">
        <ContentTemplate>

            <ul class="nav nav-tabs">
                <li class="active"><a data-toggle="tab" href="#menu1"><%=Resources.DisplayText.PersonalInfo %></a>

                </li>
                <li><a data-toggle="tab" href="#menu2"><%=Resources.DisplayText.Edit %></a></li>
                <li><a data-toggle="tab" href="#menu3"><%=Resources.DisplayText.Unsubscribe %></a></li>
            </ul>

            <div class="tab-content">

                <div id="menu1" class="tab-pane fade in active">
                    <div class="row  col-xs-10 userregisterinfo">
                        <div class=" col-xs-12 rowdisplasywithmargin">
                            <br />
                            <div class=" col-xs-3 filedName"><%= Resources.DisplayText.Email %></div>
                            <div class=" col-xs-4 filedDisplay">
                                <asp:Label ID="txt_email" ValidationGroup="a" TextMode="Email" runat="server" class="  filedDisplay"></asp:Label>
                                <br />
                            </div>

                        </div>
                        <div class=" col-xs-12 rowdisplasywithmargin">

                            <div class=" col-xs-3 filedName"><%= Resources.DisplayText.Password %></div>
                            <div class=" col-xs-4 filedDisplay">
                                <asp:Label ID="txt_password" ValidationGroup="a" TextMode="Password" runat="server" class="  filedDisplay" MaxLength="12"></asp:Label>
                                <br />
                            </div>

                        </div>
                        <div class=" col-xs-12 rowdisplasywithmargin">

                            <div class=" col-xs-3 filedName"><%= Resources.DisplayText.FullName %></div>
                            <div class=" col-xs-4 filedDisplay">
                                <asp:Label ID="txt_name" ValidationGroup="a" runat="server" class="  filedDisplay"></asp:Label>
                                <br />
                            </div>
                        </div>
                        <div class=" col-xs-12 rowdisplasywithmargin">

                            <div class=" col-xs-3 filedName"><%= Resources.DisplayText.NickName %></div>
                            <div class=" col-xs-4 filedDisplay">
                                <asp:Label ID="txt_nickname" runat="server" class="  filedDisplay"></asp:Label>
                                <br />
                            </div>
                            <br />
                        </div>
                        <div class=" col-xs-12 rowdisplasywithmargin">

                            <div class=" col-xs-3 filedName"><%= Resources.DisplayText.MobileNo %></div>
                            <div class=" col-xs-4 filedDisplay">
                                <asp:Label ID="txt_mobile" runat="server" class="  filedDisplay"></asp:Label>
                                <br />
                            </div>
                            <br />
                        </div>
                        <div class=" col-xs-12 rowdisplasywithmargin">

                            <div class=" col-xs-3 filedName"><%= Resources.DisplayText.FacebookURL %></div>
                            <div class=" col-xs-4 filedDisplay">
                                <asp:Label ID="txt_facebookurl" runat="server" class="  filedDisplay"></asp:Label>
                                <br />
                            </div>
                            <br />
                        </div>
                        <div class=" col-xs-12 rowdisplasywithmargin">

                            <div class=" col-xs-3 filedName"><%= Resources.DisplayText.TwitterURL %></div>
                            <div class=" col-xs-4 filedDisplay">
                                <asp:Label ID="txt_twitterurl" runat="server" class="  filedDisplay"></asp:Label>
                                <br />
                            </div>
                            <br />
                        </div>
                        <div class=" col-xs-12 rowdisplasywithmargin">

                            <div class=" col-xs-3 filedName"><%= Resources.DisplayText.KakaoTalkID %></div>
                            <div class=" col-xs-4 filedDisplay">
                                <asp:Label ID="txt_kakaotalkid" runat="server" class="  filedDisplay"></asp:Label>
                                <br />
                            </div>
                            <br />
                        </div>
                        <div class=" col-xs-12 rowdisplasywithmargin">

                            <div class=" col-xs-3 filedName"><%= Resources.DisplayText.OtherSNS %></div>
                            <div class=" col-xs-4 filedDisplay">
                                <asp:Label ID="txt_othersns" runat="server" class="  filedDisplay"></asp:Label>
                                <br />
                            </div>
                            <br />
                        </div>
                        <div class=" col-xs-12 rowdisplasywithmargin">

                            <div class=" col-xs-3 filedName"><%= Resources.DisplayText.YourAffilation %></div>
                            <div class=" col-xs-4 filedDisplay">

                                <asp:Label ID="txt_affilation" runat="server" placeholder="Your Affilation" class="  filedDisplay"></asp:Label>
                                <br />

                            </div>
                            <br />
                        </div>

                        <div class=" col-xs-12 rowdisplasywithmargin">

                            <div class=" col-xs-3 filedName"><%= Resources.DisplayText.Birthday %></div>
                            <div class=" col-xs-4 filedDisplay">
                                <asp:Label runat="server" ID="txt_birthday"></asp:Label>
                            </div>
                            <br />
                        </div>
                        <div class=" col-xs-12 rowdisplasywithmargin">

                            <div class=" col-xs-3 filedName"><%= Resources.DisplayText.ZipCode %></div>
                            <div class=" col-xs-4 filedDisplay">
                                <asp:Label ID="txt_zipcode" runat="server" class="  filedDisplay" MaxLength="6"></asp:Label>
                                <br />
                            </div>
                            <br />
                        </div>
                        <div class=" col-xs-12 rowdisplasywithmargin">

                            <div class=" col-xs-3 filedName"><%= Resources.DisplayText.Address %></div>
                            <div class=" col-xs-4 filedDisplay">
                                <asp:Label ID="txt_address" runat="server" class="  filedDisplay"></asp:Label>
                                <br />
                            </div>
                            <br />
                        </div>
                        <div class=" col-xs-12 rowdisplasywithmargin">

                            <div class=" col-xs-3 filedName"><%= Resources.DisplayText.GroupType %></div>
                            <div class=" col-xs-4 filedDisplay">
                                <asp:Label ID="txt_usertype" runat="server" class="  filedDisplay"></asp:Label>
                                <br />
                            </div>
                            <br />
                        </div>



                    </div>
                </div>
                <div id="menu2" class="tab-pane fade">
                    <br />
                    <label class="filedName"><%= Resources.DisplayText.WhatkindOfUserAreyou %> <%= Resources.DisplayText.Pleaseclickasmanyasyouthinkyouare %> </label>
                    <hr style="margin-top: 5px;" />

                    <div class="row filedName form-group">

                        <div class="col-md-6 col-xs-6 form-group">

                            <asp:CheckBox runat="server" ID="chk_composer" Text="<%$Resources:DisplayText,Composer %>" Style="padding: 5px;" AutoPostBack="false" /><br />
                            <asp:CheckBox runat="server" ID="chk_conductor" Text="<%$Resources:DisplayText,Conductor %>" Style="padding: 5px;" AutoPostBack="false" /><br />
                            <asp:CheckBox runat="server" ID="chk_professor" Text="<%$Resources:DisplayText,TeacherProfessor %>" Style="padding: 5px;" AutoPostBack="false" /><br />
                            <asp:CheckBox runat="server" ID="chk_promusician" Text="<%$Resources:DisplayText,ProMusician %>" Style="padding: 5px;" AutoPostBack="false" /><br />
                            <asp:CheckBox runat="server" ID="chk_student" Text="<%$Resources:DisplayText,Student %>" Style="padding: 5px;" AutoPostBack="false" /><br />
                            <asp:CheckBox runat="server" ID="chk_amaturemusician" Text="<%$Resources:DisplayText,AmatureMusician %>" Style="padding: 5px;" AutoPostBack="false" /><br />
                            <asp:CheckBox runat="server" ID="chk_reporter" Text="<%$Resources:DisplayText,Reporter %>" Style="padding: 5px;" AutoPostBack="false" /><br />

                        </div>

                        <div class="col-md-6 col-xs-6 form-group">

                            <asp:CheckBox runat="server" ID="chk_classicmani" Text="<%$Resources:DisplayText,ClassicMania %>" Style="padding: 5px;" AutoPostBack="false" /><br />
                            <asp:CheckBox runat="server" ID="chk_adminofPerformanceGroup" Text="<%$Resources:DisplayText,AdmistraterOfPerformanceGroup %>" Style="padding: 5px;" AutoPostBack="false" /><br />
                            <asp:CheckBox runat="server" ID="chk_adminofpromotor" Text="<%$Resources:DisplayText,AdmistraterOfPromoter %>" Style="padding: 5px;" AutoPostBack="false" /><br />
                            <asp:CheckBox runat="server" ID="chk_adminofagent" Text="<%$Resources:DisplayText,AdmistraterOfAgent %>" Style="padding: 5px;" AutoPostBack="false" /><br />
                            <asp:CheckBox runat="server" ID="chk_adminoforganizer" Text="<%$Resources:DisplayText,AdmistraterOfOrganizer %>" Style="padding: 5px;" AutoPostBack="false" /><br />
                            <asp:CheckBox runat="server" ID="chk_shopowner" Text="<%$Resources:DisplayText,ShopOwner %>" Style="padding: 5px;" AutoPostBack="false" /><br />
                            <asp:CheckBox runat="server" ID="chk_blogger" Text="<%$Resources:DisplayText,Blogger %>" Style="padding: 5px;" AutoPostBack="false" /><br />
                            <asp:CheckBox runat="server" ID="chk_other" Text="<%$Resources:DisplayText,Other %>" Style="padding: 5px;" AutoPostBack="false" /><br />

                        </div>

                    </div>


                    <div class="row  col-xs-10 userregisterinfo form-group">
                        <div class=" col-xs-12">
                            <br />
                            <div class=" col-xs-2 filedName"><%= Resources.DisplayText.Email %>*</div>
                            <div class=" col-xs-4 filedDisplay">
                                <asp:Label ID="uemail" Enabled="false" TextMode="Email" runat="server" class="form-control filedDisplay"></asp:Label>
                            </div>
                            <div class=" col-xs-4 filedDisplay">
                                <%--<asp:RequiredFieldValidator runat="server" ForeColor="IndianRed" ID="reqName" ValidationGroup="a" Font-Bold="true" ControlToValidate="uemail" ErrorMessage="<%$Resources:DisplayText,PleaseenteryourEmail %>" />--%>
                            </div>
                            <br />

                        </div>
                        <div class=" col-xs-12">

                            <div class=" col-xs-2 filedName"><%= Resources.DisplayText.Password %>*</div>
                            <div class=" col-xs-4 filedDisplay">
                                <asp:TextBox ID="upassword" ValidationGroup="a" TextMode="Password" runat="server" class="form-control filedDisplay" MaxLength="12"></asp:TextBox>
                            </div>
                            <div class=" col-xs-4 filedDisplay">
                                <asp:RequiredFieldValidator runat="server" ForeColor="IndianRed" ValidationGroup="a" Font-Bold="true" ID="RequiredFieldValidator1" ControlToValidate="upassword" ErrorMessage="<%$Resources:DisplayText,PleaseenteryourPassword %>" />
                            </div>
                            <br />

                        </div>
                        <div class=" col-xs-12">

                            <div class=" col-xs-2 filedName"><%= Resources.DisplayText.FullName %>*</div>
                            <div class=" col-xs-4 filedDisplay">
                                <asp:TextBox ID="uname" ValidationGroup="a" runat="server" class="form-control filedDisplay"></asp:TextBox>
                            </div>
                            <div class=" col-xs-4 filedDisplay">
                                <asp:RequiredFieldValidator runat="server" ForeColor="IndianRed" ValidationGroup="a" Font-Bold="true" ID="RequiredFieldValidator2" ControlToValidate="uname" ErrorMessage="<%$Resources:DisplayText,PleaseenteryourFullName %>" />
                            </div>
                            <br />
                        </div>
                        <div class=" col-xs-12">

                            <div class=" col-xs-2 filedName"><%= Resources.DisplayText.NickName %></div>
                            <div class=" col-xs-4 filedDisplay">
                                <asp:TextBox ID="unickname" runat="server" class="form-control filedDisplay"></asp:TextBox>
                            </div>
                            <br />
                        </div>
                        <div class=" col-xs-12">

                            <div class=" col-xs-2 filedName"><%= Resources.DisplayText.MobileNo %></div>
                            <div class=" col-xs-4 filedDisplay">
                                <asp:TextBox ID="umobile" runat="server" class="form-control filedDisplay"></asp:TextBox>
                            </div>
                            <br />
                        </div>
                        <div class=" col-xs-12">

                            <div class=" col-xs-2 filedName"><%= Resources.DisplayText.FacebookURL %></div>
                            <div class=" col-xs-4 filedDisplay">
                                <asp:TextBox ID="ufacebookurl" runat="server" class="form-control filedDisplay"></asp:TextBox>
                            </div>
                            <br />
                        </div>
                        <div class=" col-xs-12">

                            <div class=" col-xs-2 filedName"><%= Resources.DisplayText.TwitterURL %></div>
                            <div class=" col-xs-4 filedDisplay">
                                <asp:TextBox ID="utwitterurl" runat="server" class="form-control filedDisplay"></asp:TextBox>
                            </div>
                            <br />
                        </div>
                        <div class=" col-xs-12">

                            <div class=" col-xs-2 filedName"><%= Resources.DisplayText.KakaoTalkID %></div>
                            <div class=" col-xs-4 filedDisplay">
                                <asp:TextBox ID="ukakaotalkid" runat="server" class="form-control filedDisplay"></asp:TextBox>
                            </div>
                            <br />
                        </div>
                        <div class=" col-xs-12">

                            <div class=" col-xs-2 filedName"><%= Resources.DisplayText.OtherSNS %></div>
                            <div class=" col-xs-4 filedDisplay">
                                <asp:TextBox ID="uothersns" runat="server" class="form-control filedDisplay"></asp:TextBox>
                            </div>
                            <br />
                        </div>
                        <div class=" col-xs-12">

                            <div class=" col-xs-2 filedName"><%= Resources.DisplayText.YourAffilation %></div>
                            <div class=" col-xs-4 filedDisplay">
                                <asp:TextBox ID="uaffilation" runat="server" placeholder="Your Affilation" class="form-control filedDisplay"></asp:TextBox>
                            </div>
                            <br />
                        </div>



                        <div class=" col-xs-12">

                            <div class=" col-xs-2 filedName"><%= Resources.DisplayText.Birthday %></div>
                            <div class=" col-xs-4 filedDisplay">
                                <div class='input-group date' id='datetimepicker2' style="display: flex;">
                                    <input type='text' class="form-control filedDisplay" runat="server" id="userBirthDate" style="display: inline-block; border-right-width: 0px;" />
                                    <span class="input-group-addon" style="flex-wrap: wrap; width: auto; display: inline-block; padding-left: 12px; margin-left: -5px; padding-top: 9px; padding-bottom: 6px;">
                                        <span class="glyphicon glyphicon-calendar"></span>
                                    </span>
                                </div>
                            </div>
                            <br />
                        </div>
                        <div class=" col-xs-12">

                            <div class=" col-xs-2 filedName"><%= Resources.DisplayText.ZipCode %></div>
                            <div class=" col-xs-4 filedDisplay">
                                <asp:TextBox ID="uzipcode" runat="server" class="form-control filedDisplay" MaxLength="6"></asp:TextBox>
                            </div>
                            <br />
                        </div>
                        <div class=" col-xs-12">

                            <div class=" col-xs-2 filedName"><%= Resources.DisplayText.Address %></div>
                            <div class=" col-xs-4 filedDisplay">
                                <asp:TextBox ID="uaddress" runat="server" class="form-control filedDisplay"></asp:TextBox>
                            </div>
                            <br />
                        </div>



                    </div>

                    <div class="col-md-12 col-xs-12 pull-right" style="text-align: center;">
                        <br />
                        <asp:Button ID="Button1" CssClass="btn btn-danger contentButton " runat="server" Text="<%$Resources:DisplayText,Cancel %>" OnClick="btn_cancel_click" />
                        <asp:Button ID="Button2" CssClass="btn btn-success contentButton" ValidationGroup="a" runat="server" Text="<%$Resources:DisplayText,Update %>" OnClick="btn_reguserInfo_click" />
                    </div>

                </div>
                <div id="menu3" class="tab-pane fade">
                    <br />
                    <p>If you want delete your account and Unsubscribe from all classic korea, click the  unsubsribe button below.</p>
                    <div class="col-md-12 col-xs-12 pull-right" style="text-align: center;">
                        <br />
                        <asp:Button ID="Button3" CssClass="btn btn-danger contentButton " runat="server" Text="<%$Resources:DisplayText,Unsubscribe %>" OnClientClick="DeleteAccount(1)" />

                    </div>
                </div>
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>

    <style>
        .rowdisplasywithmargin {
            margin: 5px;
        }
    </style>
    <script type="text/javascript">

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

        function activaTab(tab) {
            $('.nav-tabs a[href="#' + tab + '"]').tab('show');
        };



        function DeleteAccount(n) {
            $.support.cors = true;

            //check confirmation
            if (confirm("Are you sure you want to delete?")) {
                // check for user login

                $.ajax({
                    type: "POST",
                    url: "Mypage.aspx/DeleteUserByID", //Pagename/Functionname
                    contentType: "application/json;charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ userID: n }), //{ },//data
                    success: function (data) {
                        //alert('success') 

                        //if log in show the reply message 
                        if (data.d) {

                            alert('Entry deleted!!!');
                            window.location = "PerformanceDB.aspx"
                        }

                        else {
                            alert('Entry not deleted!!!');
                        }

                    },
                    error: function (result) {
                        console.log(result)
                        //alert("error")

                    }
                });

            }
        }


    </script>

    <style>
        .userregisterinfo div {
            padding: 0px;
            margin: 2px;
        }
    </style>
</asp:Content>
