<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="WebApplication1.WebForm2" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <!-- Bootstrap and FontAwesome -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet" />
   
</head>
<body>
   <section class="w3l-login">
    <div class="container form-section d-flex justify-content-center align-items-center vh-100">
        <div class="card p-5 shadow-lg">
            <div class="text-center mb-1">
                <a href="#"><img src="w3layout/Image/Hello.png" class="logo-img" alt="Logo" /></a>
            </div>
            <h6 class="text-center mb-4 text-white">To continue with Us</h6>
            <form class="signin-form" runat="server" id="form1">
                <div class="form-input mb-3">
                    <asp:TextBox ID="NameTextBox" runat="server" placeholder="Enter Username" class="form-control" required=""></asp:TextBox>
                </div>
                <div class="form-input mb-3">
                    <asp:TextBox ID="PasswordTextBox" runat="server" TextMode="Password" placeholder="Enter Password" class="form-control" required=""></asp:TextBox>
                    <div class="form-check">
                        <input type="checkbox" id="showPassword" class="form-check-input" onchange="this.form.PasswordTextBox.type = this.checked ? 'text' : 'password';" />Show Password
                        
                    </div>
                </div>
                <div class="text-center">
                    <asp:Button ID="LoginButton" runat="server" Text="Login" class="btn btn-primary btn-block theme-button mt-4" />
                </div>
                <div class="new-signup text-center mt-3">
                    <a href="#reload" class="signuplink text-white">Forgot username or password?</a>
                </div>
            </form>
            <p class="signup text-center mt-1 text-green">Don’t have an account yet? 
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Signup.aspx" class="signuplink text-green">Sign Up</asp:HyperLink>
            </p>
        </div>
    </div>
    <div id='stars'></div>
    <div id='stars2'></div>
    <div id='stars3'></div>
</section>
</body>
</html>


