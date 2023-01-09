<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EventView.aspx.cs" Inherits="RADSports.EventView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
            <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="StyleSheet1.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
 <div class="navbar navbar-dark bg-dark">
    <a class="navbar-brand" href="/ManagerSelection">Main Menu</a>
        <a  class="btn btn-danger ml-auto" role="button" href="./Logout">Logout</a>
  
    </div>
        <div>
            <asp:SqlDataSource ID="SqlDataSource1"  runat="server" ConnectionString="<%$ ConnectionStrings:LoginCon %>" DeleteCommand="DELETE FROM [Event] WHERE [Event_ID] = @Event_ID" InsertCommand="INSERT INTO [Event] ([Event_ID], [Game_ID], [FeatureEvent], [EventVenu], [EventDate], [EventStartTime], [EventEndTime], [EventDescription], [WorldRecord]) VALUES (@Event_ID, @Game_ID, @FeatureEvent, @EventVenu, @EventDate, @EventStartTime, @EventEndTime, @EventDescription, @WorldRecord)" SelectCommand="SELECT * FROM [Event]" UpdateCommand="UPDATE [Event] SET [Game_ID] = @Game_ID, [FeatureEvent] = @FeatureEvent, [EventVenu] = @EventVenu, [EventDate] = @EventDate, [EventStartTime] = @EventStartTime, [EventEndTime] = @EventEndTime, [EventDescription] = @EventDescription, [WorldRecord] = @WorldRecord WHERE [Event_ID] = @Event_ID">
                <DeleteParameters>
                    <asp:Parameter Name="Event_ID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Event_ID" Type="Int32" />
                    <asp:Parameter Name="Game_ID" Type="Int32" />
                    <asp:Parameter Name="FeatureEvent" Type="String" />
                    <asp:Parameter Name="EventVenu" Type="String" />
                    <asp:Parameter DbType="Date" Name="EventDate" />
                    <asp:Parameter DbType="Time" Name="EventStartTime" />
                    <asp:Parameter DbType="Time" Name="EventEndTime" />
                    <asp:Parameter Name="EventDescription" Type="String" />
                    <asp:Parameter Name="WorldRecord" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Game_ID" Type="Int32" />
                    <asp:Parameter Name="FeatureEvent" Type="String" />
                    <asp:Parameter Name="EventVenu" Type="String" />
                    <asp:Parameter DbType="Date" Name="EventDate" />
                    <asp:Parameter DbType="Time" Name="EventStartTime" />
                    <asp:Parameter DbType="Time" Name="EventEndTime" />
                    <asp:Parameter Name="EventDescription" Type="String" />
                    <asp:Parameter Name="WorldRecord" Type="String" />
                    <asp:Parameter Name="Event_ID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <h1>Event information</h1>
            <asp:GridView ID="GridView1" class="CompetitorEdit table table-hover table-dark" runat="server" AutoGenerateColumns="False" DataKeyNames="Event_ID" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="Event_ID" HeaderText="Event_ID" ReadOnly="True" SortExpression="Event_ID" />
                    <asp:BoundField DataField="Game_ID" HeaderText="Game_ID" SortExpression="Game_ID" />
                    <asp:BoundField DataField="FeatureEvent" HeaderText="FeatureEvent" SortExpression="FeatureEvent" />
                    <asp:BoundField DataField="EventVenu" HeaderText="EventVenu" SortExpression="EventVenu" />
                    <asp:BoundField DataField="EventDate" HeaderText="EventDate" SortExpression="EventDate" />
                    <asp:BoundField DataField="EventStartTime" HeaderText="EventStartTime" SortExpression="EventStartTime" />
                    <asp:BoundField DataField="EventEndTime" HeaderText="EventEndTime" SortExpression="EventEndTime" />
                    <asp:BoundField DataField="EventDescription" HeaderText="EventDescription" SortExpression="EventDescription" />
                    <asp:BoundField DataField="WorldRecord" HeaderText="WorldRecord" SortExpression="WorldRecord" />
                </Columns>
            </asp:GridView>
        </div>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:LoginCon %>" DeleteCommand="DELETE FROM [Outcome] WHERE [Event_ID] = @Event_ID AND [Competitor_ID] = @Competitor_ID" InsertCommand="INSERT INTO [Outcome] ([Event_ID], [Competitor_ID], [Competitor_Position], [Competitor_Medal]) VALUES (@Event_ID, @Competitor_ID, @Competitor_Position, @Competitor_Medal)" SelectCommand="SELECT [Event_ID], [Competitor_ID], [Competitor_Position], [Competitor_Medal] FROM [Outcome]" UpdateCommand="UPDATE [Outcome] SET [Competitor_Position] = @Competitor_Position, [Competitor_Medal] = @Competitor_Medal WHERE [Event_ID] = @Event_ID AND [Competitor_ID] = @Competitor_ID">
            <DeleteParameters>
                <asp:Parameter Name="Event_ID" Type="Int32" />
                <asp:Parameter Name="Competitor_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Event_ID" Type="Int32" />
                <asp:Parameter Name="Competitor_ID" Type="Int32" />
                <asp:Parameter Name="Competitor_Position" Type="Int32" />
                <asp:Parameter Name="Competitor_Medal" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Competitor_Position" Type="Int32" />
                <asp:Parameter Name="Competitor_Medal" Type="String" />
                <asp:Parameter Name="Event_ID" Type="Int32" />
                <asp:Parameter Name="Competitor_ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <h2>Results</h2>
        <asp:GridView ID="GridView2" class="CompetitorEdit table table-hover table-dark"  runat="server" AutoGenerateColumns="False" DataKeyNames="Event_ID,Competitor_ID" DataSourceID="SqlDataSource2">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="Event_ID" HeaderText="Event_ID" ReadOnly="True" SortExpression="Event_ID" />
                <asp:BoundField DataField="Competitor_ID" HeaderText="Competitor_ID" ReadOnly="True" SortExpression="Competitor_ID" />
                <asp:BoundField DataField="Competitor_Position" HeaderText="Competitor_Position" SortExpression="Competitor_Position" />
                <asp:BoundField DataField="Competitor_Medal" HeaderText="Competitor_Medal" SortExpression="Competitor_Medal" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:LoginCon %>" DeleteCommand="DELETE FROM [EventPhotos] WHERE [Photo_ID] = @Photo_ID" InsertCommand="INSERT INTO [EventPhotos] ([Photo_ID], [Event_Photo], [Event_PhotoTags], [Event_ID]) VALUES (@Photo_ID, @Event_Photo, @Event_PhotoTags, @Event_ID)" SelectCommand="SELECT * FROM [EventPhotos]" UpdateCommand="UPDATE [EventPhotos] SET [Event_Photo] = @Event_Photo, [Event_PhotoTags] = @Event_PhotoTags, [Event_ID] = @Event_ID WHERE [Photo_ID] = @Photo_ID">
            <DeleteParameters>
                <asp:Parameter Name="Photo_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Photo_ID" Type="Int32" />
                <asp:Parameter Name="Event_Photo" Type="String" />
                <asp:Parameter Name="Event_PhotoTags" Type="String" />
                <asp:Parameter Name="Event_ID" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Event_Photo" Type="String" />
                <asp:Parameter Name="Event_PhotoTags" Type="String" />
                <asp:Parameter Name="Event_ID" Type="Int32" />
                <asp:Parameter Name="Photo_ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
          <h2>Event Photos</h2>
        <asp:GridView ID="GridView3" class="CompetitorEdit table table-hover table-dark"  runat="server" AutoGenerateColumns="False" DataKeyNames="Photo_ID" DataSourceID="SqlDataSource3">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="Photo_ID" HeaderText="Photo_ID" ReadOnly="True" SortExpression="Photo_ID" />
                <asp:BoundField DataField="Event_Photo" HeaderText="Event_Photo" SortExpression="Event_Photo" />
                <asp:BoundField DataField="Event_PhotoTags" HeaderText="Event_PhotoTags" SortExpression="Event_PhotoTags" />
                <asp:BoundField DataField="Event_ID" HeaderText="Event_ID" SortExpression="Event_ID" />
            </Columns>
        </asp:GridView>
    </form>
        <script src="Scripts/jquery-3.4.1.min.js"></script>
    <script src="Scripts/popper.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</body>
</html>
