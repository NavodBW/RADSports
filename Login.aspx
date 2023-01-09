<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="RADSports.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
            <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="StyleSheet1.css" rel="stylesheet" />
</head>
<body class="text-center">


    <form id="form1" class="form-signin" runat="server">
        <h1 class="h3 mb-3 font-weight-normal">Please sign in</h1>
        <div>
            Email:
        <label for="Email" class="sr-only">Email address</label>
        <asp:TextBox ID="Email" class="form-control" placeholder="Email address" runat="server"></asp:TextBox>
        <br />
        Password:
        <label for="Password" class="sr-only">Password</label>
        <asp:TextBox ID="Password" class="form-control" placeholder="Password" required="" runat="server" TextMode="Password"></asp:TextBox>
        <br />
        <asp:Button ID="SignIn" runat="server" class="btn btn-lg btn-dark btn-block" Text="Login" OnClick="Login_Click"  />
        <br />
        </div>
    </form>
        <script src="Scripts/jquery-3.4.1.min.js"></script>
    <script src="Scripts/popper.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</body>
</html>
