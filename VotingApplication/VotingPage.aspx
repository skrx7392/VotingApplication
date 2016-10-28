<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VotingPage.aspx.cs" Inherits="VotingApplication.VotingPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Vote</title>
    <meta name="description" content="The description of my page" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
</head>
<body style="margin:0 auto; width:1000px">
    <div>
        <h2>Please cast your vote!</h2>
    </div>
    <form id="form1" runat="server">
        <asp:Label Text="Email: " runat="server"> </asp:Label>
        <asp:TextBox ID="email" runat="server" ></asp:TextBox>
        <asp:RequiredFieldValidator ID="emailrequired" runat="server"
            ControlToValidate="email"
            ErrorMessage="Email is a required field!"
            ForeColor="Red">
        </asp:RequiredFieldValidator>
        <br /> <br />
    <div>
        <asp:GridView runat="server" ID="gvImages" AutoGenerateColumns="False" DataSourceID="sqldataImages" CssClass="Gridview" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" OnRowCommand="gvImages_RowCommand">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="CandidateName" HeaderText="Candidate Name" SortExpression="CandidateName" />
                <asp:ImageField DataImageUrlField="PhotoFilePath" HeaderText="Photo"  ControlStyle-Width="200" ControlStyle-Height="150">
<ControlStyle Height="150px" Width="200px"></ControlStyle>
                </asp:ImageField>
                <asp:ButtonField ButtonType="Button" Text="Vote">       
                </asp:ButtonField>
            </Columns>
            <FooterStyle BackColor="#CCCC99" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#F7F7DE" HorizontalAlign="Center" VerticalAlign="Middle"/>
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FBFBF2" />
            <SortedAscendingHeaderStyle BackColor="#848384" />
            <SortedDescendingCellStyle BackColor="#EAEAD3" />
            <SortedDescendingHeaderStyle BackColor="#575357" />
        </asp:GridView>
        <asp:SqlDataSource ID="sqldataImages" runat="server" ConnectionString="<%$ ConnectionStrings:VotingAppConnectionString %>" SelectCommand="SELECT [CandidateName], [PhotoFilePath] FROM [Candidates]"></asp:SqlDataSource>
    </div>
    </form>
    <script type = "text/javascript">
        function DisableButtons() {
            var inputs = document.getElementsByTagName("INPUT");
            for (var i in inputs) {
                if (inputs[i].type == "button" || inputs[i].type == "submit") {
                    inputs[i].disabled = true;
                }
            }
        }
        window.onbeforeunload = DisableButtons;
    </script>
</body>
</html>
