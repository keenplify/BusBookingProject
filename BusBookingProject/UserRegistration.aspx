<%@ Page Title="" Language="C#" MasterPageFile="~/BusBookingMaster.Master" AutoEventWireup="true" CodeBehind="UserRegistration.aspx.cs" Inherits="BusBookingProject.UserRegistration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container" style="margin-top: 5%">
    </div>
    <div class="row centered-form" style="margin-top: 5%">
        <div class="col-lg-8 col-sm-8 col-md-2 col-sm-offset-2 col-md-offset-2">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">New User Registration</h3>
                </div>
                <div class="panel-body">
                    <asp:ValidationSummary ID="vsRegister" runat="server" CssClass="alert alert-danger" ShowSummary="true" ValidationGroup="vgRegister" />
                    <div id="divMessage" runat="server" />
                    <div class="col-xs-6 col-sm-6 col-md-6">
                        <div class="form-group">
                            <asp:Label ID="lblFirstName" runat="server" Text="First Name" Font-Bold="true"></asp:Label>
                            <asp:TextBox ID="txtFirstName" runat="server" class="form-control input-sm floatlabel"/>
                             <asp:RequiredFieldValidator runat="server" ControlToValidate="txtFirstName" Display="None" ID="rfvFirstName" ValidationGroup="vgRegister"
                                    CssClass="text-danger" ErrorMessage="First Name is required." /><br />
                        </div>
                       <div class="form-group">
                            <asp:Label ID="lblUserName" runat="server" Text="Mobile No/User Name" Font-Bold="true"></asp:Label>
                            <asp:TextBox ID="txtMobileNo" runat="server" class="form-control input-sm floatlabel" />
                             <asp:RequiredFieldValidator runat="server" ControlToValidate="txtMobileNo" Display="None" ID="rfVMobileNo" ValidationGroup="vgRegister"
                                    CssClass="text-danger" ErrorMessage="Mobile No is required." /><br />
                        </div>
                    </div>
                    <div class="col-xs-6 col-sm-6 col-md-6">
                        <div class="form-group">
                            <asp:Label ID="lblLastName" runat="server" Text="Last Name" Font-Bold="true"></asp:Label>
                            <asp:TextBox ID="txtLastName" runat="server" class="form-control input-sm floatlabel"/>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtLastName" Display="None" ID="rfVLastName" ValidationGroup="vgRegister"
                                    CssClass="text-danger" ErrorMessage="Last Name is required." /><br />
                        </div>
                        
                        <div class="form-group">
                            <asp:Label ID="lblPassword" runat="server" Text="Password" Font-Bold="true"></asp:Label>
                            <asp:TextBox ID="txtPassword" runat="server" class="form-control input-sm floatlabel" TextMode="Password" />
                             <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPassword" Display="None" ID="rfvPassword" ValidationGroup="vgRegister"
                                    CssClass="text-danger" ErrorMessage="Password  is required." /><br />
                        </div>
                    </div>
                    <div class="col-xs-6 col-sm-6 col-md-6">
                        <div class="form-group">
                            <asp:Label ID="lblEmail" runat="server" Text="Email ID" Font-Bold="true"></asp:Label>
                            <asp:TextBox ID="txtEmailID" runat="server" class="form-control input-sm floatlabel" />
                             <asp:RequiredFieldValidator runat="server" ControlToValidate="txtEmailID" Display="None" ID="rfVEmail" ValidationGroup="vgRegister"
                                    CssClass="text-danger" ErrorMessage="Email Id is required." /><br />
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblAddress" runat="server" Text="Address" Font-Bold="true"></asp:Label>
                            <asp:TextBox runat="server" ID="txtAddress" class="form-control input-sm" />
                             <asp:RequiredFieldValidator runat="server" ControlToValidate="txtAddress" Display="None" ID="rfVAddress" ValidationGroup="vgRegister"
                                    CssClass="text-danger" ErrorMessage="Address  is required." /><br />
                        </div>
                    </div>
                    <div class="col-xs-6 col-sm-6 col-md-6">
                        <div class="form-group">
                            <asp:Label ID="lblCity" runat="server" Text="City" Font-Bold="true"></asp:Label>
                            <asp:TextBox runat="server" ID="txtCity" class="form-control input-sm" />
                             <asp:RequiredFieldValidator runat="server" ControlToValidate="txtCity" Display="None" ID="rfVCity" ValidationGroup="vgRegister"
                                    CssClass="text-danger" ErrorMessage="City Name is required." /><br />
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblPinCode" runat="server" Text="Postalcode" Font-Bold="True"></asp:Label>
                            <asp:TextBox ID="txtPincode" runat="server" class="form-control input-sm floatlabel" />
                             <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPincode" Display="None" ID="rfvPinCode" ValidationGroup="vgRegister"
                                    CssClass="text-danger" ErrorMessage="Pin code is required." /><br />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-12" style="min-height: 5em">
                        <div class="form-group">
                            <div style="display: flex; justify-content:center; align-items: center; gap:.25em; color: black; font-size: 1.1rem">
                                <asp:CheckBox runat="server" ID="chkTOS" style="display: flex" />
                                I Agree to this website's <button type="button" class="btn btn-link btn-sm" style="padding: 0" data-toggle="modal" data-target="#flipFlop">Terms and Conditions</button>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-6 col-sm-6 col-md-6">
                        <div class="form-group">
                            <asp:Button ID="btnSave" runat="server" Text="Register" OnClick="btnSave_Click" class="btn btn-info " ValidationGroup="vgRegister"  CausesValidation="True" ViewStateMode="Inherit" />
                        </div>
                    </div>
                    <div class="col-xs-6 col-sm-6 col-md-6">
                        <div class="form-group">
                            <a href="Login.aspx" class="btn btn-info btn-block">Login</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
        <!-- The modal -->
    <div class="modal fade" id="flipFlop" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
             <div class="modal-content">
                 <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title" id="modalLabel">Terms and Conditions</h4>
                </div>
                <div class="modal-body">
                    Modal content...
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
