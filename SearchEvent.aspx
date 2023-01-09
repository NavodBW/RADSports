<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SearchEvent.aspx.cs" Inherits="RADSports.SearchEvent" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
            <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="StyleSheet1.css" rel="stylesheet" />
</head>
<body>
 <div class="navbar navbar-dark bg-dark mb-3">
    <a class="navbar-brand" href="/ManagerSelection">Main Menu</a>
    <a  class="btn btn-danger ml-auto" role="button" href="./Logout">Logout</a>
    </div>
    <form id="form1" runat="server">
        <asp:TextBox ID="TextBox1" Class="form-group form-control" placeholder="Enter the event id" runat="server"></asp:TextBox>
        <div>
        </div>
        <asp:Button ID="Button1" Class="form-control btn btn-dark mb-3" runat="server" OnClick="Button1_Click" Text="Search" />
        <asp:GridView ID="GridView1" class="CompetitorEdit table table-hover table-dark" runat="server">
        </asp:GridView>
        <asp:Button ID="Button2" Class="form-control btn btn-dark mt-3 mb-3" runat="server" Text="Export to Word" OnClick="Button2_Click" />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ></asp:SqlDataSource>
    </form>
            <script src="Scripts/jquery-3.4.1.min.js"></script>
    <script src="Scripts/popper.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</body>
</html>
