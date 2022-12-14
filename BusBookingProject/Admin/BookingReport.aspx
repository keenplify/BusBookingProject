<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="BookingReport.aspx.cs" Inherits="BusBookingProject.Admin.BookingReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" style="margin-top:6%">
        <asp:Panel ID="SearchPanel" runat="server" DefaultButton="submitSearchBtn" style="display: flex; max-width: 512px; margin-bottom: .25em; gap: .5em">
            <asp:TextBox type="search" runat="server" ID="txtKeyword" CssClass="form-control" placeholder="Search Booking Report"/>
            <asp:Button ID="submitSearchBtn" runat="server" OnClick="submitSearchBtn_Click" text="Search" CssClass="btn btn-primary" style="max-width: 158px"/>
        </asp:Panel>
        
        <asp:GridView ID="gdTicketReport" runat="server" EmptyDataText="No Record Found...." AutoGenerateColumns="False" AllowPaging="true" PageSize="20" CssClass=""
                    Width="100%" Font-Size="12" style="background:white" OnRowDeleting="gdTicketReport_RowDeleting">
                    <Columns>
                        <%--<asp:TemplateField HeaderText="Sr.No">
                            <ItemTemplate>
                                <%# Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </asp:TemplateField>--%>
                        <asp:BoundField HeaderText="No." DataField="BookingId" />
                        <asp:BoundField HeaderText="Bus Name" DataField="BusName" />
                         <asp:BoundField HeaderText="Passenger Name" DataField="PaxName" />
                        <asp:BoundField HeaderText="Email ID" DataField="Email" />
                         <asp:BoundField HeaderText="Contact No" DataField="Contact" />
                         <asp:BoundField HeaderText="Origin" DataField="Origin" />
                         <asp:BoundField HeaderText="Destination" DataField="Destination" />
                         <asp:BoundField HeaderText="Travel Date" DataField="TravelDate" />
                         <asp:BoundField HeaderText="Seat No" DataField="SeatNo" />
                         <asp:BoundField HeaderText="Fare" DataField="Fare" />
                        <asp:BoundField HeaderText="Booked By" DataField="BookedBy" />
                        <asp:ButtonField HeaderText="Actions" Text="Delete" ButtonType="Button" CommandName="delete" ControlStyle-CssClass="btn btn-danger"/>
                    </Columns>
                </asp:GridView>
    </div>
</asp:Content>
