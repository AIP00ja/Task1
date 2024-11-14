<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard1.aspx.cs" Inherits="WebApplication1.Admin.Dashboard1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../bootstrap/css/style.css" rel="stylesheet" />
 <style>
 .transparent-card {
    background-color: rgba(255, 255, 255, 0.1);
    border: none; 
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.5); 
    backdrop-filter: blur(10px); 
}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="#"><img src="../w3layout/Image/Hello.png" class="logo-img" alt="Logo" style="width:50px; height:auto;" /></a>
                <div class="fixed-header">
                <asp:Button ID="LogOut" runat="server" OnClick="LogOut_Click" Text="LogOut" CssClass="btn btn-outline-danger" />
                <asp:Button ID="Button1" runat="server" Height="38px" OnClick="Button1_Click" Text="Check Admin" CssClass="btn btn-outline-primary mr-5" />
            </div>
                 </div>
                </nav>
             <div class="container-fluid mt-1 pt-1">
                 <div class="card p-4 mt-5 transparent-card">
                <h3 class="text-center mb-4 text-white">Admin Dashboard</h3>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AllowPaging="true"
                    CssClass="table table-striped table-bordered table-hover"
                    ShowFooter="True"
                    OnPageIndexChanging="OnPageIndexChanging"
                    OnRowCommand="GridView1_RowCommand"
                    OnRowCancelingEdit="GridView1_RowCancelingEdit"
                    OnRowEditing="GridView1_RowEditing"
                    OnRowUpdating="GridView1_RowUpdating"
                    DataKeyNames="Id"
                    OnRowDeleting="GridView1_RowDeleting"> 
                    <Columns>
                        <asp:TemplateField HeaderText="Name">
                            <ItemTemplate>
                                <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Eval("Name") %>' CssClass="form-control transparent-input"></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="NameTextBox" runat="server" CssClass="form-control transparent-input"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Email">
                            <ItemTemplate>
                                <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Eval("Email") %>' CssClass="form-control transparent-input"></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="EmailTextBox" runat="server" CssClass="form-control transparent-input"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Password">
                            <ItemTemplate>
                                <asp:Label ID="PasswordLabel" runat="server" Text='<%# Eval("Password") %>' ></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="PasswordTextBox" runat="server" Text='<%# Eval("Password") %>' CssClass="form-control transparent-input" TextMode="Password"></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="PasswordTextBox" runat="server" CssClass="form-control transparent-input" TextMode="Password"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Mobile">
                            <ItemTemplate>
                                <asp:Label ID="MobileLabel" runat="server" Text='<%# Eval("Mobile") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="MobileTextBox" runat="server" Text='<%# Eval("Mobile") %>' CssClass="form-control transparent-input"></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="MobileTextBox" runat="server" CssClass="form-control transparent-input"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Gender">
                            <ItemTemplate>
                                <asp:Label ID="GenderLabel" runat="server" Text='<%# Eval("Gender") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="GenderDropDownList1" runat="server" CssClass="form-control transparent-input" Width="100px">
                                    <asp:ListItem>Select</asp:ListItem>
                                    <asp:ListItem>Male</asp:ListItem>
                                    <asp:ListItem>Female</asp:ListItem>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:DropDownList ID="GenderFooter" runat="server" CssClass="form-control transparent-input" Width="100px">
                                    <asp:ListItem>Select</asp:ListItem>
                                    <asp:ListItem>Male</asp:ListItem>
                                    <asp:ListItem>Female</asp:ListItem>
                                </asp:DropDownList>
                            </FooterTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="UserType">
                            <ItemTemplate>
                                <asp:Label ID="UserTypeLabel" runat="server" Text='<%# Eval("UserType") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:RadioButtonList ID="UserTypeRadioButtonList" runat="server" RepeatDirection="Horizontal">
                                    <asp:ListItem Text="Admin" Value="Admin"></asp:ListItem>
                                    <asp:ListItem Text="User" Value="User"></asp:ListItem>
                                </asp:RadioButtonList>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:RadioButtonList ID="FooterRadioButtonList" runat="server" RepeatDirection="Horizontal">
                                    <asp:ListItem Text="Admin" Value="Admin"></asp:ListItem>
                                    <asp:ListItem Text="User" Value="User"></asp:ListItem>
                                </asp:RadioButtonList>
                            </FooterTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="ProfileImage"> 
                            <ItemTemplate>
                                <asp:Image ID="Image1" Height="150" Width="150" ImageUrl='<%# Eval("ProfileImage")%>' runat="server"/>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:FileUpload ID="FileUpload1" runat="server" />
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:FileUpload ID="FileUpload2" runat="server" />
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Operation">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Edit" CssClass="btn btn-outline-dark" Width="90%">Edit</asp:LinkButton>
                                <asp:LinkButton ID="LinkButton2" runat="server" CommandName="Delete" CssClass="btn btn-outline-light" Width="90%">Delete</asp:LinkButton>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:LinkButton ID="LinkButton3" runat="server" CommandName="Update" CssClass="btn btn-outline-success" Width="90%">Update</asp:LinkButton>
                                <asp:LinkButton ID="LinkButton4" runat="server" CommandName="Cancel" CssClass="btn btn-outline-warning" Width="90%">Cancel</asp:LinkButton>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:LinkButton ID="LinkButton5" runat="server" CommandName="Insert" CssClass="btn btn-info" Width="100%">Insert</asp:LinkButton>
                            </FooterTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            <asp:Label ID="lblSuccessMessage" runat="server" Text="" ForeColor="Green" CssClass="mt-3"></asp:Label>
            <asp:Label ID="lblErrorMessage" runat="server" Text="" ForeColor="Red" CssClass="mt-3"></asp:Label>
                     <asp:LinkButton ID="btnExport" runat="server" Text="Export to Excel" OnClick="ExportToExcel"/>
                 </div>  
        </div> 
    </form>
    <footer>
        <p></p>
    </footer>
    <div id='stars'></div>
    <div id='stars2'></div>
    <div id='stars3'></div>
    
</body>
</html>
