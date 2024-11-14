<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="WebApplication1.HomePage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="bootstrap/css/Home.css" rel="stylesheet" />
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>

    </head>
<body> 
    <section>
        <div class="overlay">
            <div class="wrapper">
                <div class="container">
                    <div class="home-section">
                        <div class="navbar">
                            <form class="home-form" runat="server" id="form1">
                                <div class="buttons" style="text-align:right">
                                    <asp:Button ID="LoginButton" runat="server" Text="Login" OnClick="LoginButton_Click" CssClass="btn btn-primary" />
                                    <asp:Button ID="Register" Text="Register" runat="server" OnClick="Register_Click" CssClass="btn btn-secondary" />
                                </div>
                            </form>
                        </div>
                        <div class="content">
                            <h1>Welcome to the Home Page</h1>
                            <p>Explore our website or log in to access exclusive features.</p>
                            <div class="home-icons">
                                <a href="#" class="icon-link">
                                    <i class="fas fa-info-circle"></i>
                                    <span>About Us</span>
                                </a>
                                <a href="#" class="icon-link">
                                    <i class="fas fa-envelope"></i>
                                    <span>Contact Us</span>
                                </a>
                                <a href="#" class="icon-link">
                                    <i class="fas fa-users"></i>
                                    <span>Our Team</span>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <div id="stars"></div>
        <div id="stars2"></div>
        <div id="stars3"></div>
</body>
</html>
