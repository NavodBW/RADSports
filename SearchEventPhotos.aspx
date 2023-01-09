<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SearchEventPhotos.aspx.cs" Inherits="RADSports.SearchEventPhotos" %>

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
    <form id="form1" runat="server">
        <asp:TextBox ID="TextBox1" Class="form-control mb-1 m-3 " placeholder="Search by Tags Eg:Cycling/Swimming" runat="server"></asp:TextBox>
        <asp:Button ID="Button1" Class="form-control btn btn-dark  mt-0 m-3"  runat="server" OnClick="Button1_Click" Text="Search" />
        <div>
        </div>
        <asp:DataList ID="d1" runat="server">
            <ItemTemplate>
            <table>
                <tr>
                    <td>
                        <img src="<%#Eval("Event_Photo") %>" height="100" width="100" />
                    </td>
                </tr>
                </table>
                </ItemTemplate>
        </asp:DataList>
    </form>
            <script src="Scripts/jquery-3.4.1.min.js"></script>
    <script src="Scripts/popper.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</body>
</html>
