<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="WebApplication1.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="register">
                <%--<img src="Images/gif2.gif"/>--%>
                <div class="side1">
                </div>
                <div class="side2">
                    <div><h2>&nbsp;</h2>
                        <h2>Registration Form</h2>
                        <br />
                    <div class="form-content">
                        <asp:TextBox ID="NameTextBox" runat="server" PlaceHolder="Enter Name" CssClass="inputbox"></asp:TextBox>
                        </div>
                        <div class="form-content">
                        <asp:TextBox ID="EmailTextBox" runat="server" PlaceHolder="Enter Email" CssClass="inputbox"></asp:TextBox>
                    </div>
                    <div class="form-content">
                        <asp:TextBox ID="PasswordTextBox" runat="server" TextMode="Password" PlaceHolder="Enter Password" CssClass="inputbox"></asp:TextBox>
                    </div>
                        <div class="form-content">
                        <asp:TextBox ID="MobileTextBox" runat="server" PlaceHolder="Enter Mobile" CssClass="inputbox"></asp:TextBox>
                    </div>
                    <div class="form-content">
                        <asp:DropDownList ID="GenderDropDownList" runat="server" ValidationGroup="Gender" CssClass="inputbox" >
                            <asp:ListItem>Select Gender</asp:ListItem>
                            <asp:ListItem>Female</asp:ListItem>
                            <asp:ListItem>Male</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="form-content">
                        <asp:RadioButtonList ID="UserTypeRadioButtonList" runat="server" RepeatDirection="Horizontal" CssClass="inputbox">
                          <asp:ListItem>Admin</asp:ListItem>
                            <asp:ListItem>User</asp:ListItem>
                        </asp:RadioButtonList>
                    </div>
                    <div class="form-content">
                        <asp:Button ID="SaveButton" runat="server"  Text="Save" OnClick="SaveButton_Click" CssClass="style"/>
                        <asp:Button ID="ReadButton" runat="server"  Text="Read" OnClick="ReadButton_Click" CssClass="style" CausesValidation="false"/>
                        <asp:Button ID="UpdateButton" runat="server"  Text="Update" OnClick="UpdateButton_Click" CssClass="style"/>
                        <asp:Button ID="DeleteButton" runat="server" Text="Delete" OnClick="DeleteButton_Click" CssClass="style" CausesValidation="false"/>
                        <asp:Button ID="ResetButton" runat="server" Text="Reset" OnClick="ResetButton_Click" CssClass="style" CausesValidation="false"/>
                    </div>
                    <div class="form-content">
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Login1.aspx">Login Here</asp:HyperLink>
                    </div>
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
