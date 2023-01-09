<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Games.aspx.cs" Inherits="RADSports.Games" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="StyleSheet1.css" rel="stylesheet" />


    <style type="text/css">
        .auto-style1 {
            height: 65px;
        }
    </style>


    </head>
<body>
    <div class="navbar navbar-dark bg-dark mb-3">
    <a class="navbar-brand" href="/AdminSelection">Main Menu</a>
  <a  class="btn btn-danger ml-auto" role="button" href="./Logout">Logout</a>
  
    </div>
    <form id="form1" runat="server">
        <div>
        </div>
        <p>
            &nbsp;</p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LoginCon %>" DeleteCommand="DELETE FROM [Game] WHERE [Game_ID] = @Game_ID" InsertCommand="INSERT INTO [Game] ([Game_ID], [Game_Code], [Game_Name], [Game_DurationInHours], [Game_Description], [Game_RulesBooklet]) VALUES (@Game_ID, @Game_Code, @Game_Name, @Game_DurationInHours, @Game_Description, @Game_RulesBooklet)" SelectCommand="SELECT * FROM [Game]" UpdateCommand="UPDATE [Game] SET [Game_Code] = @Game_Code, [Game_Name] = @Game_Name, [Game_DurationInHours] = @Game_DurationInHours, [Game_Description] = @Game_Description, [Game_RulesBooklet] = @Game_RulesBooklet WHERE [Game_ID] = @Game_ID">
            <DeleteParameters>
                <asp:Parameter Name="Game_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Game_ID" Type="Int32" />
                <asp:Parameter Name="Game_Code" Type="String" />
                <asp:Parameter Name="Game_Name" Type="String" />
                <asp:Parameter Name="Game_DurationInHours" Type="Decimal" />
                <asp:Parameter Name="Game_Description" Type="String" />
                <asp:Parameter Name="Game_RulesBooklet" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Game_Code" Type="String" />
                <asp:Parameter Name="Game_Name" Type="String" />
                <asp:Parameter Name="Game_DurationInHours" Type="Decimal" />
                <asp:Parameter Name="Game_Description" Type="String" />
                <asp:Parameter Name="Game_RulesBooklet" Type="String" />
                <asp:Parameter Name="Game_ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <table class="table games">
            <tr>
                <td class="auto-style1">Game ID</td>
                <td class="auto-style1">
                    <asp:TextBox ID="TextBox1" placeholder="Eg:27" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="Game ID cannot be empty" SetFocusOnError="True">Game ID cannot be empty</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="Only numbers allowed" ValidationExpression="^[0-9]*$">Only numbers allowed</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>Game Code</td>
                <td>
                    <asp:TextBox ID="TextBox2" placeholder="Eg:AAAA111" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox2" Display="Dynamic" ErrorMessage="Game code must contain 4 uppercase letters and 3 numerals" ForeColor="White" SetFocusOnError="True" ValidationExpression="^[A-Z]{4}[0-9]{3}$">Game code must contain 4 uppercase letters and 3 numerals</asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox2" Display="Dynamic" ErrorMessage="Game Code Cannot be empty" SetFocusOnError="True">Game Code Cannot be empty</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Game Name</td>
                <td>
                    <asp:TextBox ID="TextBox3" CssClass="form-control" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Game Duration In Hours</td>
                <td>
                    <asp:TextBox ID="TextBox4" CssClass="form-control" runat="server" ></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Game Description</td>
                <td>
                    <asp:TextBox ID="TextBox5" placeholder="short description, max 100 words" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TextBox5" Display="Dynamic" ErrorMessage="Maximum 100 characters allowed" ValidationExpression=".{0,100}" SetFocusOnError="True">Maximum 100 characters allowed</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>Game Rules Booklet</td>
                <td>
                    <asp:FileUpload ID="FileUpload1" class="btn btn-outline-light" role="button" runat="server" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="FileUpload1" Display="Dynamic" ErrorMessage="Rules Booklet required" SetFocusOnError="True">Rules Booklet required</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" ForeColor="#00CC00"></asp:Label>
                </td>
                <td>
                    <asp:Button ID="Button1" class="btn btn-dark form-control" runat="server" OnClick="Button1_Click" Text="Submit" />
                </td>
            </tr>
        </table>
        <asp:GridView ID="GridView1" class="CompetitorEdit table table-hover table-dark" runat="server" AutoGenerateColumns="False" DataKeyNames="Game_ID" DataSourceID="SqlDataSource1" OnRowCommand="GridView1_RowCommand">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="Game_ID" HeaderText="Game ID" ReadOnly="True" SortExpression="Game_ID" />
                <asp:BoundField DataField="Game_Code" HeaderText="Game Code" SortExpression="Game_Code" />
                <asp:BoundField DataField="Game_Name" HeaderText="Game Name" SortExpression="Game_Name" />
                <asp:BoundField DataField="Game_DurationInHours" HeaderText="Game DurationInHours" SortExpression="Game_DurationInHours" />
                <asp:BoundField DataField="Game_Description" HeaderText="Game Description" SortExpression="Game_Description" />
                <asp:TemplateField HeaderText="Game RulesBooklet">
                    <ItemTemplate>
                        <asp:imageButton ID="LinkButton1" runat="server" CausesValidation="false" CommandArgument='<%# Eval("Game_RulesBooklet") %>' ImageUrl="~/myfiles/rules.jpg" CommandName="Download" Text='<%# Eval("Game_RulesBooklet") %>' ></asp:imageButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </form>
    <script src="Scripts/jquery-3.4.1.min.js"></script>
    <script src="Scripts/popper.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</body>
</html>
