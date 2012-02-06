<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="header.jsp" %>

<div id="sisalto">
    <h1>Nanocollioidi</h1>
    <table id="listaus">
        <tr>
            <th>Eränumero</th>
            <th>Määrä</th>
            <th>Tilavuus</th>
            <th>Vahvuus</th>
            <th>Vanhenee</th>
            <th>Valmistaja</th>
            <th>Tukkuliike</th>
            <th>Laadunvarmistus</th>
            <th>Huom</th>
        </tr>
        <tr>
            <td><a href="era.html">2342464682112</a></td>
            <td>2</td>
            <td>20</td>
            <td>23</td>
            <td>12.2.2012</td>
            <td>Suomen lääkefirma</td>
            <td>Tukkuliike Tuohi</td>
            <td>ok</td>
            <td> </td>
        </tr>

        <tr>
            <td><a href="era.html">2342464256477</a></td>
            <td>2</td>
            <td>20</td>
            <td>23</td>
            <td>12.2.2012</td>
            <td>Suomen lääkefirma</td>
            <td>Tukkuliike Tuohi</td>
            <td>ok</td>
            <td> </td>
        </tr>

        <tr>
            <td><a href="era.html">2342464683456</a></td>
            <td>2</td>
            <td>20</td>
            <td>23</td>
            <td>12.2.2012</td>
            <td>Suomen lääkefirma</td>
            <td>Tukkuliike Tuohi</td>
            <td>ok</td>
            <td> </td>
        </tr>
    </table>
    <br>
    <button type="button">Käytä valmistukseen</button>
</div>
<%@include file="footer.jsp" %>