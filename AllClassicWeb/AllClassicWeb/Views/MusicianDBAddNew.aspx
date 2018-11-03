<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MusicianDBAddNew.aspx.cs" Inherits="AllClassicWeb.Views.MusicianDBAddNew" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h4 runat="server" id="headerlabelcontainer"><%= Resources.DisplayText.NewDataInputScreen %></h4>
    <hr style="margin-top: 0px;" />
    <div id="dataentryform" class="row">

        <asp:UpdatePanel runat="server">
            <ContentTemplate>

                <div class="row ">

                    <div class="col-md-4 col-xs-4 userregisterinfo">
                        <br />
                        <div class="col-md-4 col-xs-4"><%= Resources.DisplayText.FullName %>*</div>
                        <div class="col-md-8 col-xs-8">
                            <asp:TextBox ID="txt_name" runat="server" class="form-control"></asp:TextBox>
                            
                        </div>
                        <br />
                    </div>

                    <div class="col-md-4 col-xs-4 userregisterinfo">
                        <br />
                        <div class="col-md-4 col-xs-4"><%= Resources.DisplayText.Email %>*</div>
                        <div class="col-md-8 col-xs-8">
                            <asp:TextBox ID="txt_email" runat="server" class="form-control" TextMode="Email"></asp:TextBox>
                        </div>
                        <br />
                    </div>

                    <div class="col-md-4 col-xs-4 userregisterinfo">
                        <br />
                        <div class="col-md-4 col-xs-4"><%= Resources.DisplayText.MobileNo %></div>
                        <div class="col-md-8 col-xs-8">
                            <asp:TextBox ID="txt_mobilenumber" runat="server" class="form-control"></asp:TextBox>
                        </div>
                        <br />
                    </div>
                </div>

                <div class="row ">

                    <div class="col-md-4 col-xs-4 userregisterinfo">
                        <br />
                        <div class="col-md-4 col-xs-4"><%= Resources.DisplayText.Address %></div>
                        <div class="col-md-8 col-xs-8">
                            <asp:TextBox ID="txt_address" runat="server" class="form-control"></asp:TextBox>
                        </div>
                        <br />
                    </div>

                    <div class="col-md-4 col-xs-4 userregisterinfo">
                        <br />
                        <div class="col-md-4 col-xs-4"><%= Resources.DisplayText.ZipCode %></div>
                        <div class="col-md-8 col-xs-8">
                            <asp:TextBox ID="txt_zipcode" runat="server" class="form-control" MaxLength="6"></asp:TextBox>
                        </div>
                        <br />
                    </div>

                    <div class="col-md-4 col-xs-4 userregisterinfo">
                        <br />
                        <div class="col-md-4 col-xs-4"><%= Resources.DisplayText.FacebookURL %></div>
                        <div class="col-md-8 col-xs-8">
                            <asp:TextBox ID="txt_facebook" runat="server" class="form-control"></asp:TextBox>
                        </div>
                        <br />
                    </div>
                </div>

                <div class="row ">

                    <div class="col-md-4 col-xs-4 userregisterinfo">
                        <br />
                        <div class="col-md-4 col-xs-4"><%= Resources.DisplayText.TwitterURL %></div>
                        <div class="col-md-8 col-xs-8">
                            <asp:TextBox ID="txt_twitter" runat="server" class="form-control"></asp:TextBox>
                        </div>
                        <br />
                    </div>

                    <div class="col-md-4 col-xs-4 userregisterinfo">
                        <br />
                        <div class="col-md-4 col-xs-4"><%= Resources.DisplayText.YourAffilation %></div>
                        <div class="col-md-8 col-xs-8">
                            <asp:TextBox ID="txt_youraffiliation" runat="server" class="form-control"></asp:TextBox>
                        </div>
                        <br />
                    </div>

                    <div class="col-md-4 col-xs-4 userregisterinfo">
                        <br />
                        <div class="col-md-4 col-xs-4"><%= Resources.DisplayText.Major %></div>
                        <div class="col-md-8 col-xs-8">
                            <asp:DropDownList ID="DropDownList1_Major" runat="server" class="form-control" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="SubCode" DataValueField="LookUpID"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AllClassicDBConnectionString %>" SelectCommand="SELECT LookUpID, MainCode, SubCode 
FROM Main.LookUpTbl
where maincode='Instrument'
or maincode='Composer'
or maincode='Conductor'
"></asp:SqlDataSource>
                            <%--<asp:TextBox ID="txt_major" runat="server" class="form-control"></asp:TextBox>--%>
                        </div>
                        <br />
                    </div>
                </div>


            </ContentTemplate>

        </asp:UpdatePanel>

        <div class="row ">

            <div class="col-md-4 col-xs-4 userregisterinfo">
                <br />
                <div class="col-md-4 col-xs-4"><%= Resources.DisplayText.KakaoTalkID %></div>
                <div class="col-md-8 col-xs-8">
                    <asp:TextBox ID="txt_kakaoID" runat="server" class="form-control"></asp:TextBox>
                </div>
                <br />
            </div>

            <div class="col-md-4 col-xs-4 userregisterinfo">
                <br />
                <div class="col-md-4 col-xs-4"><%= Resources.DisplayText.Photo1 %>:</div>
                <div class="col-md-8 col-xs-8">
                    <asp:FileUpload ID="FileUpload_photo1" runat="server" Style="display: inline; display: inline; padding-left: 0; padding-right: 0; border: none; box-shadow: none;"
                        class="form-control" />
                </div>
                <br />
            </div>
            <div class="col-md-4 col-xs-4 userregisterinfo">
                <br />
                <div class="col-md-4 col-xs-4"><%= Resources.DisplayText.Photo2 %>:</div>
                <div class="col-md-8 col-xs-8">
                    <asp:FileUpload ID="FileUpload_photo2" runat="server" Style="display: inline; display: inline; padding-left: 0; padding-right: 0; border: none; box-shadow: none;"
                        class="form-control" />
                </div>
                <br />
            </div>

        </div>

        <asp:UpdatePanel runat="server">
            <ContentTemplate>

                <div class="row ">

                    <div class="col-md-6 col-xs-6 userregisterinfo">
                        <br />
                        <div class="col-md-12 col-xs-12 "><%= Resources.DisplayText.ProfilePage %></div>
                        <br />
                        <div class="col-md-12 col-xs-12">
                            <asp:TextBox ID="txt_profilepage" runat="server" Style="max-width: 100%;" class="form-control" Rows="10" TextMode="MultiLine"></asp:TextBox>
                        </div>
                        <br />
                    </div>

                    <div class="col-md-6 col-xs-6 userregisterinfo">
                        <br />
                        <div class="col-md-12 col-xs-12"><%= Resources.DisplayText.Repertory %></div>
                        <br />
                        <div class="col-md-12 col-xs-12">
                            <asp:TextBox ID="txt_repertory" runat="server" Style="max-width: 100%;" class="form-control" Rows="10" TextMode="MultiLine"></asp:TextBox>
                        </div>
                        <br />
                    </div>

                </div>

                <div class="row">
                    <br />
                    <div>
                        <div class="col-md-6 col-xs-6">
                            <div class="col-md-2 col-xs-2">
                                <asp:Label runat="server"><strong><%= Resources.DisplayText.Endorser %></strong></asp:Label>
                            </div>

                            <div class="col-md-4 col-xs-4">
                                <button type="button" class="btn btn-success" data-toggle="modal" data-target="#endorserModalLong">
                                    <%= Resources.DisplayText.Add %>
                                </button>
                            </div>

                        </div>

                        <div class="row col-md-12 col-xs-12 pull-right">
                            <asp:Repeater runat="server" ID="myendorsmentlist">
                                <ItemTemplate>
                                    <tr style="margin-bottom: 5px;">
                                        <asp:Button runat="server" CssClass="btn btn-danger" AutoPostBack="True" Text="x" CommandArgument='<%# Container.ItemIndex  %>' OnCommand="btn_remove_endorser_tolist"></asp:Button>
                                        <td>
                                            <asp:Label runat="server" ID="Label1" Text='<%# Eval("EndorserName") %>' />
                                            - 
                                        </td>
                                        <td>
                                            <asp:Label runat="server" ID="Label2" Text='<%# Eval("EndorserEmail") %>' />
                                        </td>
                                    </tr>
                                    <br />
                                    <br />
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>


                    </div>

                    <!-- Modal -->
                    <div class="modal fade" id="endorserModalLong" tabindex="-1" role="dialog" aria-labelledby="endorserModalLongTitle" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="endorserModalLongTitle"><%= Resources.DisplayText.Endorser %></h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">

                                    <div class="form-group">
                                        <label for="exampleFormControlInput1"><%= Resources.DisplayText.EndorserName %></label>
                                        <asp:TextBox runat="server" type="text" class="form-control" ID="FormControlInput1_Name" placeholder="Name of the Endorser" />
                                    </div>

                                    <div class="form-group">
                                        <label for="exampleFormControlTextarea1"><%= Resources.DisplayText.EndorserEmailID %></label>
                                        <asp:TextBox runat="server" class="form-control" ID="FormControlTextarea1_email" TextMode="Email" placeholder="Email Address of the Endorser" />
                                    </div>

                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal"><%= Resources.DisplayText.Close %></button>
                                    <asp:Button runat="server" type="button" class="btn btn-primary" Text="<%$Resources:DisplayText,Save %>" ID="btnAddReview" OnClick="btnAddEndorser_Click" />
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

                <div class="row">

                    <div class="row col-md-12 col-xs-12">
                        <asp:Button Visible="true" ID="btn_artist_cancel" CssClass="btn btn-danger pull-right" runat="server" Text="Cancel" OnClick="btn_artistcancel_Click" Style="margin-right: 10px;" />
                        <asp:Button Visible="true" ID="btn_artist_save" CssClass="btn btn-warning pull-right" runat="server" Text="Update" OnClick="btn_artistsave_Click" Style="margin-right: 10px;" />
                        <asp:Button ID="btn_artist_add" CssClass="btn btn-primary pull-right" runat="server" Text="<%$Resources:DisplayText,Add %>" OnClick="btn_artistadd_Click" Style="margin-right: 10px;" />
                    </div>
                </div>
            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="btn_artist_add" />
                <%--<asp:PostBackTrigger ControlID="btnsaveimagechange" />--%>
                <%--<asp:PostBackTrigger ControlID="btn_artist_save" />--%>
            </Triggers>
        </asp:UpdatePanel>
    </div>

    <style>
        .userregisterinfo div {
            padding: 0px;
        }
    </style>
    <script>

        function closeModal() {
            $('#endorserModalLong').modal('hide');
            $('.modal-backdrop').remove();
            $('body').removeClass('modal-open');

            //alert('test');
        }
    </script>

</asp:Content>
