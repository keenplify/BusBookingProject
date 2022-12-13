<%@ Page Title="" Language="C#" MasterPageFile="~/BusBookingMaster.Master" AutoEventWireup="true" CodeBehind="PassengerDetailsInfo.aspx.cs" Inherits="BusBookingProject.PassengerDetailsInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/imask/6.4.3/imask.min.js" integrity="sha512-yJ3vm1HmQtcgeMtbUYCp7PuTLyjU+ffCnVNTuE1Uccv1BmkoaJIXt1EjBVGnscjCILc62hTJJJ2rJJBTcw8RjQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script>
        document.addEventListener('DOMContentLoaded', () => {
            IMask(document.getElementById('ContentPlaceHolder1_txtCode'), { mask: '0000' });
            IMask(document.getElementById('ContentPlaceHolder1_txtCardNo'), { mask: '0000000000000000' });
        }, false);
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" style="margin-top: 8%">
        <asp:GridView ID="gdPassengerDetails" runat="server" ShowFooter="true" AutoGenerateColumns="false" Width="100%" style="background-color: white">
            <Columns>
                <asp:BoundField DataField="RowNumber" HeaderText="Row Number" />
                <asp:TemplateField HeaderText="First Name">
                    <ItemTemplate>
                        <asp:TextBox ID="txtFName" runat="server" CssClass="form-control"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Last Name">
                    <ItemTemplate>
                        <asp:TextBox ID="txtLName" runat="server" CssClass="form-control"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Email">
                    <ItemTemplate>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Contact">
                    <ItemTemplate>
                        <asp:TextBox ID="txtContact" runat="server" CssClass="form-control"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="City">
                    <ItemTemplate>
                        <asp:TextBox ID="txtCity" runat="server" CssClass="form-control"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <FooterStyle HorizontalAlign="Right" />
                    <FooterTemplate>
                        <asp:Button ID="ButtonAdd" runat="server" Style="color: red" Text="Add New Passanger Details"
                            OnClick="ButtonAdd_Click" />
                    </FooterTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

        <asp:Button ID="btnConirmBooking" runat="server" CssClass="btn btn-success" Style="width: auto; margin-top: 2%" Text="Confirm Booking"
            OnClick="btnConirmBooking_Click" ClientIDMode="Static" />

        <div class="row" id="paymentMode" runat="server">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Card Details For Payment</h3>
                </div>
                <div class="panel-body">
                    <asp:ValidationSummary ID="vsRegister" runat="server" CssClass="alert alert-danger" ShowSummary="true" ValidationGroup="vgRegister" />
                    <div id="divMessage" runat="server" />
                    <div class="col-xs-6 col-sm-6 col-md-6">
                        <div class="form-group">
                            <asp:Label ID="lblCardType" runat="server" Text="Select Your Card" Font-Bold="true"></asp:Label>
                            <asp:DropDownList ID="ddlCardType" runat="server" class="form-control input-sm floatlabel">
                                <asp:ListItem Value="0" Text="--Select Card--"></asp:ListItem>
                                <asp:ListItem Value="1" Text="Credit Card"></asp:ListItem>
                                <asp:ListItem Value="2" Text="Debit Card"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="ddlCardType" Display="None" ID="rfvFirstName" ValidationGroup="vgRegister"
                                CssClass="text-danger" ErrorMessage="Card Type is required." /><br />
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblBankName" runat="server" Text="Select Bank" Font-Bold="true"></asp:Label>
                            <asp:DropDownList ID="ddlBank" runat="server" class="form-control input-sm floatlabel">
                                <asp:ListItem Value="0" Text="--Select Bank--"></asp:ListItem>
                                <asp:ListItem Value="1" Text="BDO"></asp:ListItem>
                                <asp:ListItem Value="2" Text="BPI"></asp:ListItem>
                                <asp:ListItem Value="3" Text="Land Bank"></asp:ListItem>
                                <asp:ListItem Value="4" Text="MetroBank"></asp:ListItem>
                                <asp:ListItem Value="5" Text="PNB"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="ddlBank" Display="None" ID="rfVMobileNo" ValidationGroup="vgRegister"
                                CssClass="text-danger" ErrorMessage="Bank Name is required." /><br />
                        </div>
                    </div>
                    <div class="col-xs-6 col-sm-6 col-md-6">
                        <div class="form-group">
                            <asp:Label ID="lblLastName" runat="server" Text="3 Digit CVV Code" Font-Bold="true" for="txtCode"></asp:Label>
                            <asp:TextBox ID="txtCode" runat="server" class="form-control input-sm floatlabel" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtCode" Display="None" ID="rfVLastName" ValidationGroup="vgRegister"
                                CssClass="text-danger" ErrorMessage="CVV Code is required." /><br />
                        </div>

                        <div class="form-group">
                            <asp:Label ID="lblPassword" runat="server" Text="Card No" Font-Bold="true"></asp:Label>
                            <asp:TextBox ID="txtCardNo" runat="server" class="form-control input-sm floatlabel" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtCardNo" Display="None" ID="rfvPassword" ValidationGroup="vgRegister"
                                CssClass="text-danger" ErrorMessage="Card No  is required." /><br />
                        </div>
                    </div>
                    <div class="col-xs-6 col-sm-6 col-md-6">
                        <div class="form-group">
                            <asp:Button ID="btnSave" runat="server" Text="Make Payment" OnClick="btnSave_Click" class="btn btn-info" ValidationGroup="vgRegister" CausesValidation="True" ViewStateMode="Inherit" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
