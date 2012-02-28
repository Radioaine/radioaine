<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="header.jsp" %>

<div id="sisalto">
    <h1>Erä ${batch.batchNumber}</h1>

    <table id="reunaton">

        <tr>
            <td>Aine</td>
            <td>${batch.substance}</a></td>
        </tr>
        <tr>
            <td>Jäljellä</td>
            <td>${batch.amount}kpl</td>
        </tr>
        <tr>
            <td>Pakkauskoko</td>
            <td>${batch.substanceVolume}ml</td>
        </tr>
        <tr>
            <td>Vahvuus</td>
            <td>${batch.strength}</td>
        </tr>
        <tr>
            <td>Saapunut</td>
            <td><fmt:formatDate value="${batch.arrivalDate}" pattern="dd.MM.yyyy"/></td>
        </tr>
        <tr>
            <td>Vanhenee</td>
            <td><fmt:formatDate value="${batch.expDate}" pattern="dd.MM.yyyy"/></td>
        </tr>
        <tr>
            <td>Valmistaja</td>
            <td>${batch.manufacturer}</td>
        </tr>
        <tr>
            <td>Tukkuliike</td>
            <td>${batch.supplier}</td>
        </tr>
        <tr>
            <td>Laadunvarmistus</td>
            <td>Suoritettu (MK) ${batch.qualityCheck}</td>
        </tr>
        <c:forEach var="location" varStatus="i" items="${batch.storageLocations}">
            <tr>
                <td>Varastopaikassa ${location[0]} on ${location[1]} kappaletta </td>     
            </tr>  
        </c:forEach>
        <tr>
            <td>Kommentit</td>
            <td>${batch.note}</td>
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
    <br />
    <p>Poista erästä:</p>
    <form action="${pageContext.servletContext.contextPath}/batchDelete/${batch.id}" method="POST">
        Määrä: <input name="amount" type="number"/><br/>
        Nimi: <input name="name" type="text"/><br/>
        <input type="submit" value="Poista">
    </form>
    <form action="${pageContext.servletContext.contextPath}/updateBatch/${batch.id}" method="POST">  
        <input type="submit" value="Muokkaa erän tietoja">
    </form>    
</div>

<%@include file="footer.jsp" %>