<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="header.jsp" %>

<div id="sisalto">
    <h1>Erä 2342464682112</h1>

    <table id="reunaton">
        <tr>
            <td>Aine</td>
            <td><a href="product">Nanocollioidi</a></td>
        </tr>

        <tr>
            <td>Jäljellä</td>
            <td>2kpl</td>
        </tr>

        <tr>
            <td>Pakkauskoko</td>
            <td>30ml</td>
        </tr>

        <tr>
            <td>Vahvuus</td>
            <td>23</td>
        </tr>

        <tr>
            <td>Vanhenee</td>
            <td></td>
        </tr>

        <tr>
            <td>Valmistaja</td>
            <td></td>
        </tr>

        <tr>
            <td>Tukkuliike</td>
            <td></td>
        </tr>

        <tr>
            <td>Laadunvarmistus</td>
            <td>Suoritettu (MK)</td>
        </tr>

    </table>
    <br>
    <h1>Tapahtumat</h1>
    <table id="listaus">
        <tr>
            <th> </th>
            <th>Tapahtuma</th>
            <th>Tekijä</th>
            <th>Tietoja</th>
        </tr>

        <tr>
            <td>v</td>
            <td>Siirretty Jääkaappiin 1 2kpl</td>
            <td> </td>
            <td> </td>
        <tr>

        <tr>
            <td>v</td>
            <td>Siirretty Jääkaappiin Jääkaappi 2 kpl</td>
            <td> </td>
            <td> </td>
        <tr>

        <tr>
            <td>v</td>
            <td>poistettu 1kpl</td>
            <td>LT</td>
            <td>Tippui lattialle</td>
        <tr>

        <tr>
            <td></td>
            <td>Valmistettu</td>
            <td>LT</td>
            <td></td>
        <tr>
    </table>

    <br>

    <form name="input" action="html_form_action.asp" method="get">
        Nimikirjaimet: <input type="text" name="user" />
        <input type="submit" value="Poista" />
    </form>
</div>

<%@include file="footer.jsp" %>