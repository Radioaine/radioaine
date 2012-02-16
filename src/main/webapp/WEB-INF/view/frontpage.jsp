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

        <c:forEach var="substance" items="${substances}">
            <tr>
                <td><a href="substance/${substance.id}">${substance.name}</a></td>
                <td class="maara">${substance.totalAmount}</td>
                <td>${substance.oldestDate}</td>
                <td></td>
            </tr>
        </c:forEach>

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
    <br/>
    <a href="generateDB">Generoi testitietokanta</a>
    
</div>
<%@include file="footer.jsp" %>