<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CompetitorEdit.aspx.cs" Inherits="RADSports.CompetitorEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
        <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="StyleSheet1.css" rel="stylesheet" />
</head>
<body>
    <div class="navbar navbar-dark bg-dark mb-3">
        <a class="navbar-brand" href="/AdminSelection">Main Menu</a>
        <a  class="btn btn-danger ml-auto" role="button" href="./Logout">Logout</a>
  
    </div>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="CompetitorEdit table table-hover table-dark" DataKeyNames="Competitor_ID" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="Competitor_ID" HeaderText="Competitor ID" ReadOnly="True" SortExpression="Competitor_ID" />
                <asp:BoundField DataField="Competitor_Name" HeaderText="Competitor Name" SortExpression="Competitor_Name" />
                <asp:BoundField DataField="Competitor_Salutation" HeaderText="Competitor Salutation" SortExpression="Competitor_Salutation" />
                <asp:BoundField DataField="Competitor_DoB" HeaderText="Competitor DoB" SortExpression="Competitor_DoB" />
                <asp:BoundField DataField="Competitor_Email" HeaderText="Competitor Email" SortExpression="Competitor_Email" />
                <asp:BoundField DataField="Competitor_Description" HeaderText="Competitor Description" SortExpression="Competitor_Description" />
                <asp:BoundField DataField="Competitor_Country" HeaderText="Competitor Country" SortExpression="Competitor_Country" />
                <asp:BoundField DataField="Competitor_Gender" HeaderText="Competitor Gender" SortExpression="Competitor_Gender" />
                <asp:BoundField DataField="Competitor_ContactNo" HeaderText="Competitor ContactNo" SortExpression="Competitor_ContactNo" />
                <asp:BoundField DataField="Competitor_Website" HeaderText="Competitor Website" SortExpression="Competitor_Website" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LoginCon %>" DeleteCommand="DELETE FROM [Competitor] WHERE [Competitor_ID] = @Competitor_ID" InsertCommand="INSERT INTO [Competitor] ([Competitor_ID], [Competitor_Name], [Competitor_Salutation], [Competitor_DoB], [Competitor_Email], [Competitor_Description], [Competitor_Country], [Competitor_Gender], [Competitor_ContactNo], [Competitor_Website]) VALUES (@Competitor_ID, @Competitor_Name, @Competitor_Salutation, @Competitor_DoB, @Competitor_Email, @Competitor_Description, @Competitor_Country, @Competitor_Gender, @Competitor_ContactNo, @Competitor_Website)" SelectCommand="SELECT [Competitor_ID], [Competitor_Name], [Competitor_Salutation], [Competitor_DoB], [Competitor_Email], [Competitor_Description], [Competitor_Country], [Competitor_Gender], [Competitor_ContactNo], [Competitor_Website] FROM [Competitor]" UpdateCommand="UPDATE [Competitor] SET [Competitor_Name] = @Competitor_Name, [Competitor_Salutation] = @Competitor_Salutation, [Competitor_DoB] = @Competitor_DoB, [Competitor_Email] = @Competitor_Email, [Competitor_Description] = @Competitor_Description, [Competitor_Country] = @Competitor_Country, [Competitor_Gender] = @Competitor_Gender, [Competitor_ContactNo] = @Competitor_ContactNo, [Competitor_Website] = @Competitor_Website WHERE [Competitor_ID] = @Competitor_ID">
            <DeleteParameters>
                <asp:Parameter Name="Competitor_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Competitor_ID" Type="Int32" />
                <asp:Parameter Name="Competitor_Name" Type="String" />
                <asp:Parameter Name="Competitor_Salutation" Type="String" />
                <asp:Parameter DbType="Date" Name="Competitor_DoB" />
                <asp:Parameter Name="Competitor_Email" Type="String" />
                <asp:Parameter Name="Competitor_Description" Type="String" />
                <asp:Parameter Name="Competitor_Country" Type="String" />
                <asp:Parameter Name="Competitor_Gender" Type="String" />
                <asp:Parameter Name="Competitor_ContactNo" Type="String" />
                <asp:Parameter Name="Competitor_Website" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Competitor_Name" Type="String" />
                <asp:Parameter Name="Competitor_Salutation" Type="String" />
                <asp:Parameter DbType="Date" Name="Competitor_DoB" />
                <asp:Parameter Name="Competitor_Email" Type="String" />
                <asp:Parameter Name="Competitor_Description" Type="String" />
                <asp:Parameter Name="Competitor_Country" Type="String" />
                <asp:Parameter Name="Competitor_Gender" Type="String" />
                <asp:Parameter Name="Competitor_ContactNo" Type="String" />
                <asp:Parameter Name="Competitor_Website" Type="String" />
                <asp:Parameter Name="Competitor_ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
        <script src="Scripts/jquery-3.4.1.min.js"></script>
    <script src="Scripts/popper.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</body>
</html>
