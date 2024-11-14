<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProfileAdmin.aspx.cs" Inherits="WebApplication1.Admin.ProfileAdmin" %>

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
            <asp:Button ID="Back" runat="server" Text="Back to Page" OnClick="Back_Click" CssClass="btn btn-outline-info" />  
        </div>
        <div class="container">
            <div class="register">
                    <h2>Admin Profile</h2>
                    <div class="form-content">
                        <div class="input-container">
                            <label>Name :</label><asp:Label ID="Label1" runat="server"></asp:Label>
                        </div>
                       <div class="input-container">
                           <label>Email :</label><asp:Label ID="Label2" runat="server"></asp:Label>
                       </div>
                        <div class="input-container">
                             <label>Password :</label><asp:Label ID="Label3" runat="server"></asp:Label>
                        </div>
                       
                        <div class="input-container">
                            <label>Mobile :</label><asp:Label ID="Label4" runat="server"></asp:Label>
                        </div>
                        
                        <div class="input-container">
                            <label>Gender :</label><asp:Label ID="Label5" runat="server"></asp:Label>
                        </div>
                       
                        <div class="input-container">
                        <label> UserType :</label><asp:Label ID="Label6" runat="server"></asp:Label>
                        </div>
                         <div class="buttons-container">
                        <asp:Button ID="ProfileUpdate" runat="server" Text="Profile Update"  OnClick="ProfileUpdate_Click" CssClass="btn btn-outline-primary"/>
                        <asp:Button ID="ChangePassword" runat="server" Text="Change Password"  OnClick="ChangePassword_Click" CssClass="btn btn-outline-warning" />
                          </div></div>
            </div>
        </div>
    </form>
    <div id='stars'></div>
    <div id='stars2'></div>
    <div id='stars3'></div>
</body>
</html>
