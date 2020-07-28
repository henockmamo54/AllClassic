<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PerformanceDetail.aspx.cs" Inherits="AllClassicWeb.Views.PerformanceDetail" ValidateRequest="false" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <asp:UpdatePanel runat="server">
        <ContentTemplate>


            <!-- conbox --------------------------------------->
            <div class="conbox">

                <h2 style="color: #f2c852;"><%= Resources.DisplayText.ArchiveCenter %> *</h2>

                <div class="archdetail">
                    <div class="img">
                        <asp:Image runat="server" ID="performancePosterImage" />
                    </div>
                    <div class="box">
                        <div class="name">
                            <%--<%= Resources.DisplayText.MainTitle %>--%>
                            <asp:Label runat="server" ID="lbl_Maintitle"></asp:Label>
                        </div>
                        <%--<dl>
                            <dt><%= Resources.DisplayText.SubTitle %></dt>
                            <dd>
                                <asp:Label runat="server" ID="lbl_subtitle"></asp:Label></dd>
                        </dl>
                        <dl>
                            <dt><%= Resources.DisplayText.SubjectTheme %></dt>
                            <dd>
                                <asp:Label runat="server" ID="lbl_subjectTheme"></asp:Label></dd>
                        </dl>--%>
                        <dl>
                            <dt><%= Resources.DisplayText.PerformanceGroup %></dt>
                            <dd>
                                <asp:Label runat="server" ID="lbl_pg"></asp:Label></dd>
                        </dl>
                        <dl>
                            <dt><%= Resources.DisplayText.PerformanceType %></dt>
                            <dd>
                                <asp:Label runat="server" ID="lbl_pt"></asp:Label></dd>
                        </dl>
                        <dl>
                            <dt><%= Resources.DisplayText.Conductor %></dt>
                            <dd>
                                <asp:Label runat="server" ID="lbl_conductor"></asp:Label></dd>
                        </dl>
                        <%--<dl>
                            <dt><%= Resources.DisplayText.MainTitleComposer %></dt>
                            <dd>
                                <asp:Label runat="server" ID="lbl_maintitlecomposer"></asp:Label></dd>
                        </dl>
                        <dl>
                            <dt><%= Resources.DisplayText.MainInstrument %></dt>
                            <dd>
                                <asp:Label runat="server" ID="lbl_maininstrument"></asp:Label></dd>
                        </dl>
                        <dl>
                            <dt><%= Resources.DisplayText.Organizer %></dt>
                            <dd>
                                <asp:Label runat="server" ID="lbl_organizer"></asp:Label></dd>
                        </dl>
                        <dl>
                            <dt><%= Resources.DisplayText.Sponser %></dt>
                            <dd>
                                <asp:Label runat="server" ID="lbl_sponser"></asp:Label></dd>
                        </dl>
                        <dl>
                            <dt><%= Resources.DisplayText.Language %></dt>
                            <dd>
                                <asp:Label runat="server" ID="lbl_language"></asp:Label></dd>
                        </dl>--%>
                        <dl>
                            <dt><%= Resources.DisplayText.Start %></dt>
                            <dd>
                                <asp:Label runat="server" ID="lbl_start"></asp:Label></dd>
                        </dl>
                        <dl>
                            <dt><%= Resources.DisplayText.End %></dt>
                            <dd>
                                <asp:Label runat="server" ID="lbl_end"></asp:Label></dd>
                        </dl>
                        <dl>
                            <dt><%= Resources.DisplayText.Time %></dt>
                            <dd>
                                <asp:Label runat="server" ID="lbl_time"></asp:Label></dd>
                        </dl>
                        <%--<dl>
                            <dt><%= Resources.DisplayText.Region %></dt>
                            <dd>
                                <asp:Label runat="server" ID="lbl_region"></asp:Label></dd>
                        </dl>--%>
                        <dl>
                            <dt><%= Resources.DisplayText.City %></dt>
                            <dd>
                                <asp:Label runat="server" ID="lbl_city"></asp:Label></dd>
                        </dl>
                        <dl>
                            <dt><%= Resources.DisplayText.Venue %></dt>
                            <dd>
                                <asp:Label runat="server" ID="lbl_venu"></asp:Label></dd>
                        </dl>
                        <dl>
                            <dt><%= Resources.DisplayText.TicketBox %></dt>
                            <dd>
                                <asp:Label runat="server" ID="lbl_ticketbox"></asp:Label></dd>
                        </dl>
                        <dl>
                            <dt><%= Resources.DisplayText.Program %></dt>
                            <dd>
                                <asp:Label runat="server" ID="lbl_program"></asp:Label>
                            </dd>
                        </dl>
                        <dl>
                            <br />
                            <asp:Button CssClass="btn btn-primary contentButton" runat="server" ID="btn_editArtist" OnClick="onclick_btn_editPerformance" Text="<%$Resources:DisplayText,Edit %>" />
                            <asp:Button CssClass="btn btn-danger contentButton" runat="server" ID="btn_deleteArtist" OnClientClick="deletebtnclicked('Are you sure you want to delete?');" Text="<%$Resources:DisplayText,delete %>" />
                            <%--<asp:Button ID="Button2" runat="server" Text="Button" OnClientClick = "deletebtnclicked('Are you sure you want to delete?');"/>--%>
                            <%--<asp:Button ID="Button1" runat="server" Text="Button" OnClientClick = "return confirm('Are you sure you want to delete?');"/>--%>
                        </dl>
                    </div>


                </div>




            </div>
            <!-- conbox --------------------------------------->



            <%--            <div class="row" id="forAudience" runat="server">
                <div class="row col-xs-12">
                    <div class="col-md-8 col-xs-8">
                    </div>
                </div>
                <div class="col-md-8 col-xs-8">



                    <br />
                    <br />

                    <div class="social-like testhover" style="margin-left: 1.2em; margin-right: 0.5em;" runat="server">

                        <asp:ImageButton Visible="false" ImageUrl="~/Doc/Icons/l-c.png" Width="30px" runat="server" ID="likebuttonliked" Text="Like"
                            OnCommand="LikeClicked" CommandName="MyUpdate" CommandArgument=' 2 , 1 ' />

                        <asp:ImageButton Visible='true' ImageUrl="~/Doc/Icons/l.png" Width="30px" runat="server" ID="likebutton" Text="Like"
                            OnCommand="LikeClicked" CommandName="MyUpdate" CommandArgument='2 , 1 ' />
                        <span class="count" id="likecountspan" runat="server"></span>
                    </div>


                    <div class="social-dislike testhover ">

                        <asp:ImageButton Visible='false' ImageUrl="~/Doc/Icons/dl-c.png" Width="30px" runat="server" ID="dislikebuttondisliked" Text="DisLike"
                            OnCommand="LikeClicked" CommandName="MyUpdate" CommandArgument='2, -1' />

                        <asp:ImageButton Visible='true' ImageUrl="~/Doc/Icons/dl.png" Width="30px" runat="server" ID="dislikebutton" Text="DisLike"
                            OnCommand="LikeClicked" CommandName="MyUpdate" CommandArgument='2, -1' />
                        <span class="dislike" id="dislikecountspan" runat="server"></span>
                    </div>

                    <div>

                        <div style="padding-left: 20px; padding-right: 20px; width: 100%;">
                            <div class="form-group">
                                <asp:Image ID="Image1" runat="server"
                                    ImageUrl="https://myspace.com/common/images/user.png"
                                    Style="width: 30px; height: 30px; border-radius: 50%; display: inline-block; vertical-align: middle;" /> 
                                <asp:TextBox ID="txtComment" runat="server" TextMode="MultiLine" Rows="2" CssClass="form-control"
                                    Style="display: inline-block; border-radius: 5px; vertical-align: middle; max-width: 74%;"></asp:TextBox>

                                <asp:Button ID="btnComment" CssClass="contentButton" Text="<%$Resources:DisplayText,Comment %>" runat="server" OnCommand="btnComment_Click" CommandName="MyUpdate" CommandArgument='<%#Eval("ID") %>'
                                    Style="display: inline-block; background-color: #4a90ce; border: 1px solid #4a90ce; vertical-align: middle; padding: 7px 25px; border-radius: 5px; color: #fff;" />

                            </div>

                        </div>

                        <div class="row">
                            <asp:Repeater ID="ParentRepeater" runat="server" OnItemDataBound="ParentRepeater_ItemDataBound">
                                <ItemTemplate>
                                    <div class="col-md-11">
                                        <hr style="margin: 1em; border-top: 1px solid #dedada;" />
                                        <table style="margin: 3px 5px; width: 100%; font-size: 1.3rem; font-family: Roboto, Arial, sans-serif;">
                                            <tr>
                                                <td style="width: 35px; vertical-align: text-top;">
                                                    <asp:Image ID="ImageParent" runat="server" Style="width: 50px; height: 50px; border-radius: 50%; margin-top: 0.2em;" ImageUrl="https://storage.designcrowd.com/common/images/v3/no-profile-pic-tiny.png" />
                                                </td>
                                                <td style="padding: 0px 5px; text-align: left; vertical-align: top;">
                                                    <asp:Label ID="lblCommentID" runat="server" Visible="false" Text='<%#Eval("CommentID") %>'></asp:Label>
                                                    <strong>
                                                        <asp:Label ID="lblCommentMessage" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "UserTbl.FullName") %>'></asp:Label></strong><br />
                                                    <asp:Label ID="Label1" runat="server" Text='<% #Eval("CommentMessage") %>'></asp:Label><br />
                                                    <asp:Label ID="lbldatetime" runat="server" Text='<% #Eval("CommentDate") %>'> date</asp:Label><br />
                                                    <a class="link" id='lnkReplyParent<%# Eval("CommentID") %>' href="javascript:void(0)" onclick="showReply(<%# Eval("CommentID") %>); return false;"><%=Resources.DisplayText.Reply %></a>
                                                    <a class="link" id="lnkCancel" href="javascript:void(0)" onclick='closeReply(<%# Eval("CommentID") %>); return false;'><%=Resources.DisplayText.Cancel %></a>

                                                    <asp:LinkButton class="link " runat="server" ID='DlnkReplyParent' OnCommand="btnRemoveComment_Click" CommandArgument='<%#Eval("CommentID") %>'>  <%=Resources.DisplayText.Delete %>  </asp:LinkButton>

                                                    <div id='divReply<%# Eval("CommentID") %>' style="display: none; margin-top: 5px;">
                                                        <asp:TextBox ID="txtCommentReplyParent" runat="server" TextMode="MultiLine" Rows="1" Width="100%" Height="60px" Style="display: inline-block; border-radius: 5px; vertical-align: middle; max-width: 85%;"></asp:TextBox>
                                                        <asp:Button ID="btnReplyParent" runat="server" CssClass="btn btn-primary contentButton" Text="<%$Resources:DisplayText,Reply %>" Style="float: right; margin: 5px; vertical-align: central"
                                                            OnCommand="btnAddDetailComment_Click" CommandName="MyUpdate" CommandArgument='<%#Eval("CommentID") %>' />
                                                    </div>

                                                    <asp:Repeater ID="FirstChildRepeater" runat="server" OnItemDataBound="FirstChildRepeater_onItemDatabound">

                                                        <ItemTemplate>
                                                            <div class="row">
                                                                <hr style="margin: 1em;" />
                                                                <table style="margin: 3px 5px; width: 100%;">
                                                                    <tr>
                                                                        <td style="width: 55px; vertical-align: text-top;">
                                                                            <asp:Image ID="ImageParent" runat="server" Style="width: 50px; height: 50px; border-radius: 50%; margin-top: 0.2em;" ImageUrl="https://storage.designcrowd.com/common/images/v3/no-profile-pic-tiny.png" />
                                                                        </td>
                                                                        <td style="padding: 0px 5px; text-align: left; vertical-align: top;">
                                                                            <asp:Label ID="lblCommentID" runat="server" Visible="false" Text='<%#Eval("CommentID") %>'></asp:Label>
                                                                            <strong>
                                                                                <asp:Label ID="Label2" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "UserTbl.FullName") %>'></asp:Label></strong><br />
                                                                            <asp:Label ID="lblCommentMessage" runat="server" Text='<% #Eval("CommentMessage") %>'></asp:Label><br />
                                                                            <asp:Label ID="lbldatetime" runat="server" Text='<% #Eval("CommentDate") %>'> date</asp:Label><br />
                                                                            <a class="link" id='lnkReplyParent<%# Eval("CommentID") %>' href="javascript:void(0)" onclick="showReply(<%# Eval("CommentID") %>+'c'); return false;"><%=Resources.DisplayText.Reply %></a>
                                                                            <a class="link" id="lnkCancel" href="javascript:void(0)" onclick="closeReply(<%# Eval("CommentID") %>+'c'); return false;"><%=Resources.DisplayText.Cancel %></a>

                                                                            <asp:LinkButton class="link " runat="server" ID='DlnkReplyParent' OnCommand="btnRemoveComment_Click" CommandArgument='<%#Eval("CommentID") %>'>  <%=Resources.DisplayText.Delete %>  </asp:LinkButton>

                                                                            <asp:Repeater ID="SecondChildRepeater" runat="server" OnItemDataBound="SecondChildRepeater_onItemDatabound">

                                                                                <ItemTemplate>
                                                                                    <div class="row">
                                                                                        <hr style="margin: 1em;" />
                                                                                        <table style="margin: 3px 5px; width: 100%;">
                                                                                            <tr>
                                                                                                <td style="width: 55px; vertical-align: text-top;">
                                                                                                    <asp:Image ID="ImageParent3" runat="server" Style="width: 50px; height: 50px; border-radius: 50%; margin-top: 0.2em;" ImageUrl="https://storage.designcrowd.com/common/images/v3/no-profile-pic-tiny.png" />
                                                                                                </td>
                                                                                                <td style="padding: 0px 5px; text-align: left; vertical-align: top;">
                                                                                                    <asp:Label ID="lblCommentID" runat="server" Visible="false" Text='<%#Eval("CommentID") %>'></asp:Label>
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label3" runat="server" Text='<% #DataBinder.Eval(Container.DataItem, "UserTbl.FullName") %>'></asp:Label></strong><br />
                                                                                                    <asp:Label ID="lblCommentMessage" runat="server" Text='<% #Eval("CommentMessage") %>'></asp:Label><br />
                                                                                                    <asp:Label ID="lbldatetime" runat="server" Text='<% #Eval("CommentDate") %>'> date</asp:Label><br />

                                                                                                    <asp:LinkButton class="link " runat="server" ID='DlnkReplyParent' OnCommand="btnRemoveComment_Click" CommandArgument='<%#Eval("CommentID") %>'>  <%=Resources.DisplayText.Delete %>  </asp:LinkButton>
                                                                                                </td>
                                                                                            </tr>
                                                                                        </table>
                                                                                    </div>
                                                                                </ItemTemplate>
                                                                            </asp:Repeater>

                                                                            <div id='divReply<%# Eval("CommentID") %>c' style="display: none; margin-top: 5px;">
                                                                                <asp:TextBox ID="txtCommentReplyParent" runat="server" TextMode="MultiLine" Rows="1" Width="100%" Height="60px" Style="display: inline-block; border-radius: 5px; vertical-align: middle; max-width: 85%;"></asp:TextBox>
                                                                                <asp:Button ID="btnReplyParent" CssClass="btn btn-primary contentButton" runat="server" Text="<%$Resources:DisplayText,Reply %>" Style="float: right; margin: 5px;"
                                                                                    OnCommand="btnAddDetailComment_Click" CommandName="MyUpdate" CommandArgument='<%#Eval("CommentID") %>' />
                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </div>
                                                        </ItemTemplate>

                                                    </asp:Repeater>

                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>

                    </div>










                </div>

                <div class="col-md-4 col-xs-4" style="padding: 0;">



                    <div class="col-md-12 col-xs-12 userregisterinfo" style="padding: 0; border-bottom: solid 1px #d3d3d370; margin-bottom: 2px;">

                        <div class="col-xs-4 filedName" style="padding: 0;"></div>
                        <div class="col-md-6 col-xs-6 filedDisplay" style="padding: 0;">
                            <asp:Label runat="server" ID="lbl_video"></asp:Label>
                        </div>

                    </div>
                    <div class="col-md-12 col-xs-12 userregisterinfo" style="padding: 0; border-bottom: solid 1px #d3d3d370; margin-bottom: 2px;">

                        <div class="col-xs-4 filedName" style="padding: 0;"></div>
                        <div class="col-md-6 col-xs-6 filedDisplay" style="padding: 0;">
                        </div>

                    </div>
                    <hr />

                    <div class="col-md-12 col-xs-12 userregisterinfo" style="padding: 0;">
                        <br />
                        <div class=" col-xs-4 filedName" style="padding: 0;"></div>
                        <div class=" col-xs-12 filedDisplay" style="padding: 0; padding: 10px; background-color: #d3d3d35c; border-radius: 5px; margin-top: 8px; margin-bottom: 8px;">
                        </div>

                    </div>

                    <div class="col-md-12 col-xs-12 userregisterinfo" style="padding: 0;">
                        <br />
                        <div class="col-xs-4 filedName" style="padding: 0;"><%= Resources.DisplayText.Description %></div>
                        <div class="col-xs-12 filedDisplay" style="padding: 0; padding: 10px; background-color: #d3d3d35c; border-radius: 5px; margin-top: 8px; margin-bottom: 8px;">
                            <asp:Label runat="server" ID="lbl_description"></asp:Label>
                        </div>

                    </div>
                    <div class="row col-md-12 col-xs-12">
                        <hr />
                        <h5 style="color: #28878a; font-weight: 700;" class="contentHeader"><%= Resources.DisplayText.Instrument %></h5>
                        <table class="table table-striped">
                            <thead>
                                <tr class="contentHeader">
                                    <th scope="col" class="contentHeader"><%=Resources.DisplayText.Instrument %></th>
                                    <th scope="col" class="contentHeader"><%=Resources.DisplayText.Playedby %></th>
                                </tr>
                            </thead>
                            <tbody>

                                <asp:Repeater runat="server" ID="myPerformanceDetailArtistInstrumentlist">

                                    <ItemTemplate>
                                        <tr style="margin-bottom: 3px;" class="filedDisplay">

                                            <td>
                                                <asp:Label class="filedDisplay" runat="server" ID="Label2" Text='<%# Eval("InstrumentTbl.KoreanName") %>' />
                                            </td>

                                            <td>
                                                <asp:Label class="filedDisplay" runat="server" ID="Label1" Text='<%# Eval("MusicianTbl.Name") %>' />
                                            </td>

                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tbody>
                        </table>
                    </div>

                </div>

            </div>--%>
        </ContentTemplate>
    </asp:UpdatePanel>

    <script type="text/javascript">

        function deletebtnclicked(msg) {
            var txt;
            if (confirm(msg)) {
                txt = "You pressed OK!";

                $.ajax({
                    type: "POST",
                    url: "PerformanceDetail.aspx/DeletePerformance", //Pagename/Functionname
                    contentType: "application/json;charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ n: 1 }), //{ },//data
                    success: function (data) {

                        if (data.d) {

                            alert('Entry deleted!!!');
                            history.go(-1);
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

        function closeReply(n) {
            $("#divReply" + n).hide();
            return false;
        }

        function showReply(n) {
            console.log(n);
            $.support.cors = true;
            // check for user login
            $.ajax({
                type: "POST",
                url: "PerformanceDetail.aspx/checkLoginStatus", //Pagename/Functionname
                contentType: "application/json;charset=utf-8",
                dataType: "json",
                data: JSON.stringify({ n: 1 }), //{ },//data
                success: function (data) {
                    //alert('success')
                    //console.log(data);
                    //alert(data.d);

                    //if log in show the reply message 
                    if (data.d) {

                        $("#divReply" + n).show();
                        return false;
                        return false;
                    }

                    else {
                        alert('Please sign in to write comments!!!');
                    }

                },
                error: function (result) {
                    console.log(result)
                    //alert("error")

                }
            });



        }


        function DeleteComment(n) {
            $.support.cors = true;

            //check confirmation
            if (confirm("Are you sure you want to delete?")) {
                // check for user login

                $.ajax({
                    type: "POST",
                    url: "PerformanceDetail.aspx/DeleteCommentByID", //Pagename/Functionname
                    contentType: "application/json;charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ CommentID: n }), //{ },//data
                    success: function (data) {
                        //alert('success') 

                        //if log in show the reply message 
                        if (data.d) {

                            alert('Entry deleted!!!');
                            //location.reload();                            

                            window.location.href = "PerformanceDB.aspx";
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
        .shadowedPanel {
            border: 1px solid transparent;
            border-radius: 4px;
            border-color: #dddddd;
            /*padding: 1em;*/
            box-shadow: 2px 2px 2px 2px #f5f5f5;
        }

        .shadowedPanel2 {
            border: 1px solid transparent;
            border-radius: 4px;
            border-color: #dddddd;
            box-shadow: 2px 2px 2px 2px #d0d0d0;
        }

        .social-like,
        .social-dislike {
            margin-bottom: 0.21em;
            border: none;
            outline: none;
            font-size: 16px;
            width: 45%;
            /*background-color: #8dbd64;*/
            /*background-color: #e0e0e0;*/
            color: #fff;
            display: inline-table;
        }

        /*.social-like :hover,
        .social-dislike :hover {
            background-color: #8dbd64;
        }*/
        .social-like {
            border-top-left-radius: 5px;
            text-align: right;
        }

        .social-dislike {
            border-top-right-radius: 5px;
            text-align: left;
        }

        .count,
        .like,
        .dislike {
            /*padding: 10px;*/
        }

        .count,
        .dislike {
            /*background-color: #5da25e;*/
            /*border-radius: 40%;*/
            font-size: 14px;
            color: black;
        }
    </style>


</asp:Content>
