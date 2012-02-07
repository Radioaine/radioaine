<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="header.jsp" %>

<div id="sisalto">
    <h1>Kitit</h1>
    <table id="listaus">
        <tr>
            <th>Aine</th>
            <th class="maara">Määrä</th>
            <th>Vanhimman päiväys</th>
            <th>Huom</th>
        </tr>
        <tr>
            <td><a href="product">Nanocollioidi</a></td>
            <td class="maara">4</td>
            <td>1.7.2012</td>
            <td></td>
        </tr>
        <tr>
            <td><a href="product">Lääke2</a></td>
            <td class="maara">8</td>
            <td>1.7.2012</td>
            <td></td>
        </tr>
        <tr>
            <td><a href="product">Lääke3</a></td>
            <td class="maara">0</td>
            <td>1.7.2012</td>
            <td class="red">LOPPU</td>
        </tr>
        <tr>
            <td><a href="product">Lääke4</a></td>
            <td class="maara">6</td>
            <td>1.7.2012</td>
            <td></td>
        </tr>
        <tr>
            <td><a href="product">Lääke5</a></td>
            <td class="maara">2</td>
            <td>1.7.2012</td>
            <td class="warning">VÄHISSÄ</td>
        </tr>
    </table>

    <h1>Generaattorit</h1>
    <table id="listaus">
        <tr>
            <th>Aine</th>
            <th class="product">Määrä</th>
            <th>Vanhimman päiväys</th>
            <th>Huom</th>
        </tr>
        <tr>
            <td><a href="product">Molybdeeni 99</a></td>
            <td class="maara">4</td>
            <td>1.7.2012</td>
            <td></td>
        </tr>
    </table>

    <h1>Muut</h1>
    <table id="listaus">
        <tr>
            <th>Aine</th>
            <th class="maara">Määrä</th>
            <th>Vanhimman päiväys</th>
            <th>Huom</th>
        </tr>
        <tr>
            <td><a href="product">Keittosuolaliuos</a></td>
            <td class="maara">4</td>
            <td>1.7.2012</td>
            <td></td>
        </tr>
        <tr>
            <td><a href="product">Lääke2</a></td>
            <td class="maara">8</td>
            <td>1.7.2012</td>
            <td></td>
        </tr>
    </table>
</div>
<%@include file="footer.jsp" %>
