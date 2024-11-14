<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateAdminP.aspx.cs" Inherits="WebApplication1.Admin.UpdateAdminP" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../bootstrap/css/style.default.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="fixed-header">
            <asp:Button ID="BackPage" runat="server" Text="Back To Page" OnClick="BackPage_Click" CssClass="btn btn-outline-primary" />
        </div>
        <div class="container">
            <div class="register">
                <h2>Admin Profile Update</h2>
                <div class="form-content">
                   <div class="input-container">
                <label>Name :</label>
                  <asp:TextBox ID="Name" runat="server" class="form-control" ReadOnly="True"></asp:TextBox>
              </div>
              <div class="input-container">
               <label>Email :</label>
            <asp:TextBox ID="TextboxEmail" runat="server" class="form-control"></asp:TextBox>
               <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter your email" ControlToValidate="TextboxEmail" Display="Dynamic" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
              <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid Email Id" ControlToValidate="TextboxEmail" Display="Dynamic" ForeColor="Red" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                  </div>
                    <div class="input-container">
                        <label>Mobile :</label>
                        <asp:TextBox ID="TextboxMobile" runat="server" class="form-control" MaxLength="10"></asp:TextBox>
               <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter your mobile no." ControlToValidate="TextboxMobile" Display="Dynamic" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
              <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Invalid mobile number. It should be 10 digits." ControlToValidate="TextboxMobile" Display="Dynamic" ForeColor="Red" SetFocusOnError="True"  ValidationExpression="^\d{10}$"></asp:RegularExpressionValidator>
                   </div>
                    <div class="input-container">
                        <label>Gender :</label>
                        <asp:DropDownList ID="DropDownList1" runat="server" ValidationGroup="Gender" CssClass="form-control">
                            <asp:ListItem>Select Gender</asp:ListItem>
                            <asp:ListItem>Male</asp:ListItem>
                            <asp:ListItem>Female</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Select Gender" ControlToValidate="DropDownList1" Display="Dynamic" ForeColor="Red" InitialValue="Select Gender" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </div>
                    <div class="input-container">
                        <div class="form-check form-check-inline">
                            <label>UserType :</label>&nbsp;&nbsp;
                            <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem>Admin</asp:ListItem>
                                <asp:ListItem>User</asp:ListItem>
                            </asp:RadioButtonList>
                        </div>
                    </div>
                    <div class="buttons-container">
                        <asp:Button ID="Save" runat="server" OnClick="Save_Click" Text="Save" CssClass="btn btn-outline-success" />
                        <asp:Label ID="Label1" runat="server"></asp:Label>

                    </div>


                </div>
            </div>
        </div>
    </form>
    <div id='stars'></div>
    <div id='stars2'></div>
    <div id='stars3'></div>
</body>
</html>
