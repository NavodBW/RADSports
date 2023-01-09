<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Events.aspx.cs" Inherits="RADSports.Events" %>

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
<div class="navbar navbar-dark bg-dark">
  <a class="navbar-brand" href="/ManagerSelection">Main Menu</a>
  <a  class="btn btn-danger ml-auto" role="button" href="./Logout">Logout</a>

  
</div>
    <form id="form1" class="" runat="server">
        <table class="auto-style1 table">
            <tr>
                <td>Event_ID</td>
                <td>
                    <asp:TextBox ID="TextBox1" placeholder="Eg:27" Class="form-control" runat="server"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="Only numbers are allowed" SetFocusOnError="True" ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>Game_ID</td>
                <td>
                    <asp:TextBox ID="TextBox2" Class="form-control" runat="server" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox2" Display="Dynamic" ErrorMessage="Game ID is required" SetFocusOnError="True">Game ID is required</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox2" Display="Dynamic" ErrorMessage="Only numbers allowed" SetFocusOnError="True" ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>FeatureEvent</td>
                <td>
                    <asp:TextBox ID="TextBox3" Class="form-control"  runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>EventVenu</td>
                <td>
                    <asp:TextBox ID="TextBox4" Class="form-control"  runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox4" Display="Dynamic" ErrorMessage="Event venue cannot be blank" SetFocusOnError="True">event venue cannot be blank</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>EventDate</td>
                <td>
                    <asp:TextBox ID="TextBox5"  Class="form-control" TextMode="Date" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>EventStartTime</td>
                <td>
                    <asp:TextBox ID="TextBox6"  Class="form-control" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>EventEndTime</td>
                <td>
                    <asp:TextBox ID="TextBox7" Class="form-control"  runat="server" TextMode="Time"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>EventDescription</td>
                <td>
                    <asp:TextBox ID="TextBox8" Class="form-control" placeholder="max 100 words"  runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox8" Display="Dynamic" ErrorMessage="Event description cannot be blank" SetFocusOnError="True">Event Description Cannot be blank</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="TextBox8" Display="Dynamic" ErrorMessage="Max 100 words allowed" SetFocusOnError="True" ValidationExpression=".{0,100}">Max 100 words allowed</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>WorldRecord</td>
                <td>
                     <asp:DropDownList ID="DropDownList1" Class="form-control"  runat="server">
                        <asp:ListItem>No</asp:ListItem>
                        <asp:ListItem>Yes</asp:ListItem>
                        
                        
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" ForeColor="#33CC33"></asp:Label>
                </td>
                <td>
                    <asp:Button ID="Button1"  Class="btn btn-dark form-control" runat="server" OnClick="Button1_Click" Text="Submit" />
                </td>
            </tr>
        </table>
        <br />
                <table class="auto-style1 table">
            <tr>
                <td>Event ID</td>
                <td>
                    <asp:TextBox ID="TextBox9" Class="form-control"  runat="server"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TextBox9" Display="Dynamic" ErrorMessage="Only numbers allowed" ValidationExpression="^[0-9]*$" SetFocusOnError="True">Only numbers allowed</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>Competitor ID</td>
                <td>
                    <asp:TextBox ID="TextBox10" Class="form-control"  runat="server"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="TextBox10" Display="Dynamic" ErrorMessage="Only numbers allowed" ValidationExpression="^[0-9]*$" SetFocusOnError="True">Only numbers allowed</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>Competitor Position</td>
                <td>
                    <asp:TextBox ID="TextBox11" Class="form-control"  runat="server"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="TextBox11" Display="Dynamic" ErrorMessage="Only numbers allowed" ValidationExpression="^[0-9]*$" SetFocusOnError="True">Only numbers allowed</asp:RegularExpressionValidator>
                </td>
            </tr>
<%--            <tr>
                <td class="auto-style2"></td>
                <td class="auto-style2">
                    &nbsp;</td>
            </tr>--%>
            <tr>
                <td>Competitor Medal</td>
                <td>
                    <asp:DropDownList ID="DropDownList2" class="form-control-sm" runat="server">
                        <asp:ListItem>Gold</asp:ListItem>
                        <asp:ListItem>Silver</asp:ListItem>
                        <asp:ListItem>Bronze</asp:ListItem>
                        <asp:ListItem>No</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
           <tr>
                <td>
                    <asp:Label ID="Label2" runat="server"></asp:Label>
                </td>
                <td>
                    <asp:Button ID="Button2"  Class="btn btn-dark ml-2 form-control" runat="server" OnClick="Button2_Click" CausesValidation="false" Text="Submit Outcome" />
                </td>
            </tr>
           <tr>
                
                <td colspan="2">
                    <asp:Button ID="Button3" Class="btn btn-dark ml-2" runat="server" Text="Edit or delete Event information" CausesValidation="false" OnClick="Button3_Click" />
                </td>
               <td colspan="2">
                    &nbsp;</td>

            </tr>
        </table>
        <div>
        </div>

            


        
                    <asp:Button ID="Button4" Class="btn btn-dark ml-3" runat="server" Text="Add Event Photos" CausesValidation="false" OnClick="Button4_Click" />

            


        
    </form>
        <script src="Scripts/jquery-3.4.1.min.js"></script>
    <script src="Scripts/popper.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</body>
</html>
