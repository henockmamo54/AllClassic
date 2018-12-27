<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="AllClassicWeb.Views.Login" %>

<head runat="server">
    <meta charset="utf-8" />

    <webopt:BundleReference runat="server" Path="~/Content/css" />
    <link rel="stylesheet" type="text/css" href="../Content/Site.css" />
    <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
    <script src="../Scripts/jquery-3.3.1.min.js"></script>

</head>
<body style="padding-top: 2px;">

    <form runat="server">

        <asp:ScriptManager runat="server" runat="server">
        </asp:ScriptManager>


        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>

                <div class="container" style="padding-top: 90px; font-family: 'Open Sans', sans-serif;">
                    <div class="card card-container" style="background: white; border-top: 1px solid lightgray;">
                        <img id="profile-img" class="profile-img-card" src="//ssl.gstatic.com/accounts/ui/avatar_2x.png" />
                        <p id="profile-name" class="profile-name-card"></p>
                        <form class="form-signin" defaultbutton="Button1_signin">

                            <span id="reauth-email" class="reauth-email"></span>

                            <asp:TextBox type="text" ID="inputEmail" class="form-control" placeholder="<%$Resources:DisplayText,Email %>" required autofocus Style="margin-bottom: 0.7em;" runat="server"></asp:TextBox>
                            <asp:TextBox type="password" ID="inputPassword" class="form-control" placeholder="<%$Resources:DisplayText,Password %>" required Style="margin-bottom: 0.7em;" runat="server"></asp:TextBox>


                            <asp:Label Style="color: red" ID="Label1_warnningmessage" runat="server" Text="Label" Visible="false">Login not successful. please check your login information.</asp:Label>
                            <div id="remember" class="checkbox">
                                <label>
                                    <input type="checkbox">
                                    <asp:CheckBox ID="CheckBox1" runat="server" value="remember-me" />
                                    <%= Resources.DisplayText.Rememberme %>
                                </label>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </div>
                            <asp:Button class="btn btn-lg btn-primary btn-block btn-signin" ID="Button1_signin" runat="server" Text="<%$Resources:DisplayText,SignIn %>" OnClick="Button1_signin_Click1" />

                        </form>
                        <!-- /form -->
                        <a onclick="ForgotPassword()" class="forgot-password"><%= Resources.DisplayText.Forgotthepassword %>
                            <asp:LinkButton ID="LinkButton1" runat="server" OnClientClick='redirect()'><%= Resources.DisplayText.SignUp %></asp:LinkButton>
                        </a>
                    </div>
                    <!-- /card-container -->
                </div>

            </ContentTemplate>

        </asp:UpdatePanel>

        <script type="text/javascript">

            function redirect() {
                //location.href = 'UserPage.aspx';
                location.href = 'SignUp/TermsOfUsePage.aspx';
            }



            function ForgotPassword() {
                $.support.cors = true;

                var txt;
                var person = prompt("Do you want to send password reset email to:?", $("#inputEmail").val());
                if (person == null || person == "") {
                    txt = "User cancelled the prompt.";
                } else {

                    //check confirmation
                    //if (confirm("Do you want to send Password reset Email?"))
                    {
                        // check for user login

                        $.ajax({
                            type: "POST",
                            url: "Login.aspx/SendPasswordResetEmail", //Pagename/Functionname
                            contentType: "application/json;charset=utf-8",
                            dataType: "json",
                            data: JSON.stringify({ email: $("#inputEmail").val() }), //{ },//data
                            success: function (data) {
                                //alert('success') 

                                //if log in show the reply message 
                                if (data.d) {

                                    alert('Please check your email to continue!!!');
                                }

                                else {
                                    alert('Email not sent !!!');
                                }

                            },
                            error: function (result) {
                                console.log(result)
                                //alert("error")

                            }
                        });

                    }
                }

            }




        </script>

        <style>
            body, html {
                height: 100%;
                background-repeat: no-repeat;
                /*background-image: linear-gradient(rgb(104, 145, 162), rgb(12, 97, 33));*/
            }

            .card-container.card {
                max-width: 350px;
                padding: 40px 40px;
            }

            .btn {
                font-weight: 700;
                height: 36px;
                -moz-user-select: none;
                -webkit-user-select: none;
                user-select: none;
                cursor: default;
            }


            .card {
                background-color: #F7F7F7;
                /* just in case there no content*/
                padding: 20px 25px 30px;
                margin: 0 auto 25px;
                margin-top: 50px;
                /* shadows and rounded borders */
                -moz-border-radius: 2px;
                -webkit-border-radius: 2px;
                border-radius: 2px;
                -moz-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
                -webkit-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
                box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
            }

            .profile-img-card {
                width: 96px;
                height: 96px;
                margin: 0 auto 10px;
                display: block;
                -moz-border-radius: 50%;
                -webkit-border-radius: 50%;
                border-radius: 50%;
            }

            .profile-name-card {
                font-size: 16px;
                font-weight: bold;
                text-align: center;
                margin: 10px 0 0;
                min-height: 1em;
            }

            .reauth-email {
                display: block;
                color: #404040;
                line-height: 2;
                margin-bottom: 10px;
                font-size: 14px;
                text-align: center;
                overflow: hidden;
                text-overflow: ellipsis;
                white-space: nowrap;
                -moz-box-sizing: border-box;
                -webkit-box-sizing: border-box;
                box-sizing: border-box;
            }

            .form-signin #inputEmail,
            .form-signin #inputPassword {
                direction: ltr;
                height: 44px;
                font-size: 16px;
            }

            .form-signin input[type=email],
            .form-signin input[type=text],
            .form-signin input[type=password],
            .form-signin input[type=text],
            .form-signin button {
                width: 100%;
                display: block;
                margin-bottom: 10px;
                z-index: 1;
                position: relative;
                -moz-box-sizing: border-box;
                -webkit-box-sizing: border-box;
                box-sizing: border-box;
            }

            .form-signin .form-control:focus {
                border-color: rgb(104, 145, 162);
                outline: 0;
                -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgb(104, 145, 162);
                box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgb(104, 145, 162);
            }

            .btn.btn-signin {
                /*background-color: #4d90fe; */
                background-color: rgb(104, 145, 162);
                /* background-color: linear-gradient(rgb(104, 145, 162), rgb(12, 97, 33));*/
                padding: 0px;
                font-weight: 700;
                font-size: 14px;
                height: 36px;
                -moz-border-radius: 3px;
                -webkit-border-radius: 3px;
                border-radius: 3px;
                border: none;
                -o-transition: all 0.218s;
                -moz-transition: all 0.218s;
                -webkit-transition: all 0.218s;
                transition: all 0.218s;
            }

                .btn.btn-signin:hover,
                .btn.btn-signin:active,
                .btn.btn-signin:focus {
                    background-color: rgb(12, 97, 33);
                }

            .forgot-password {
                color: rgb(104, 145, 162);
            }

                .forgot-password:hover,
                .forgot-password:active,
                .forgot-password:focus {
                    color: rgb(12, 97, 33);
                }
        </style>

    </form>

</body>
