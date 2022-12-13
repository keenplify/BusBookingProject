<%@ Page Title="" Language="C#" MasterPageFile="~/Terminal/Terminal.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="BusBookingProject.Terminal.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   <script src="https://unpkg.com/html5-qrcode" type="text/javascript"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.21/lodash.min.js" integrity="sha512-WFN04846sdKMIP5LKNphMaWzU7YpMyCU245etK3g/2ARYbPK9Ub18eG+ljU96qKRCWh+quCY7yefSmlkQw1ANQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin-top: 5em; max-height: calc(100vh-8em); display: flex; justify-content: center">
        <div id="reader" width="600px" style="max-width: 600px; width:100%; background: white"></div>
        <asp:ScriptManager ID="ScriptManager1" EnablePageMethods="true" EnablePartialRendering="true" runat="server" />
        <script defer="defer">
            const scan = _.throttle((decodedText) => {
                console.log('sdas');
                PageMethods.ScanQRCode(decodedText, (data) => {
                    Toastify({
                        text: data
                    }).showToast();
                })
            }, 2500);

            let html5QrcodeScanner = new Html5QrcodeScanner(
                "reader",
                { fps: 10, qrbox: { width: 600, height: 600 } }
            );

            html5QrcodeScanner.render(scan);
        </script>
    </div>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
</asp:Content>
