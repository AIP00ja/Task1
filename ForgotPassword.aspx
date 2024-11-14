<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="WebApplication1.ForgotPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form runat="server" id="form1">
        <h2>Reset Password</h2>
                    <div>
                        <asp:TextBox ID="EmailTextBox" runat="server" placeholder="Enter Your Email Id"></asp:TextBox>
                    </div>
                    <div>
                        <asp:Button ID="SendButton" runat="server" Text="Send" OnClick="SendButton_Click"/>
                    </div>
                </form>
    </body>
</html>
