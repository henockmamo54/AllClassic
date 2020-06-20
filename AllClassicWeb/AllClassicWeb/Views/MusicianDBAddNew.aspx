<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MusicianDBAddNew.aspx.cs" ValidateRequest="false" Inherits="AllClassicWeb.Views.MusicianDBAddNew" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="conbox">

        <h4 runat="server" id="headerlabelcontainer" class="contentHeader"><%= Resources.DisplayText.NewDataInputScreen %></h4>
        <hr style="margin-top: 0px;" />
        <div id="dataentryform" class="row">

            <asp:UpdatePanel runat="server">
                <ContentTemplate>

                    <div class="row ">

                        <br />

                        <div class="col-md-4 col-xs-4 userregisterinfo">
                            <br />
                            <div class="col-md-4 col-xs-4 filedName"><%= Resources.DisplayText.FullName %>*</div>
                            <div class="col-md-8 col-xs-8">
                                <asp:TextBox ID="txt_name" runat="server" class="form-control filedDisplay" MaxLength="40"></asp:TextBox>
                                <asp:RequiredFieldValidator Display="Dynamic" runat="server" ForeColor="IndianRed" ValidationGroup="a" Font-Bold="true" ID="RequiredFieldValidator1" ControlToValidate="txt_name" ErrorMessage="<%$Resources:DisplayText,PleaseenteryourFullName %>" />

                            </div>
                            <br />
                        </div>

                        <div class="col-md-4 col-xs-4 userregisterinfo">
                            <br />
                            <div class="col-md-4 col-xs-4 filedName"><%= Resources.DisplayText.Email %>*</div>
                            <div class="col-md-8 col-xs-8">
                                <asp:TextBox ID="txt_email" runat="server" class="form-control filedDisplay" TextMode="Email" MaxLength="30"></asp:TextBox>
                                <asp:RequiredFieldValidator Display="Dynamic" runat="server" ForeColor="IndianRed" ValidationGroup="a" Font-Bold="true" ID="RequiredFieldValidator2" ControlToValidate="txt_email" ErrorMessage="<%$Resources:DisplayText,PleasefillEmailfield %>" />

                            </div>
                            <br />
                        </div>

                        <div class="col-md-4 col-xs-4 userregisterinfo">
                            <br />
                            <div class="col-md-4 col-xs-4 filedName"><%= Resources.DisplayText.MobileNo %></div>
                            <div class="col-md-8 col-xs-8">
                                <asp:TextBox ID="txt_mobilenumber" runat="server" class="form-control filedDisplay" MaxLength="20"></asp:TextBox>
                            </div>
                            <br />
                        </div>
                    </div>

                    <div class="row ">

                        <div class="col-md-4 col-xs-4 userregisterinfo">
                            <br />
                            <div class="col-md-4 col-xs-4 filedName"><%= Resources.DisplayText.Address %></div>
                            <div class="col-md-8 col-xs-8">
                                <asp:TextBox ID="txt_address" runat="server" class="form-control filedDisplay" MaxLength="80"></asp:TextBox>
                            </div>
                            <br />
                        </div>

                        <div class="col-md-4 col-xs-4 userregisterinfo">
                            <br />
                            <div class="col-md-4 col-xs-4 filedName"><%= Resources.DisplayText.ZipCode %></div>
                            <div class="col-md-8 col-xs-8">
                                <asp:TextBox ID="txt_zipcode" runat="server" class="form-control filedDisplay" MaxLength="6"></asp:TextBox>
                            </div>
                            <br />
                        </div>

                        <div class="col-md-4 col-xs-4 userregisterinfo">
                            <br />
                            <div class="col-md-4 col-xs-4 filedName"><%= Resources.DisplayText.FacebookURL %></div>
                            <div class="col-md-8 col-xs-8">
                                <asp:TextBox ID="txt_facebook" runat="server" class="form-control filedDisplay" MaxLength="30"></asp:TextBox>
                            </div>
                            <br />
                        </div>
                    </div>

                    <div class="row ">

                        <div class="col-md-4 col-xs-4 userregisterinfo">
                            <br />
                            <div class="col-md-4 col-xs-4 filedName"><%= Resources.DisplayText.TwitterURL %></div>
                            <div class="col-md-8 col-xs-8">
                                <asp:TextBox ID="txt_twitter" runat="server" class="form-control filedDisplay" MaxLength="30"></asp:TextBox>
                            </div>
                            <br />
                        </div>

                        <div class="col-md-4 col-xs-4 userregisterinfo">
                            <br />
                            <div class="col-md-4 col-xs-4 filedName"><%= Resources.DisplayText.YourAffilation %></div>
                            <div class="col-md-8 col-xs-8">
                                <asp:TextBox ID="txt_youraffiliation" runat="server" class="form-control filedDisplay" MaxLength="40"></asp:TextBox>
                            </div>
                            <br />
                        </div>

                        <div class="col-md-4 col-xs-4 userregisterinfo">
                            <br />
                            <div class="col-md-4 col-xs-4 filedName"><%= Resources.DisplayText.Major %></div>
                            <div class="col-md-8 col-xs-8">
                                <asp:DropDownList ID="DropDownList1_Major" runat="server" class="form-control filedDisplay" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="SubCode" DataValueField="LookUpID" OnDataBound="DropDownList1_Major_DataBound"></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AllClassicDBConnectionString %>" SelectCommand="SELECT LookUpID, MainCode, SubCode 
FROM Main.LookUpTbl
where maincode='Instrument'
or maincode='Composer'
or maincode='Conductor'
"></asp:SqlDataSource>
                                <%--<asp:TextBox ID="txt_major" runat="server" class="form-control filedDisplay"></asp:TextBox>--%>
                            </div>
                            <br />
                        </div>
                    </div>


                </ContentTemplate>

            </asp:UpdatePanel>

            <div class="row ">

                <div class="col-md-4 col-xs-4 userregisterinfo">
                    <br />
                    <div class="col-md-4 col-xs-4 filedName"><%= Resources.DisplayText.KakaoTalkID %></div>
                    <div class="col-md-8 col-xs-8">
                        <asp:TextBox ID="txt_kakaoID" runat="server" class="form-control filedDisplay" MaxLength="30"></asp:TextBox>
                    </div>
                    <br />
                </div>

                <div class="col-md-4 col-xs-4 userregisterinfo">
                    <br />
                    <div class="col-md-4 col-xs-4 filedName"><%= Resources.DisplayText.Photo1 %>:</div>
                    <div class="col-md-8 col-xs-8">

                        <asp:FileUpload ID="FileUpload_photo1" runat="server" Style="display: inline; display: inline; padding-left: 0; padding-right: 0; border: none; box-shadow: none; visibility: visible;"
                            class="form-control filedDisplay" />

                        <asp:Label ID="FileUpload_photo1_label" runat="server" Style="visibility: hidden;">
                        </asp:Label>

                        <a id="FileUpload_photo1_Changelink" style="visibility: hidden;" onclick='$("#MainContent_FileUpload_photo1_label").hide(); $("#FileUpload_photo1_Changelink").hide();  $("#MainContent_FileUpload_photo1").show();  $("#MainContent_FileUpload_photo1").css("visibility", "visible");'><%=Resources.DisplayText.Edit %></a>


                    </div>
                    <br />
                </div>
                <div class="col-md-4 col-xs-4 userregisterinfo ">
                    <br />
                    <div class="col-md-4 col-xs-4 filedName"><%= Resources.DisplayText.Photo2 %>:</div>
                    <div class="col-md-8 col-xs-8">


                        <asp:FileUpload ID="FileUpload_photo2" runat="server" Style="display: inline; display: inline; padding-left: 0; padding-right: 0; border: none; box-shadow: none;"
                            class="form-control filedDisplay" />
                        <asp:Label ID="FileUpload_photo2_label" runat="server" Style="visibility: hidden;">  </asp:Label>
                        <a id="FileUpload_photo2_Changelink" style="visibility: hidden;"
                            onclick='$("#MainContent_FileUpload_photo2_label").hide(); $("#FileUpload_photo2_Changelink").hide();  
                        $("#MainContent_FileUpload_photo2").show();  $("#MainContent_FileUpload_photo2").css("visibility", "visible");'><%=Resources.DisplayText.Edit %></a>
                    </div>
                    <br />
                </div>

            </div>

            <asp:UpdatePanel runat="server">
                <ContentTemplate>

                    <div class="row ">

                        <div class="col-md-6 col-xs-6 userregisterinfo">
                            <br />
                            <div class="col-md-12 col-xs-12 filedName"><%= Resources.DisplayText.ProfilePage %> (Maximum 400 characters)</div>
                            <br />
                            <div class="col-md-12 col-xs-12">
                                <%--<asp:TextBox ID="txt_profilepage" runat="server" Style="max-width: 100%;" class="form-control filedDisplay" Rows="10" TextMode="MultiLine"></asp:TextBox>--%>

                                <textarea cols="80" id="txt_outline" validationgroup="a" runat="server" name="editor1" rows="10"> </textarea>
                                <asp:HiddenField ID="HiddenField2" runat="server" Value="" />

                            </div>
                            <br />
                        </div>

                        <div class="col-md-6 col-xs-6 userregisterinfo">
                            <br />
                            <div class="col-md-12 col-xs-12 filedName"><%= Resources.DisplayText.Repertory %> (Maximum 400 characters)</div>
                            <br />
                            <div class="col-md-12 col-xs-12">
                                <%--<asp:TextBox ID="txt_repertory" runat="server" Style="max-width: 100%;" class="form-control filedDisplay" Rows="10" TextMode="MultiLine"></asp:TextBox>--%>

                                <textarea cols="80" id="txt_outline_organizer" validationgroup="a" runat="server" name="editor1" rows="10"> </textarea>
                                <asp:HiddenField ID="HiddenField_organizer" runat="server" Value="" />

                            </div>
                            <br />
                        </div>

                    </div>

                    <div class="row" style="display:none;">
                        <br />
                        <div>
                            <div class="col-md-6 col-xs-6">
                                <div class="col-md-2 col-xs-2">
                                    <asp:Label runat="server" CssClass="filedName"><%= Resources.DisplayText.Endorser %></asp:Label>
                                </div>

                                <div class="col-md-4 col-xs-4">
                                    <button type="button" class="btn btn-success contentButton" data-toggle="modal" data-target="#endorserModalLong">
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
                                                <asp:Label runat="server" ID="Label1" CssClass="filedName" Text='<%# Eval("EndorserName") %>' />
                                                - 
                                            </td>
                                            <td>
                                                <asp:Label runat="server" ID="Label2" CssClass="filedName" Text='<%# Eval("EndorserEmail") %>' />
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
                                        <h5 class="modal-title contentHeader" id="endorserModalLongTitle"><%= Resources.DisplayText.Endorser %></h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">

                                        <div class="form-group">
                                            <label for="exampleFormControlInput1" class="filedName"><%= Resources.DisplayText.EndorserName %></label>
                                            <asp:TextBox runat="server" type="text" TextMode="SingleLine" class="form-control filedDisplay" MaxLength="40" ID="FormControlInput1_Name" placeholder="Name of the Endorser" />
                                        </div>

                                        <div class="form-group">
                                            <label for="exampleFormControlTextarea1" class="filedName"><%= Resources.DisplayText.EndorserEmailID %></label>
                                            <asp:TextBox runat="server" class="form-control filedDisplay" ID="FormControlTextarea1_email" MaxLength="30" placeholder="Email Address of the Endorser" />
                                        </div>

                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary contentButton" data-dismiss="modal"><%= Resources.DisplayText.Close %></button>
                                        <asp:Button runat="server" type="button" class="btn btn-primary contentButton" Text="<%$Resources:DisplayText,Save %>" ID="btnAddReview" OnClientClick="getValueFromHtmlEditor();" OnClick="btnAddEndorser_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>

                    <div class="row">

                        <div class="row col-md-12 col-xs-12">
                            <br />
                            <asp:Button Visible="true" ID="btn_artist_cancel" CssClass="btn btn-danger pull-right" runat="server" Text="<%$Resources:DisplayText,Cancel %>" OnClick="btn_artistcancel_Click" Style="margin-right: 10px;" />
                            <asp:Button Visible="true" ValidationGroup="a" ID="btn_artist_save" CssClass="btn btn-warning pull-right contentButton" OnClientClick="getValueFromHtmlEditor();" runat="server" Text="<%$Resources:DisplayText,Update %>" OnClick="btn_artistsave_Click" Style="margin-right: 10px;" />
                            <asp:Button ID="btn_artist_add" ValidationGroup="a" CssClass="btn btn-primary pull-right contentButton" runat="server" OnClientClick="getValueFromHtmlEditor();" Text="<%$Resources:DisplayText,Add %>" OnClick="btn_artistadd_Click" Style="margin-right: 10px;" />
                        </div>
                    </div>
                </ContentTemplate>
                <Triggers>
                    <asp:PostBackTrigger ControlID="btn_artist_add" />
                    <asp:PostBackTrigger ControlID="btn_artist_save" />
                    <%--<asp:PostBackTrigger ControlID="btn_artist_save" />--%>
                </Triggers>
            </asp:UpdatePanel>
        </div>

    </div>
    <style>
        .userregisterinfo div {
            padding: 0px;
        }
    </style>
    <script>


        function loadCkEditor() {

            //CKEDITOR.replace('MainContent_txt_auditionoutline');
            CKEDITOR.replace('MainContent_txt_outline', {
                // Define the toolbar groups as it is a more accessible solution.
                toolbarGroups: [
                    { name: 'document', groups: ['mode', 'document', 'doctools'] },
                    { name: 'clipboard', groups: ['clipboard', 'undo'] },
                    { name: 'editing', groups: ['find', 'selection', 'spellchecker', 'editing'] },
                    { name: 'forms', groups: ['forms'] },

                    { name: 'basicstyles', groups: ['basicstyles', 'cleanup'] },
                    { name: 'paragraph', groups: ['list', 'indent', 'blocks', 'align', 'bidi', 'paragraph'] },
                    { name: 'links', groups: ['links'] },
                    { name: 'insert', groups: ['insert'] },

                    { name: 'styles', groups: ['styles'] },
                    { name: 'colors', groups: ['colors'] },
                    { name: 'tools', groups: ['tools'] },
                    { name: 'others', groups: ['others'] },
                    { name: 'about', groups: ['about'] }
                ],
                // Remove the redundant buttons from toolbar groups defined above.
                removeButtons: 'Source,Print,NewPage,Preview,Templates,Replace,Blockquote,CreateDiv,Image,Flash,Smiley,PageBreak,ShowBlocks,About,Maximize'
            });

            //CKEDITOR.replace('MainContent_txt_auditionoutline');
            CKEDITOR.replace('MainContent_txt_outline_organizer', {
                // Define the toolbar groups as it is a more accessible solution.
                toolbarGroups: [
                    { name: 'document', groups: ['mode', 'document', 'doctools'] },
                    { name: 'clipboard', groups: ['clipboard', 'undo'] },
                    { name: 'editing', groups: ['find', 'selection', 'spellchecker', 'editing'] },
                    { name: 'forms', groups: ['forms'] },

                    { name: 'basicstyles', groups: ['basicstyles', 'cleanup'] },
                    { name: 'paragraph', groups: ['list', 'indent', 'blocks', 'align', 'bidi', 'paragraph'] },
                    { name: 'links', groups: ['links'] },
                    { name: 'insert', groups: ['insert'] },

                    { name: 'styles', groups: ['styles'] },
                    { name: 'colors', groups: ['colors'] },
                    { name: 'tools', groups: ['tools'] },
                    { name: 'others', groups: ['others'] },
                    { name: 'about', groups: ['about'] }
                ],
                // Remove the redundant buttons from toolbar groups defined above.
                removeButtons: 'Source,Print,NewPage,Preview,Templates,Replace,Blockquote,CreateDiv,Image,Flash,Smiley,PageBreak,ShowBlocks,About,Maximize'
            });


        }


        function getValueFromHtmlEditor() {
            var value = CKEDITOR.instances['MainContent_txt_outline'].getData();
            $('#MainContent_HiddenField2').val(value);

            var value = CKEDITOR.instances['MainContent_txt_outline_organizer'].getData();
            $('#MainContent_HiddenField_organizer').val(value);
        }

        function preparetheFileuploadForEdit(isOnEdit) {
            if (isOnEdit) {

                $("#MainContent_FileUpload_photo1").css("visibility", "hidden");
                $("#FileUpload_photo1_Changelink").show();
                $("#MainContent_FileUpload_photo1_label").show();
                $("#FileUpload_photo1_Changelink").css("visibility", "visible");
                $("#MainContent_FileUpload_photo1_label").css("visibility", "visible");



                $("#MainContent_FileUpload_photo2").css("visibility", "hidden");
                $("#FileUpload_photo2_Changelink").show();
                $("#MainContent_FileUpload_photo2_label").show();
                $("#FileUpload_photo2_Changelink").css("visibility", "visible");
                $("#MainContent_FileUpload_photo2_label").css("visibility", "visible");

            }
            else {

                $("#FileUpload_photo1_Changelink").hide();
                $("#MainContent_FileUpload_photo1_label").hide();
                $("#FileUpload_photo1_Changelink").css("visibility", "hidden");
                $("#MainContent_FileUpload_photo1_label").css("visibility", "hidden");
                $("#MainContent_FileUpload_photo1").css("visibility", "visible");


                $("#FileUpload_photo2_Changelink").hide();
                $("#MainContent_FileUpload_photo2_label").hide();
                $("#FileUpload_photo2_Changelink").css("visibility", "hidden");
                $("#MainContent_FileUpload_photo2_label").css("visibility", "hidden");
                $("#MainContent_FileUpload_photo2").css("visibility", "visible");

            }
        }

        document.getElementById("artisttab").style.backgroundColor = "white";
        document.getElementById("artisttab").style.borderBottom = "none";

        function closeModal() {
            $('#endorserModalLong').modal('hide');
            $('.modal-backdrop').remove();
            $('body').removeClass('modal-open');

            //alert('test');
        }
    </script>

    <script type="text/javascript">

        function ShowMessage() {
            alert('Data inserted succssfuly');
            window.location.href = 'MusicianDB.aspx';
        }

    </script>


</asp:Content>
