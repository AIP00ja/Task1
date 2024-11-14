<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangePassA.aspx.cs" Inherits="WebApplication1.Admin.ChangePassA" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title></title>
   <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../bootstrap/css/UserUpdate.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="fixed-header">
            <asp:Button ID="BackToPage" runat="server" Text="Back To Page" CssClass="btn btn-outline-primary" OnClick="BackToPage_Click1" />
           </div>
        <div class="container">
            <div class="register">
                <h2>Change Password</h2>
                <div class="form-content">
                    <div class="input-container">
                        <label>Name :</label>
                        <asp:Label ID="Label2" runat="server" Font-Bold="True"></asp:Label>
                    </div>
                    <div class="input-container">
                        <label>Current Password :</label>
                        <asp:TextBox ID="CurrentPass" runat="server" placeholder="Enter your current password" CssClass="form-control"></asp:TextBox>
                                     </div>

                    <div class="input-container">
                        <label>New Password :</label>
                        <asp:TextBox ID="NewPass" runat="server"  placeholder="Enter your new password" CssClass="form-control"></asp:TextBox>
                       </div>
                    <div class="input-container">
                        <label>Confirm Password :</label>
                        <asp:TextBox ID="ConPass" runat="server" placeholder="Enter your confirm password" CssClass="form-control"></asp:TextBox>
                        </div>
                    <div class="buttons-container">
                        <asp:Button ID="Save" runat="server" OnClick="Save_Click" Text="Save" CssClass="btn btn-outline-success" />
                     </div>
                    <asp:Label ID="Label1" runat="server"></asp:Label>
                </div>
            </div>
        </div>
    </form>
    <div id='stars'></div>
    <div id='stars2'></div>
    <div id='stars3'></div>
</body>
</html>
