<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MedalCount.aspx.cs" Inherits="RADSports.MedalCount" %>

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
        <div>
        </div>
        <h2>Winning Countries</h2>
        <asp:GridView ID="GridView1" class="CompetitorEdit table table-hover table-dark"  runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="RankResult" HeaderText="Ladder Position" ReadOnly="True" SortExpression="RankResult" />
                <asp:BoundField DataField="Competitor_Country" HeaderText="Country" SortExpression="Competitor_Country" />
                <asp:BoundField DataField="GoldMedals" HeaderText="Gold Medals" ReadOnly="True" SortExpression="GoldMedals" />
                <asp:BoundField DataField="SilverMedals" HeaderText="Silver Medals" ReadOnly="True" SortExpression="SilverMedals" />
                <asp:BoundField DataField="BronzeMedals" HeaderText="Bronze Medals" ReadOnly="True" SortExpression="BronzeMedals" />
                <asp:BoundField DataField="totalMedals" HeaderText="Total Medals" ReadOnly="True" SortExpression="totalMedals" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LoginCon %>" SelectCommand="select Competitor_Country, sum(Outcome.Gold_Count) AS GoldMedals, sum(Outcome.Silver_Count) AS SilverMedals, sum(Outcome.Bronze_Count) AS BronzeMedals, sum(Outcome.Bronze_Count) + sum(Outcome.Gold_Count) AS totalMedals, RANK() OVER (ORDER BY SUM(totalMedals) DESC ) AS RankResult from Outcome  Group by Competitor_Country order by totalMedals DESC, Competitor_Country ASC ;"></asp:SqlDataSource>
        <asp:Button ID="Button1" class="btn btn-primary btn-lg btn-block mb-3 mt-3" runat="server" OnClick="Button1_Click" Text="Export Results to Word" />
        <br />
        <h2>Athletes with World Records</h2>
        <asp:GridView ID="GridView2"  class="CompetitorEdit table table-hover table-dark"  runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2">
            <Columns>
                <asp:BoundField DataField="Competitor_Name" HeaderText="Competitor Name" SortExpression="Competitor_Name" />
                <asp:BoundField DataField="Game_Name" HeaderText="Game Name" SortExpression="Game_Name" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:LoginCon %>" SelectCommand="SELECT Competitor.Competitor_Name, Game.Game_Name FROM Competitor INNER JOIN Game ON Competitor.Competitor_GameID = Game.Game_ID INNER JOIN Event ON Game.Game_ID = Event.Game_ID INNER JOIN Outcome ON Competitor.Competitor_ID = Outcome.Competitor_ID AND Event.Event_ID = Outcome.Event_ID WHERE (Event.WorldRecord = 'YES')"></asp:SqlDataSource>
    </form>
        <script src="Scripts/jquery-3.4.1.min.js"></script>
    <script src="Scripts/popper.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</body>
</html>
