<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="AllClassicWeb.Views.AboutUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h4 class="paragrphContainer" style="font-weight: 700">Message From Team</h4>
    <p class="paragrphContainer">
        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eius praesentium recusandae illo eaque architecto error, 
        repellendus iusto reprehenderit, doloribus, minus sunt. Numquam at quae voluptatum in officia voluptas voluptatibus, minus!
    </p>
    <asp:LinkButton runat="server" Text="White Paper Link" NavigateUrl="http:google.com"></asp:LinkButton>

    <h4 class="paragrphContainer" style="font-weight: 700">BOD and Advisor Introduction</h4>

    <div class="row">
        <div class="col-md-4">
            <div class="thumbnail" style="border:none">
                <a>
                     <img src="../Doc/BOD/travis-kolbjornsen-300x300.png" class="img-circle" alt="Cinque Terre"> 
                    <div class="caption" style="text-align:center">
                        <p>Lorem ipsum...</p>
                    </div>
                </a>
            </div>
        </div>
        
        <div class="col-md-4">
            <div class="thumbnail" style="border:none">
                <a>
                     <img src="../Doc/BOD/travis-kolbjornsen-300x300.png" class="img-circle" alt="Cinque Terre"> 
                    <div class="caption" style="text-align:center">
                        <p>Lorem ipsum...</p>
                    </div>
                </a>
            </div>
        </div>
       
        <div class="col-md-4">
            <div class="thumbnail" style="border:none">
                <a>
                     <img src="../Doc/BOD/travis-kolbjornsen-300x300.png" class="img-circle" alt="Cinque Terre"> 
                    <div class="caption" style="text-align:center">
                        <p>Lorem ipsum...</p>
                    </div>
                </a>
            </div>
        </div>

    </div>
    
    <div class="row">
        <div class="col-md-4">
            <div class="thumbnail">
                <a>
                     <img src="../Doc/BOD/travis-kolbjornsen-300x300.png" alt="Cinque Terre"> 
                    <div class="caption">
                        <p>Lorem ipsum...</p>
                    </div>
                </a>
            </div>
        </div>
        
        <div class="col-md-4">
            <div class="thumbnail">
                <a>
                     <img src="../Doc/BOD/travis-kolbjornsen-300x300.png" alt="Cinque Terre"> 
                    <div class="caption">
                        <p>Lorem ipsum...</p>
                    </div>
                </a>
            </div>
        </div>
        
        <div class="col-md-4">
            <div class="thumbnail">
                <a>
                     <img src="../Doc/BOD/travis-kolbjornsen-300x300.png" alt="Cinque Terre"> 
                    <div class="caption">
                        <p>Lorem ipsum...</p>
                    </div>
                </a>
            </div>
        </div>

    </div>

    <h4 class="paragrphContainer" style="font-weight: 700">For Investors</h4>
    <p class="paragrphContainer">
        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eius praesentium recusandae illo eaque architecto error, 
        repellendus iusto reprehenderit, doloribus, minus sunt. Numquam at quae voluptatum in officia voluptas voluptatibus, minus!
    </p>

    <style>
        .paragrphContainer {
            box-sizing: border-box;
            color: rgb(33, 37, 41);
            font-family: Lora, "Times New Roman", serif;
            font-size: 20px;
            font-weight: 400;
            line-height: 30px;
            margin-bottom: 30px;
            margin-left: 0px;
            margin-right: 0px;
            margin-top: 30px;
            text-align: left;
        }
    </style>
</asp:Content>
