<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminSelection.aspx.cs" Inherits="RADSports.AdminSelection" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="StyleSheet1.css" rel="stylesheet" />


    
</head>


<body>
    <div class="navbar">
  <a  class="btn btn-danger ml-auto" role="button" href="./Logout">Logout</a>
  
</div>

    <form id="form1" class="align-items-center align-middle d-flex midpoint" runat="server">
        <div class="align-middle center">
            
            <asp:Button ID="Button1" class="btn btn-dark btn-lg btn-block mb-1 mt-3" runat="server" OnClick="Button1_Click" Text="Games Management"   />

        
        <p>
        <asp:Button ID="Button2" Class="btn btn-dark btn-lg btn-block" runat="server" OnClick="Button2_Click" Text="Competitors Management" />
        </p>
        </div>
    </form>
    <script src="Scripts/jquery-3.4.1.min.js"></script>
    <script src="Scripts/popper.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>

</body>
</html>
