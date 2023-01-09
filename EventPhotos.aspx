<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EventPhotos.aspx.cs" Inherits="RADSports.EventPhotos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
    </style>
                <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="StyleSheet1.css" rel="stylesheet" />
</head>
<body>
    <div class="navbar navbar-dark bg-dark mb-3">
    <a class="navbar-brand" href="/ManagerSelection">Main Menu</a>
    <a  class="btn btn-danger ml-auto" role="button" href="./Logout">Logout</a>

  
    </div>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1 table">
                <tr>
                    <td>Photo ID</td>
                    <td>
                        <asp:TextBox ID="TextBox1" class="form-control"  runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Event Photo</td>
                    <td>
                        <asp:TextBox ID="TextBox2" placeholder="photo name and extension. eg:photo.jpg" class="form-control"   runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Event Photo Tags</td>
                    <td>
                        <asp:TextBox ID="TextBox3" class="form-control"   runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Event ID</td>
                    <td>
                        <asp:TextBox ID="TextBox4" class="form-control"   runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <asp:Button ID="Button1" class="form-control btn btn-dark"   runat="server" Text="Submit" OnClick="Button1_Click" />
                    </td>
                   
                  
                </tr>
            </table>
              <td>
                        <asp:Button ID="Button2" class="form-control btn btn-dark"   runat="server" Text="Search Event Photos" OnClick="Button2_Click" />
                    </td>
        </div>
    </form>
     <script src="Scripts/jquery-3.4.1.min.js"></script>
    <script src="Scripts/popper.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</body>
</html>
