<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="RADSports.Reports" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
            <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="StyleSheet1.css" rel="stylesheet" />
</head>
<body>
 <div class="navbar navbar-dark bg-dark">
    <a class="navbar-brand" href="/ManagerSelection">Main Menu</a>
  <a  class="btn btn-danger ml-auto" role="button" href="./Logout">Logout</a>
  
</div>
    <form id="form1" class="align-items-center align-middle d-flex midpoint"  runat="server">
        <div class="align-middle center">
        <p>
            <asp:Button ID="Button1"   class="btn btn-dark btn-lg btn-block mb-1 mt-3"  runat="server" Text="Event information" OnClick="Button1_Click" />
        </p>
        <p>
            <asp:Button ID="Button2"   class="btn btn-dark btn-lg btn-block mb-1 mt-3"   runat="server" Text="Medal winning country list and world record winners" OnClick="Button2_Click" />
        </p>
        <p>
        <asp:Button ID="Button3"   class="btn btn-dark btn-lg btn-block mb-1 mt-3"   runat="server" Text="Search events photos" OnClick="Button3_Click" />
        </p>
        <p>
            <asp:Button ID="Button4"   class="btn btn-dark btn-lg btn-block mb-1 mt-3"  runat="server" Text="Search events information and export to Word" OnClick="Button4_Click" />
        </p>
        </div>
    </form>
        <script src="Scripts/jquery-3.4.1.min.js"></script>
    <script src="Scripts/popper.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</body>
</html>
