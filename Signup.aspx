<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="WebApplication1.Signup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="bootstrap/css/Style1.css" rel="stylesheet" />
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
     <script type="text/javascript">
         function isNumberKey(evt) {
             var charCode = (evt.which) ? evt.which : evt.keyCode;
             if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                 return false;
             }
             return true;
         }
    </script>
</head>
<body>
    <div class="container form-container">
        <div class="register-form">
            <div class="text-center mb-1">
                    <a href="#"><img src="w3layout/Image/Hello.png" class="logo-img" alt="Logo" /></a>
                </div>
            <p class="text-center form-subtitle">Sign up to explore the site</p>
            <form id="form1" runat="server">
                <div class="form-group">
                    <asp:TextBox ID="NameTextBox" runat="server" PlaceHolder="Enter Name" CssClass="inputbox form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="NameTextBox" Display="Dynamic" ErrorMessage="Please Enter Name" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>

                <div class="form-group">
                    <asp:TextBox ID="EmailTextBox" runat="server" PlaceHolder="Enter Email" CssClass="inputbox form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="EmailTextBox" Display="Dynamic" ErrorMessage="Please Enter Email" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="EmailTextBox" Display="Dynamic" ErrorMessage="Email is invalid" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </div>

                <div class="form-group">
                    <asp:TextBox ID="PasswordTextBox" runat="server" TextMode="Password" PlaceHolder="Enter Password" CssClass="inputbox form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="PasswordTextBox" Display="Dynamic" ErrorMessage="Please Enter Password" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="PasswordTextBox" Display="Dynamic" ErrorMessage="Please Enter Strong Password" ForeColor="Red" ValidationExpression="(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$"></asp:RegularExpressionValidator>
                </div>

                <div class="form-group">
                    <asp:TextBox ID="MobileTextBox" runat="server" PlaceHolder="Enter Mobile" CssClass="inputbox form-control" MaxLength="10" TextMode="Phone" onkeypress="return isNumberKey(event);"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="MobileTextBox" Display="Dynamic" ErrorMessage="Please Enter Mobile No." ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Invalid mobile number. It should be 10 digits." ControlToValidate="MobileTextBox" Display="Dynamic" ForeColor="Red" SetFocusOnError="True"  ValidationExpression="^\d{10}$"></asp:RegularExpressionValidator>
                </div>

                <div class="form-group">
                    <asp:DropDownList ID="GenderDropDownList" runat="server" CssClass="inputbox form-control">
                        <asp:ListItem>Select Gender</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>
                        <asp:ListItem>Male</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="GenderDropDownList" InitialValue="Select Gender" Display="Dynamic" ErrorMessage="Please Select Gender" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>

                <div class="form-group">
                    <asp:RadioButtonList ID="UserTypeRadioButtonList" runat="server" RepeatDirection="Horizontal" CssClass="inputbox form-control">
                        <asp:ListItem>Admin</asp:ListItem>
                        <asp:ListItem>User</asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="UserTypeRadioButtonList" Display="Dynamic" ErrorMessage="Please Select UserType" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>

                <div class="form-group">
                    <asp:Button ID="Register" runat="server" Text="Register"  CssClass="btn btn-primary btn-block" OnClick="Register_Click" />
                </div>
                <div class="form-group text-center">
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Login1.aspx" CssClass="hyperlink">Already have an account? Login here</asp:HyperLink>
                    <br />
                    <p class="signup text-center mt-1 text-green">Back to Home Page 
                    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/HomePage.aspx" class="signuplink text-green">Click Here</asp:HyperLink>
                </p>
                </div>
            </form>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <div id='stars'></div>
	<div id='stars2'></div>
	<div id='stars3'></div>
</body>
</html>
