<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PerformanceDetail.aspx.cs" Inherits="AllClassicWeb.Views.PerformanceDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <div class="row">
        <h2 runat="server" id="performanceTitle" style="margin-top: 0px; padding-top: 0px;"></h2>
    </div>

    <div class="row" id="forAudience" runat="server">
        <h3 id="txt_maintitle" runat="server"></h3>
        <div class="col-md-8 col-xs-8">

            <asp:Image CssClass="shadowedPanel" Style="width: 100%;" runat="server" ID="performancePosterImage" />

            <%--<br />
                    <br />

                    <div class="social-like testhover" style="margin-left: 1.2em; margin-right: 0.5em;" runat="server">

                        <asp:ImageButton Visible="false" ImageUrl="~/Document/l-c.png" Width="20px" runat="server" ID="likebuttonliked" Text="Like"
                            OnCommand="LikeClicked" CommandName="MyUpdate" CommandArgument=' 2 , 1 ' />

                        <asp:ImageButton Visible='true' ImageUrl="~/Document/l.png" Width="20px" runat="server" ID="likebutton" Text="Like"
                            OnCommand="LikeClicked" CommandName="MyUpdate" CommandArgument='2 , 1 ' />
                        <span class="count" id="likecountspan" runat="server"></span>
                    </div>


                    <div class="social-dislike testhover ">

                        <asp:ImageButton Visible='false' ImageUrl="~/Document/dl-c.png" Width="20px" runat="server" ID="dislikebuttondisliked" Text="DisLike"
                            OnCommand="LikeClicked" CommandName="MyUpdate" CommandArgument='2, -1' />

                        <asp:ImageButton Visible='true' ImageUrl="~/Document/dl.png" Width="20px" runat="server" ID="dislikebutton" Text="DisLike"
                            OnCommand="LikeClicked" CommandName="MyUpdate" CommandArgument='2, -1' />
                        <span class="dislike" id="dislikecountspan" runat="server"></span>
                    </div>--%>

            <%--                    <div>

                        <div style="padding-left: 20px; padding-right: 20px; width: 100%;">
                            <div>
                                <asp:Image ID="Image1" runat="server"
                                    ImageUrl="https://myspace.com/common/images/user.png"
                                    Style="width: 30px; height: 30px; border-radius: 50%; margin-top: 0.2em; display: inline-block;" />
                                <asp:TextBox ID="txtComment" runat="server" TextMode="MultiLine"
                                    Width="79%" Style="display: inline-block; border-radius: 5px; margin-bottom: 0.5em;" CssClass="form-control"></asp:TextBox>

                                <asp:Button ID="btnComment" Text="Comment" runat="server" OnCommand="btnComment_Click" CommandName="MyUpdate" CommandArgument='<%#Eval("ID") %>'
                                    Style="display: inline-block; background-color: #4a90ce; border: 1px solid #4a90ce; padding: 7px 25px; border-radius: 5px; color: #fff; float: right; margin-top: 1.1em; margin-bottom: 0.2em;" />

                            </div>

                        </div>

                        <div class="row">
                            <asp:Repeater ID="Repeater2" runat="server" OnItemDataBound="Repeater2_ItemDataBound">
                                <ItemTemplate>
                                    <div class="col-md-11">
                                        <hr style="margin: 1em; border-top: 1px solid #dedada;" />
                                        <table style="margin: 3px 5px; width: 100%; font-size: 1.3rem; font-family: Roboto, Arial, sans-serif;">
                                            <tr>
                                                <td style="width: 35px; vertical-align: text-top;">
                                                    <asp:Image ID="ImageParent" runat="server" Style="width: 50px; height: 50px; border-radius: 50%; margin-top: 0.2em;" ImageUrl="https://storage.designcrowd.com/common/images/v3/no-profile-pic-tiny.png" />
                                                </td>
                                                <td style="padding: 0px 5px; text-align: left; vertical-align: top;">
                                                    <asp:Label ID="lblCommentID" runat="server" Visible="false" Text='<%#Eval("ID") %>'></asp:Label>
                                                    <strong>
                                                        <asp:Label ID="lblCommentMessage" runat="server" Text='<% #Eval("Username") %>'></asp:Label></strong><br />
                                                    <asp:Label ID="Label1" runat="server" Text='<% #Eval("CommentMessage") %>'></asp:Label><br />
                                                    <asp:Label ID="lbldatetime" runat="server" Text='<% #Eval("CommentDate") %>'> date</asp:Label><br />
                                                    <a class="link" id='lnkReplyParent<%# Eval("ID") %>' href="javascript:void(0)" onclick="showReply(<%# Eval("ID") %>); return false;">Reply</a>
                                                    <a class="link" id="lnkCancel" href="javascript:void(0)" onclick='closeReply(<%# Eval("ID") %>); return false;'>Cancel</a>

                                                    <div id='divReply<%# Eval("ID") %>' style="display: none; margin-top: 5px;">
                                                        <asp:TextBox ID="txtCommentReplyParent" runat="server" TextMode="MultiLine" Width="100%" Height="60px"></asp:TextBox>
                                                        <asp:Button ID="btnReplyParent" runat="server" Text="Reply" Style="float: right; margin: 5px;"
                                                            OnCommand="btnAddDetailComment_Click" CommandName="MyUpdate" CommandArgument='<%#Eval("ID") %>' />
                                                    </div>

                                                    <asp:Repeater ID="detailRepeater" runat="server" OnItemDataBound="detailrepeater_onItemDatabound">

                                                        <ItemTemplate>
                                                            <div class="row">
                                                                <hr style="margin: 1em;" />
                                                                <table style="margin: 3px 5px; width: 100%;">
                                                                    <tr>
                                                                        <td style="width: 55px; vertical-align: text-top;">
                                                                            <asp:Image ID="ImageParent" runat="server" Style="width: 50px; height: 50px; border-radius: 50%; margin-top: 0.2em;" ImageUrl="https://storage.designcrowd.com/common/images/v3/no-profile-pic-tiny.png" />
                                                                        </td>
                                                                        <td style="padding: 0px 5px; text-align: left; vertical-align: top;">
                                                                            <asp:Label ID="lblCommentID" runat="server" Visible="false" Text='<%#Eval("ID") %>'></asp:Label>
                                                                            <strong>
                                                                                <asp:Label ID="Label2" runat="server" Text='<% #Eval("Username") %>'></asp:Label></strong><br />
                                                                            <asp:Label ID="lblCommentMessage" runat="server" Text='<% #Eval("CommentMessage") %>'></asp:Label><br />
                                                                            <asp:Label ID="lbldatetime" runat="server" Text='<% #Eval("CommentDate") %>'> date</asp:Label><br />
                                                                            <a class="link" id='lnkReplyParent<%# Eval("ID") %>' href="javascript:void(0)" onclick='showReply(<%# Eval("ID") %>+'c'); return false;'>Reply</a>
                                                                            <a class="link" id="lnkCancel" href="javascript:void(0)" onclick='closeReply(<%# Eval("ID") %>+'c'); return false;'>Cancel</a>
                                                                            
                                                                            <asp:Repeater ID="detailRepeater3" runat="server">

                                                                                <ItemTemplate>
                                                                                    <div class="row">
                                                                                        <hr style="margin: 1em;" />
                                                                                        <table style="margin: 3px 5px; width: 100%;">
                                                                                            <tr>
                                                                                                <td style="width: 55px; vertical-align: text-top;">
                                                                                                    <asp:Image ID="ImageParent3" runat="server" Style="width: 50px; height: 50px; border-radius: 50%; margin-top: 0.2em;" ImageUrl="https://storage.designcrowd.com/common/images/v3/no-profile-pic-tiny.png" />
                                                                                                </td>
                                                                                                <td style="padding: 0px 5px; text-align: left; vertical-align: top;">
                                                                                                    <asp:Label ID="lblCommentID" runat="server" Visible="false" Text='<%#Eval("ID") %>'></asp:Label>
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label3" runat="server" Text='<% #Eval("Username") %>'></asp:Label></strong><br />
                                                                                                    <asp:Label ID="lblCommentMessage" runat="server" Text='<% #Eval("CommentMessage") %>'></asp:Label><br />
                                                                                                    <asp:Label ID="lbldatetime" runat="server" Text='<% #Eval("CommentDate") %>'> date</asp:Label><br />
                                                                                                    
                                                                                                </td>
                                                                                            </tr>
                                                                                        </table>
                                                                                    </div>
                                                                                </ItemTemplate>
                                                                            </asp:Repeater>

                                                                            <div id='divReply<%# Eval("ID") %>c' style="display: none; margin-top: 5px;">
                                                                                <asp:TextBox ID="txtCommentReplyParent" runat="server" TextMode="MultiLine" Width="100%" Height="60px"></asp:TextBox>
                                                                                <asp:Button ID="btnReplyParent" runat="server" Text="Reply" Style="float: right; margin: 5px;"
                                                                                    OnCommand="btnAddDetailComment_Click" CommandName="MyUpdate" CommandArgument='<%#Eval("ID") %>' />
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
            --%>
        </div>

        <div class="col-md-4 col-xs-4">
            <h4 id="txt_subtitle" runat="server"></h4>

            <div class="col-md-12 col-xs-12 userregisterinfo">

                <div class="col-md-6 col-xs-6"><%= Resources.DisplayText.PerformanceGroup %></div>
                <div class="col-md-6 col-xs-6">
                    <asp:Label Font-Bold="true" runat="server" ID="lbl_pg"></asp:Label>
                </div>

            </div>

            <div class="col-md-12 col-xs-12 userregisterinfo">

                <div class="col-md-6 col-xs-6"><%= Resources.DisplayText.PerformanceType %></div>
                <div class="col-md-6 col-xs-6">
                    <asp:Label Font-Bold="true" runat="server" ID="lbl_pt"></asp:Label>
                </div>

            </div>

            <div class="col-md-12 col-xs-12 userregisterinfo">

                <div class="col-md-6 col-xs-6"><%= Resources.DisplayText.Conductor %></div>
                <div class="col-md-6 col-xs-6">
                    <asp:Label Font-Bold="true" runat="server" ID="lbl_conductor"></asp:Label>
                </div>

            </div>

            <div class="col-md-12 col-xs-12 userregisterinfo">

                <div class="col-md-6 col-xs-6"><%= Resources.DisplayText.MainTitleComposer %></div>
                <div class="col-md-6 col-xs-6">
                    <asp:Label Font-Bold="true" runat="server" ID="lbl_maintitlecomposer"></asp:Label>
                </div>

            </div>

            <div class="col-md-12 col-xs-12 userregisterinfo">

                <div class="col-md-6 col-xs-6"><%= Resources.DisplayText.MainInstrument %></div>
                <div class="col-md-6 col-xs-6">
                    <asp:Label Font-Bold="true" runat="server" ID="lbl_maininstrument"></asp:Label>
                </div>

            </div>

            <div class="col-md-12 col-xs-12 userregisterinfo">

                <div class="col-md-6 col-xs-6"><%= Resources.DisplayText.Organizer %></div>
                <div class="col-md-6 col-xs-6">
                    <asp:Label Font-Bold="true" runat="server" ID="lbl_organizer"></asp:Label>
                </div>

            </div>

            <div class="col-md-12 col-xs-12 userregisterinfo">

                <div class="col-md-6 col-xs-6"><%= Resources.DisplayText.Sponser %></div>
                <div class="col-md-6 col-xs-6">
                    <asp:Label Font-Bold="true" runat="server" ID="lbl_sponser"></asp:Label>
                </div>

            </div>

            <div class="col-md-12 col-xs-12 userregisterinfo">

                <div class="col-md-6 col-xs-6"><%= Resources.DisplayText.Language %></div>
                <div class="col-md-6 col-xs-6">
                    <asp:Label Font-Bold="true" runat="server" ID="lbl_language"></asp:Label>
                </div>

            </div>

            <div class="col-md-12 col-xs-12 userregisterinfo">

                <div class="col-md-6 col-xs-6"><%= Resources.DisplayText.Start %></div>
                <div class="col-md-6 col-xs-6">
                    <asp:Label Font-Bold="true" runat="server" ID="lbl_start"></asp:Label>
                </div>

            </div>

            <div class="col-md-12 col-xs-12 userregisterinfo">

                <div class="col-md-6 col-xs-6"><%= Resources.DisplayText.End %></div>
                <div class="col-md-6 col-xs-6">
                    <asp:Label Font-Bold="true" runat="server" ID="lbl_end"></asp:Label>
                </div>

            </div>

            <div class="col-md-12 col-xs-12 userregisterinfo">

                <div class="col-md-6 col-xs-6"><%= Resources.DisplayText.Time %></div>
                <div class="col-md-6 col-xs-6">
                    <asp:Label Font-Bold="true" runat="server" ID="lbl_time"></asp:Label>
                </div>

            </div>

            <div class="col-md-12 col-xs-12 userregisterinfo">

                <div class="col-md-6 col-xs-6"><%= Resources.DisplayText.Region %></div>
                <div class="col-md-6 col-xs-6">
                    <asp:Label Font-Bold="true" runat="server" ID="lbl_region"></asp:Label>
                </div>

            </div>

            <div class="col-md-12 col-xs-12 userregisterinfo">

                <div class="col-md-6 col-xs-6"><%= Resources.DisplayText.City %></div>
                <div class="col-md-6 col-xs-6">
                    <asp:Label Font-Bold="true" runat="server" ID="lbl_city"></asp:Label>
                </div>

            </div>

            <div class="col-md-12 col-xs-12 userregisterinfo">

                <div class="col-md-6 col-xs-6"><%= Resources.DisplayText.Venue %></div>
                <div class="col-md-6 col-xs-6">
                    <asp:Label Font-Bold="true" runat="server" ID="lbl_venu"></asp:Label>
                </div>

            </div>

            <div class="col-md-12 col-xs-12 userregisterinfo">

                <div class="col-md-6 col-xs-6"><%= Resources.DisplayText.Poster %></div>
                <div class="col-md-6 col-xs-6">
                    <asp:Label Font-Bold="true" runat="server" ID="lbl_poster"></asp:Label>
                </div>

            </div>

            <div class="col-md-12 col-xs-12 userregisterinfo">

                <div class="col-md-6 col-xs-6"><%= Resources.DisplayText.Video %></div>
                <div class="col-md-6 col-xs-6">
                    <asp:Label Font-Bold="true" runat="server" ID="lbl_video"></asp:Label>
                </div>

            </div>
            <div class="col-md-12 col-xs-12 userregisterinfo">

                <div class="col-md-6 col-xs-6"><%= Resources.DisplayText.TicketBox %></div>
                <div class="col-md-6 col-xs-6">
                    <asp:Label Font-Bold="true" runat="server" ID="lbl_ticketbox"></asp:Label>
                </div>

            </div>
            <hr />

            <div class="col-md-12 col-xs-12 userregisterinfo">

                <div class="col-md-6 col-xs-6"><%= Resources.DisplayText.Program %></div>
                <div class="col-md-6 col-xs-6">
                    <asp:Label Font-Bold="true" runat="server" ID="lbl_program"></asp:Label>
                </div>

            </div>

            <div class="col-md-12 col-xs-12 userregisterinfo">

                <div class="col-md-6 col-xs-6"><%= Resources.DisplayText.Description %></div>
                <div class="col-md-6 col-xs-6">
                    <asp:Label Font-Bold="true" runat="server" ID="lbl_description"></asp:Label>
                </div>

            </div>
            <div class="row col-md-12 col-xs-12">
                        <hr />
                        <asp:Repeater runat="server" ID="myPerformanceDetailArtistInstrumentlist">
                            <ItemTemplate>
                                <tr style="margin-bottom: 3px;">

                                    <td>
                                        <asp:Label runat="server" ID="Label1" Text='<%# Eval("MusicianTbl.Name") %>' />
                                        - 
                                    </td>
                                    <td>
                                        <asp:Label runat="server" ID="Label2" Text='<%# Eval("InstrumentTbl.KoreanName") %>' />
                                    </td>

                                </tr>
                                <br />
                                <br />
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
            <div class="col-xs-12">
                <br />
                <asp:Button CssClass="btn btn-primary" runat="server" ID="btn_editArtist" OnClick="onclick_btn_editPerformance" Text="<%$Resources:DisplayText,Edit %>" />
            </div>

        </div>

    </div>


</asp:Content>
