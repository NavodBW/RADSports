<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Competitors.aspx.cs" Inherits="RADSports.Competitors" %>

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
    <a class="navbar-brand" href="/AdminSelection">Main Menu</a>
  <a  class="btn btn-danger ml-auto" role="button" href="./Logout">Logout</a>
  
    </div>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LoginCon %>" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [Competitor_ID], [Competitor_Salutation], [Competitor_Name], [Competitor_DoB], [Competitor_Email], [Competitor_Description], [Competitor_Gender], [Competitor_ContactNo], [Competitor_Website], [Competitor_Country], [Competitor_Photo] FROM [Competitor]" DeleteCommand="DELETE FROM [Competitor] WHERE [Competitor_ID] = @original_Competitor_ID" InsertCommand="INSERT INTO [Competitor] ([Competitor_ID], [Competitor_Salutation], [Competitor_Name], [Competitor_DoB], [Competitor_Email], [Competitor_Description], [Competitor_Gender], [Competitor_ContactNo], [Competitor_Website], [Competitor_Country], [Competitor_Photo]) VALUES (@Competitor_ID, @Competitor_Salutation, @Competitor_Name, @Competitor_DoB, @Competitor_Email, @Competitor_Description, @Competitor_Gender, @Competitor_ContactNo, @Competitor_Website, @Competitor_Country, @Competitor_Photo)" UpdateCommand="UPDATE [Competitor] SET [Competitor_Salutation] = @Competitor_Salutation, [Competitor_Name] = @Competitor_Name, [Competitor_DoB] = @Competitor_DoB, [Competitor_Email] = @Competitor_Email, [Competitor_Description] = @Competitor_Description, [Competitor_Gender] = @Competitor_Gender, [Competitor_ContactNo] = @Competitor_ContactNo, [Competitor_Website] = @Competitor_Website, [Competitor_Country] = @Competitor_Country, [Competitor_Photo] = @Competitor_Photo WHERE [Competitor_ID] = @original_Competitor_ID">
            <DeleteParameters>
                <asp:Parameter Name="original_Competitor_ID" Type="Int32" />
                
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Competitor_ID" Type="Int32" />
                <asp:Parameter Name="Competitor_Salutation" Type="String" />
                <asp:Parameter Name="Competitor_Name" Type="String" />
                <asp:Parameter Name="Competitor_DoB" DbType="Date" />
                <asp:Parameter Name="Competitor_Email" Type="String" />
                <asp:Parameter Name="Competitor_Description" Type="String" />
                <asp:Parameter Name="Competitor_Gender" Type="String" />
                <asp:Parameter Name="Competitor_ContactNo" Type="String" />
                <asp:Parameter Name="Competitor_Website" Type="String" />
                <asp:Parameter Name="Competitor_Country" Type="String" />
                <asp:Parameter Name="Competitor_Photo" Type="Object" />
                
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Competitor_Salutation" Type="String" />
                <asp:Parameter Name="Competitor_Name" Type="String" />
                <asp:Parameter Name="Competitor_DoB" DbType="Date" />
                <asp:Parameter Name="Competitor_Email" Type="String" />
                <asp:Parameter Name="Competitor_Description" Type="String" />
                <asp:Parameter Name="Competitor_Gender" Type="String" />
                <asp:Parameter Name="Competitor_ContactNo" Type="String" />
                <asp:Parameter Name="Competitor_Website" Type="String" />
                <asp:Parameter Name="Competitor_Country" Type="String" />
                <asp:Parameter Name="Competitor_Photo" Type="Object" />
                <asp:Parameter Name="original_Competitor_ID" Type="Int32"  />
                
            </UpdateParameters>
        </asp:SqlDataSource>
        <p>
            &nbsp;</p>
        <table class="auto-style1 table">
            <tr>
                <td>Competitor ID</td>
                <td>
                    <asp:TextBox ID="TextBox1" placeholder="Eg:27" Class="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="Competitor ID Cannot be Empty" SetFocusOnError="True">Competitor ID Cannot be Empty</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="Only numerical values allowed" ValidationExpression="^[0-9]*$" SetFocusOnError="True">Only numerical values allowed</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>Competitor Salutation</td>
                <td>
                    <asp:DropDownList ID="DropDownList2" Class="form-control" runat="server">
                        <asp:ListItem>Mr</asp:ListItem>
                        <asp:ListItem>Mrs</asp:ListItem>
                        <asp:ListItem>Ms</asp:ListItem>
                        <asp:ListItem>Dr</asp:ListItem>
                        <asp:ListItem>Prof</asp:ListItem>
                        <asp:ListItem>Rev</asp:ListItem>
                        <asp:ListItem>Sir</asp:ListItem>
                        
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>Competitor Name</td>
                <td>
                    <asp:TextBox ID="TextBox3" Class="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox3" Display="Dynamic" ErrorMessage="Competitor Name Cannot be empty" SetFocusOnError="True">Competitor Name Cannot be empty</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Competitor DoB</td>
                <td>
                    <asp:TextBox ID="TextBox4" Class="form-control" TextMode="Date" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Competitor Email</td>
                <td>
                    <asp:TextBox ID="TextBox5" Class="form-control" runat="server"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox5" Display="Dynamic" ErrorMessage="invalid email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" SetFocusOnError="True">invalid email</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>Competitor Description</td>
                <td>
                    <asp:TextBox ID="TextBox6" placeholder="short summary, max 100 words" Class="form-control" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Competitor Country</td>
                <td>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="TextBox6" Display="Dynamic" ErrorMessage="Max 100 words allowed" SetFocusOnError="True" ValidationExpression=".{0,100}">Max 100 words allowed</asp:RegularExpressionValidator>
                    <asp:DropDownList ID="ddlCountryOrigin" Class="form-control" runat="server">
                    <asp:ListItem Selected="true">Select Country</asp:ListItem>
                    <asp:ListItem>United States</asp:ListItem>
                    <asp:ListItem>Afghanistan</asp:ListItem>
                    <asp:ListItem>Albania</asp:ListItem>
                    <asp:ListItem>Algeria</asp:ListItem>
                    <asp:ListItem>American Samoa</asp:ListItem>
                    <asp:ListItem>Andorra</asp:ListItem>
                    <asp:ListItem>Angola</asp:ListItem>
                    <asp:ListItem>Anguilla</asp:ListItem>
                    <asp:ListItem>Antarctica</asp:ListItem>
                    <asp:ListItem>Antigua And Barbuda</asp:ListItem>
                    <asp:ListItem>Argentina</asp:ListItem>
                    <asp:ListItem>Armenia</asp:ListItem>
                    <asp:ListItem>Aruba</asp:ListItem>
                    <asp:ListItem>Australia</asp:ListItem>
                    <asp:ListItem>Austria</asp:ListItem>
                    <asp:ListItem>Azerbaijan</asp:ListItem>
                    <asp:ListItem>Bahamas</asp:ListItem>
                    <asp:ListItem>Bahrain</asp:ListItem>
                    <asp:ListItem>Bangladesh</asp:ListItem>
                    <asp:ListItem>Barbados</asp:ListItem>
                    <asp:ListItem>Belarus</asp:ListItem>
                    <asp:ListItem>Belgium</asp:ListItem>
                    <asp:ListItem>Belize</asp:ListItem>
                    <asp:ListItem>Benin</asp:ListItem>
                    <asp:ListItem>Bermuda</asp:ListItem>
                    <asp:ListItem>Bhutan</asp:ListItem>
                    <asp:ListItem>Bolivia</asp:ListItem>
                    <asp:ListItem>Bosnia And Herzegowina</asp:ListItem>
                    <asp:ListItem>Botswana</asp:ListItem>
                    <asp:ListItem>Bouvet Island</asp:ListItem>
                    <asp:ListItem>Brazil</asp:ListItem>
                    <asp:ListItem>British Indian Ocean Territory</asp:ListItem>
                    <asp:ListItem>Brunei Darussalam</asp:ListItem>
                    <asp:ListItem>Bulgaria</asp:ListItem>
                    <asp:ListItem>Burkina Faso</asp:ListItem>
                    <asp:ListItem>Burundi</asp:ListItem>
                    <asp:ListItem>Cambodia</asp:ListItem>
                    <asp:ListItem>Cameroon</asp:ListItem>
                    <asp:ListItem>Canada</asp:ListItem>
                    <asp:ListItem>Cape Verde</asp:ListItem>
                    <asp:ListItem>Cayman Islands</asp:ListItem>
                    <asp:ListItem>Central African Republic</asp:ListItem>
                    <asp:ListItem>Chad</asp:ListItem>
                    <asp:ListItem>Chile</asp:ListItem>
                    <asp:ListItem>China</asp:ListItem>
                    <asp:ListItem>Christmas Island</asp:ListItem>
                    <asp:ListItem>Cocos (Keeling) Islands</asp:ListItem>
                    <asp:ListItem>Colombia</asp:ListItem>
                    <asp:ListItem>Comoros</asp:ListItem>
                    <asp:ListItem>Congo</asp:ListItem>
                    <asp:ListItem>Cook Islands</asp:ListItem>
                    <asp:ListItem>Costa Rica</asp:ListItem>
                    <asp:ListItem>Cote D'Ivoire</asp:ListItem>
                    <asp:ListItem>Croatia (Local Name: Hrvatska)</asp:ListItem>
                    <asp:ListItem>Cuba</asp:ListItem>
                    <asp:ListItem>Cyprus</asp:ListItem>
                    <asp:ListItem>Czech Republic</asp:ListItem>
                    <asp:ListItem>Denmark</asp:ListItem>
                    <asp:ListItem>Djibouti</asp:ListItem>
                    <asp:ListItem>Dominica</asp:ListItem>
                    <asp:ListItem>Dominican Republic</asp:ListItem>
                    <asp:ListItem>East Timor</asp:ListItem>
                    <asp:ListItem>Ecuador</asp:ListItem>
                    <asp:ListItem>Egypt</asp:ListItem>
                    <asp:ListItem>El Salvador</asp:ListItem>
                    <asp:ListItem>Equatorial Guinea</asp:ListItem>
                    <asp:ListItem>Eritrea</asp:ListItem>
                    <asp:ListItem>Estonia</asp:ListItem>
                    <asp:ListItem>Ethiopia</asp:ListItem>
                    <asp:ListItem>Falkland Islands (Malvinas)</asp:ListItem>
                    <asp:ListItem>Faroe Islands</asp:ListItem>
                    <asp:ListItem>Fiji</asp:ListItem>
                    <asp:ListItem>Finland</asp:ListItem>
                    <asp:ListItem>France</asp:ListItem>
                    <asp:ListItem>French Guiana</asp:ListItem>
                    <asp:ListItem>French Polynesia</asp:ListItem>
                    <asp:ListItem>French Southern Territories</asp:ListItem>
                    <asp:ListItem>Gabon</asp:ListItem>
                    <asp:ListItem>Gambia</asp:ListItem>
                    <asp:ListItem>Georgia</asp:ListItem>
                    <asp:ListItem>Germany</asp:ListItem>
                    <asp:ListItem>Ghana</asp:ListItem>
                    <asp:ListItem>Gibraltar</asp:ListItem>
                    <asp:ListItem>Greece</asp:ListItem>
                    <asp:ListItem>Greenland</asp:ListItem>
                    <asp:ListItem>Grenada</asp:ListItem>
                    <asp:ListItem>Guadeloupe</asp:ListItem>
                    <asp:ListItem>Guam</asp:ListItem>
                    <asp:ListItem>Guatemala</asp:ListItem>
                    <asp:ListItem>Guinea</asp:ListItem>
                    <asp:ListItem>Guinea-Bissau</asp:ListItem>
                    <asp:ListItem>Guyana</asp:ListItem>
                    <asp:ListItem>Haiti</asp:ListItem>
                    <asp:ListItem>Honduras</asp:ListItem>
                    <asp:ListItem>Hong Kong</asp:ListItem>
                    <asp:ListItem>Hungary</asp:ListItem>
                    <asp:ListItem>Icel And</asp:ListItem>
                    <asp:ListItem>India</asp:ListItem>
                    <asp:ListItem>Indonesia</asp:ListItem>
                    <asp:ListItem>Iran (Islamic Republic Of)</asp:ListItem>
                    <asp:ListItem>Iraq</asp:ListItem>
                    <asp:ListItem>Ireland</asp:ListItem>
                    <asp:ListItem>Israel</asp:ListItem>
                    <asp:ListItem>Italy</asp:ListItem>
                    <asp:ListItem>Jamaica</asp:ListItem>
                    <asp:ListItem>Japan</asp:ListItem>
                    <asp:ListItem>Jordan</asp:ListItem>
                    <asp:ListItem>Kazakhstan</asp:ListItem>
                    <asp:ListItem>Kenya</asp:ListItem>
                    <asp:ListItem>Kiribati</asp:ListItem>
                    <asp:ListItem>Korea</asp:ListItem>
                    <asp:ListItem>Kuwait</asp:ListItem>
                    <asp:ListItem>Kyrgyzstan</asp:ListItem>
                    <asp:ListItem>Lao People'S Dem Republic</asp:ListItem>
                    <asp:ListItem>Latvia</asp:ListItem>
                    <asp:ListItem>Lebanon</asp:ListItem>
                    <asp:ListItem>Lesotho</asp:ListItem>
                    <asp:ListItem>Liberia</asp:ListItem>
                    <asp:ListItem>Libyan Arab Jamahiriya</asp:ListItem>
                    <asp:ListItem>Liechtenstein</asp:ListItem>
                    <asp:ListItem>Lithuania</asp:ListItem>
                    <asp:ListItem>Luxembourg</asp:ListItem>
                    <asp:ListItem>Macau</asp:ListItem>
                    <asp:ListItem>Macedonia</asp:ListItem>
                    <asp:ListItem>Madagascar</asp:ListItem>
                    <asp:ListItem>Malawi</asp:ListItem>
                    <asp:ListItem>Malaysia</asp:ListItem>
                    <asp:ListItem>Maldives</asp:ListItem>
                    <asp:ListItem>Mali</asp:ListItem>
                    <asp:ListItem>Malta</asp:ListItem>
                    <asp:ListItem>Marshall Islands</asp:ListItem>
                    <asp:ListItem>Martinique</asp:ListItem>
                    <asp:ListItem>Mauritania</asp:ListItem>
                    <asp:ListItem>Mauritius</asp:ListItem>
                    <asp:ListItem>Mayotte</asp:ListItem>
                    <asp:ListItem>Mexico</asp:ListItem>
                    <asp:ListItem>Micronesia, Federated States</asp:ListItem>
                    <asp:ListItem>Moldova, Republic Of</asp:ListItem>
                    <asp:ListItem>Monaco</asp:ListItem>
                    <asp:ListItem>Mongolia</asp:ListItem>
                    <asp:ListItem>Montserrat</asp:ListItem>
                    <asp:ListItem>Morocco</asp:ListItem>
                    <asp:ListItem>Mozambique</asp:ListItem>
                    <asp:ListItem>Myanmar</asp:ListItem>
                    <asp:ListItem>Namibia</asp:ListItem>
                    <asp:ListItem>Nauru</asp:ListItem>
                    <asp:ListItem>Nepal</asp:ListItem>
                    <asp:ListItem>Netherlands</asp:ListItem>
                    <asp:ListItem>Netherlands Ant Illes</asp:ListItem>
                    <asp:ListItem>New Caledonia</asp:ListItem>
                    <asp:ListItem>New Zealand</asp:ListItem>
                    <asp:ListItem>Nicaragua</asp:ListItem>
                    <asp:ListItem>Niger</asp:ListItem>
                    <asp:ListItem>Nigeria</asp:ListItem>
                    <asp:ListItem>Niue</asp:ListItem>
                    <asp:ListItem>Norfolk Island</asp:ListItem>
                    <asp:ListItem>Northern Mariana Islands</asp:ListItem>
                    <asp:ListItem>Norway</asp:ListItem>
                    <asp:ListItem>Oman</asp:ListItem>
                    <asp:ListItem>Pakistan</asp:ListItem>
                    <asp:ListItem>Palau</asp:ListItem>
                    <asp:ListItem>Panama</asp:ListItem>
                    <asp:ListItem>Papua New Guinea</asp:ListItem>
                    <asp:ListItem>Paraguay</asp:ListItem>
                    <asp:ListItem>Peru</asp:ListItem>
                    <asp:ListItem>Philippines</asp:ListItem>
                    <asp:ListItem>Pitcairn</asp:ListItem>
                    <asp:ListItem>Poland</asp:ListItem>
                    <asp:ListItem>Portugal</asp:ListItem>
                    <asp:ListItem>Puerto Rico</asp:ListItem>
                    <asp:ListItem>Qatar</asp:ListItem>
                    <asp:ListItem>Reunion</asp:ListItem>
                    <asp:ListItem>Romania</asp:ListItem>
                    <asp:ListItem>Russian Federation</asp:ListItem>
                    <asp:ListItem>Rwanda</asp:ListItem>
                    <asp:ListItem>Saint K Itts And Nevis</asp:ListItem>
                    <asp:ListItem>Saint Lucia</asp:ListItem>
                    <asp:ListItem>Saint Vincent, The Grenadines</asp:ListItem>
                    <asp:ListItem>Samoa</asp:ListItem>
                    <asp:ListItem>San Marino</asp:ListItem>
                    <asp:ListItem>Sao Tome And Principe</asp:ListItem>
                    <asp:ListItem>Saudi Arabia</asp:ListItem>
                    <asp:ListItem>Senegal</asp:ListItem>
                    <asp:ListItem>Seychelles</asp:ListItem>
                    <asp:ListItem>Sierra Leone</asp:ListItem>
                    <asp:ListItem>Singapore</asp:ListItem>
                    <asp:ListItem>Slovakia (Slovak Republic)</asp:ListItem>
                    <asp:ListItem>Slovenia</asp:ListItem>
                    <asp:ListItem>Solomon Islands</asp:ListItem>
                    <asp:ListItem>Somalia</asp:ListItem>
                    <asp:ListItem>South Africa</asp:ListItem>
                    <asp:ListItem>South Georgia , S Sandwich Is.</asp:ListItem>
                    <asp:ListItem>Spain</asp:ListItem>
                    <asp:ListItem>Sri Lanka</asp:ListItem>
                    <asp:ListItem>St. Helena</asp:ListItem>
                    <asp:ListItem>St. Pierre And Miquelon</asp:ListItem>
                    <asp:ListItem>Sudan</asp:ListItem>
                    <asp:ListItem>Suriname</asp:ListItem>
                    <asp:ListItem>Svalbard, Jan Mayen Islands</asp:ListItem>
                    <asp:ListItem>Sw Aziland</asp:ListItem>
                    <asp:ListItem>Sweden</asp:ListItem>
                    <asp:ListItem>Switzerland</asp:ListItem>
                    <asp:ListItem>Syrian Arab Republic</asp:ListItem>
                    <asp:ListItem>Taiwan</asp:ListItem>
                    <asp:ListItem>Tajikistan</asp:ListItem>
                    <asp:ListItem>Tanzania, United Republic Of</asp:ListItem>
                    <asp:ListItem>Thailand</asp:ListItem>
                    <asp:ListItem>Togo</asp:ListItem>
                    <asp:ListItem>Tokelau</asp:ListItem>
                    <asp:ListItem>Tonga</asp:ListItem>
                    <asp:ListItem>Trinidad And Tobago</asp:ListItem>
                    <asp:ListItem>Tunisia</asp:ListItem>
                    <asp:ListItem>Turkey</asp:ListItem>
                    <asp:ListItem>Turkmenistan</asp:ListItem>
                    <asp:ListItem>Turks And Caicos Islands</asp:ListItem>
                    <asp:ListItem>Tuvalu</asp:ListItem>
                    <asp:ListItem>Uganda</asp:ListItem>
                    <asp:ListItem>Ukraine</asp:ListItem>
                    <asp:ListItem>United Arab Emirates</asp:ListItem>
                    <asp:ListItem>United Kingdom</asp:ListItem>
                    <asp:ListItem>United States</asp:ListItem>
                    <asp:ListItem>United States Minor Is.</asp:ListItem>
                    <asp:ListItem>Uruguay</asp:ListItem>
                    <asp:ListItem>Uzbekistan</asp:ListItem>
                    <asp:ListItem>Vanuatu</asp:ListItem>
                    <asp:ListItem>Venezuela</asp:ListItem>
                    <asp:ListItem>Viet Nam</asp:ListItem>
                    <asp:ListItem>Virgin Islands (British)</asp:ListItem>
                    <asp:ListItem>Virgin Islands (U.S.)</asp:ListItem>
                    <asp:ListItem>Wallis And Futuna Islands</asp:ListItem>
                    <asp:ListItem>Western Sahara</asp:ListItem>
                    <asp:ListItem>Yemen</asp:ListItem>
                    <asp:ListItem>Yugoslavia</asp:ListItem>
                    <asp:ListItem>Zaire</asp:ListItem>
                    <asp:ListItem>Zambia</asp:ListItem>
                    <asp:ListItem>Zimbabwe</asp:ListItem> 
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>CompetitorGender</td>
                <td>
                     <asp:DropDownList ID="DropDownList1" Class="form-control" runat="server">
                        <asp:ListItem>Male</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>
                        <asp:ListItem>Decline to specify</asp:ListItem>
                        
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>Competitor Contact No</td>
                <td>
                    <asp:TextBox ID="TextBox9" Class="form-control" runat="server"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TextBox9" Display="Dynamic" ErrorMessage="Only numbers are allowed" SetFocusOnError="True" ValidationExpression="^[0-9]*$">Only numbers are allowed</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>Competitor Website</td>
                <td>
                    <asp:TextBox ID="TextBox10" Class="form-control" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Competitor Photo</td>
                <td>
                    <asp:FileUpload ID="FileUpload1" class="btn btn-outline-light" role="button" runat="server" />
                </td>
            </tr>
            <tr>
                <td>Game ID</td>
                <td>
                    <asp:TextBox ID="TextBox11"  Class="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox11" Display="Dynamic" ErrorMessage="Competitor Has to participate in at least one game" SetFocusOnError="True">Competitor Has to participate in at least one game</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    <asp:Button ID="Button1" Class="btn btn-dark btn-lg " runat="server" OnClick="Button1_Click" Text="Submit" />
                </td>
            </tr>
        <asp:GridView ID="GridView1" runat="server" class="CompetitorEdit table table-hover table-dark" AutoGenerateColumns="False"  DataKeyNames="Competitor_ID"  >
            <Columns>
                <asp:BoundField DataField="Competitor_ID" HeaderText="Competitor ID" SortExpression="Competitor_ID" ReadOnly="True" />
                <asp:BoundField DataField="Competitor_Salutation" HeaderText="Salutation" SortExpression="Competitor_Salutation" />
                <asp:BoundField DataField="Competitor_Name" HeaderText="Name" SortExpression="Competitor_Name" />
                <asp:BoundField DataField="Competitor_DoB" HeaderText="DoB" SortExpression="Competitor_DoB" />
                <asp:BoundField DataField="Competitor_Email" HeaderText="Email" SortExpression="Competitor_Email" />
                <asp:BoundField DataField="Competitor_Description" HeaderText="Description" SortExpression="Competitor_Description" />
                <asp:BoundField DataField="Competitor_Gender" HeaderText="Gender" SortExpression="Competitor_Gender" />
                <asp:BoundField DataField="Competitor_ContactNo" HeaderText="ContactNo" SortExpression="Competitor_ContactNo" />
                <asp:BoundField DataField="Competitor_Website" HeaderText="Website" SortExpression="Competitor_Website" />
                <asp:BoundField DataField="Competitor_Country" HeaderText="Country" SortExpression="Competitor_Country" />
                <asp:TemplateField HeaderText="Competitor_Photo">
                <ItemTemplate>
                <asp:Image ID="Image1" runat="server" Height="100px" Width="100px"
                    ImageUrl='<%# "data:Image/png;base64,"
                    + Convert.ToBase64String((byte[])Eval("Competitor_Photo")) %>' />
                </ItemTemplate>
                </asp:TemplateField>
               
                
            </Columns>
        </asp:GridView>
        </table>
        <p>
                    &nbsp;</p>
        <asp:HyperLink ID="HyperLink1" class="btn btn-dark  m-3" runat="server" NavigateUrl="~/CompetitorEdit.aspx">Edit / Delete Competitor Data</asp:HyperLink>
        <p>
            &nbsp;</p>
    </form>
    <script src="Scripts/jquery-3.4.1.min.js"></script>
    <script src="Scripts/popper.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</body>
</html>
