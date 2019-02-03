<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LookupMangePage.aspx.cs" Inherits="AllClassicWeb.Views.LookupMangePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

   <%-- <asp:UpdatePanel runat="server">
        <ContentTemplate> 
            
        </ContentTemplate>
    </asp:UpdatePanel>--%>

            <div >
                <br />
                <asp:TextBox runat="server" ID="searchvalueText" CssClass="form-control" style="display:inline-block;"></asp:TextBox>
                <button class="btn btn-success"  style="display:inline-block;">Search</button>
            </div>

                <br />
            <asp:ListView ID="ListView1"  runat="server" DataKeyNames="Id" DataSourceID="SqlDataSource1" InsertItemPosition="LastItem"  OnItemDeleted="ListView1_ItemDeleted"  OnItemInserted="ListView1_ItemInserted" OnItemUpdated="ListView1_ItemUpdated">
               
                <AlternatingItemTemplate>
                    <tr style="background-color: #FFF8DC;">
                        <td>
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Are you sure you want to delete?');" />
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                        </td>
                        <td>
                            <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                        </td>
                        <td>
                            <asp:Label ID="MainCodeLabel" runat="server" Text='<%# Eval("MainCode") %>' />
                        </td>
                        <td>
                            <asp:Label ID="SubCodeLabel" runat="server" Text='<%# Eval("SubCode") %>' />
                        </td>
                    </tr>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <tr style="background-color: #008A8C; color: black;">
                        <td>
                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" OnClientClick="return confirm('Are you sure you want to update?');" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                        </td>
                        <td>
                            <asp:Label ID="IdLabel1" runat="server" Text='<%# Eval("Id") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="MainCodeTextBox" runat="server" Text='<%# Bind("MainCode") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="SubCodeTextBox" runat="server" Text='<%# Bind("SubCode") %>' />
                        </td>
                    </tr>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <table runat="server" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px;">
                        <tr>
                            <td>No data was returned.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                        </td>
                        <td>&nbsp;</td>
                        <td>
                            <asp:TextBox ID="MainCodeTextBox" runat="server" Text='<%# Bind("MainCode") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="SubCodeTextBox" runat="server" Text='<%# Bind("SubCode") %>' />
                        </td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr style="background-color: #DCDCDC; color: #000000;">
                        <td>
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Are you sure you want to delete?');" />
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                        </td>
                        <td>
                            <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                        </td>
                        <td>
                            <asp:Label ID="MainCodeLabel" runat="server" Text='<%# Eval("MainCode") %>' />
                        </td>
                        <td>
                            <asp:Label ID="SubCodeLabel" runat="server" Text='<%# Eval("SubCode") %>' />
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px; font-family: Verdana, Arial, Helvetica, sans-serif;">
                                    <tr runat="server" style="background-color: #DCDCDC; color: #000000;">
                                        <th runat="server"></th>
                                        <th runat="server">Id</th>
                                        <th runat="server">MainCode</th>
                                        <th runat="server">SubCode</th>
                                    </tr>
                                    <tr id="itemPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style="text-align: center; background-color: #CCCCCC; font-family: Verdana, Arial, Helvetica, sans-serif; color: #000000;">
                                <asp:DataPager ID="DataPager1" runat="server">
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                        <asp:NumericPagerField />
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                    </Fields>
                                </asp:DataPager>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <tr style="background-color: #008A8C; font-weight: bold; color: #FFFFFF;">
                        <td>
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                        </td>
                        <td>
                            <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                        </td>
                        <td>
                            <asp:Label ID="MainCodeLabel" runat="server" Text='<%# Eval("MainCode") %>' />
                        </td>
                        <td>
                            <asp:Label ID="SubCodeLabel" runat="server" Text='<%# Eval("SubCode") %>' />
                        </td>
                    </tr>
                </SelectedItemTemplate>
                
            </asp:ListView>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AllClassicDBConnectionString %>" DeleteCommand="delete from Main.LookUpTbl where  LookUpID = @Id" InsertCommand="INSERT INTO Main.LookUpTbl(MainCode, SubCode, UpdateTimeStamp) 
VALUES (@MainCode, @SubCode, GETDATE())"
                SelectCommand="SELECT  LookUpID AS Id, MainCode, SubCode FROM Main.LookUpTbl
order by  UpdateTimeStamp desc"
                UpdateCommand="update  Main.LookUpTbl
set 
MainCode= @MainCode,
SubCode=@SubCode
where  LookUpID = @Id
"
                FilterExpression="  maincode like '%{0}%' or  subcode like '%{0}%'" >
                <DeleteParameters>
                    <asp:Parameter Name="Id" />
                </DeleteParameters>
                <FilterParameters>
                    <asp:ControlParameter ControlID="searchvalueText" Name="newparameter" PropertyName="Text" />
                </FilterParameters>
                <InsertParameters>
                    <asp:Parameter Name="MainCode" />
                    <asp:Parameter Name="SubCode" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="MainCode" />
                    <asp:Parameter Name="SubCode" />
                    <asp:Parameter Name="Id" />
                </UpdateParameters>
            </asp:SqlDataSource>

</asp:Content>
