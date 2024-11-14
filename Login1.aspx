<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login1.aspx.cs" Inherits="WebApplication1.Login1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
   <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <link href="w3layout/css/Login1.css" rel="stylesheet" />
</head>
	<script type="text/javascript">
    window.onload = function() {
        if (performance.navigation.type === performance.navigation.TYPE_BACK_FORWARD) {
            window.history.go(1);
        }
    };
</script>
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
                        <asp:TextBox ID="NameTextBox" runat="server" placeholder="Enter Username" class="form-control" required="" MaxLength="50"></asp:TextBox>
                    </div>
                    <div class="form-input mb-3">
                        <asp:TextBox ID="PasswordTextBox" runat="server" TextMode="Password" placeholder="Enter Password" class="form-control" required=""></asp:TextBox>
                        <div class="form-check pl-5">
                        <input type="checkbox" id="showPassword" class="form-check-input" onchange="this.form.PasswordTextBox.type = this.checked ? 'text' : 'password';" />Show Password
                    </div>
                    </div>
                    <div class="text-center">
                        <asp:Button ID="LoginButton" runat="server" Text="Login" class="btn btn-primary btn-block theme-button mt-3" OnClick="LoginButton_Click" />
                    </div>
                    <%--<div class="new-signup text-center mt-3">
                        <a href="#reload" class="signuplink text-white">Forgot username or password?</a>
                    </div>--%>
                </form>
                <p class="signup text-center mt-1 text-green">Don’t have an account yet? 
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Signup.aspx" class="signuplink text-green">Sign Up</asp:HyperLink>
                </p>
                <p class="signup text-center mt-1 text-green">
                 <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/HomePage.aspx" class="signuplink text-green">Back to Home</asp:HyperLink>   
                </p>
            </div>
        </div>
        <div id='stars'></div>
        <div id='stars2'></div>
        <div id='stars3'></div>
    </section>
</body>
</html>
