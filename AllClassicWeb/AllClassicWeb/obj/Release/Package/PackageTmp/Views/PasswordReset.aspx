<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PasswordReset.aspx.cs" Inherits="AllClassicWeb.Views.PasswordReset" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <div class="row">
        <div class="col-xs-12">
            <div class="col-xs-3">New Password</div>
            <div class="col-xs-4">
                <asp:TextBox ID="passwordTextBox" runat="server"
                    TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator ID="passwordReq"
                    runat="server"
                    ControlToValidate="passwordTextBox"
                    ErrorMessage="Password is required!"
                    SetFocusOnError="True" Display="Dynamic" />
            </div>
        </div>
        <div class="col-xs-12" style="padding-top:10px;">

            <div class="col-xs-3">Password confirmation</div>
            <div class="col-xs-4">
                <asp:TextBox ID="confirmPasswordTextBox" runat="server"
                    TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator ID="confirmPasswordReq"
                    runat="server"
                    ControlToValidate="confirmPasswordTextBox"
                    ErrorMessage="Password confirmation is required!"
                    SetFocusOnError="True"
                    Display="Dynamic" />
                <asp:CompareValidator ID="comparePasswords"
                    runat="server"
                    ControlToCompare="passwordTextBox"
                    ControlToValidate="confirmPasswordTextBox"
                    ErrorMessage="Your passwords do not match up!"
                    Display="Dynamic" />
            </div>

        </div>

        <div class="col-xs-12">
            <asp:Button ID="submitButton"
                runat="server"
                Text="Submit"
                OnClick="submitButton_Click" CssClass="btn btn-primary" />
        </div>
    </div>
</asp:Content>
