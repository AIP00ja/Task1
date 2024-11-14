<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs" Inherits="WebApplication1.ResetPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Enter Email to reset your password</h2>
        <div>
         <asp:TextBox ID="NewTextBox" runat="server" placeholder="Enter Your New Password"></asp:TextBox>
        </div>
         <div>
         <asp:TextBox ID="ConfirmTextBox" runat="server" placeholder="Enter Your Confirm Password"></asp:TextBox>
        </div>
          <div>
            <asp:Button ID="ResetButton" runat="server" Text="Reset"/>
         </div>
    </form>
</body>
</html>
