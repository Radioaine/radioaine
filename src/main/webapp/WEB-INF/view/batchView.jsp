<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="headerstorage.jsp" %>

<div id="contents">
    <h1>Erä ${batch.batchNumber}</h1>

    <table id="reunaton">

        <tr>
            <td>Aine</td>
            <td>${batch.substance.name}</a></td>
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
            <td>
                <c:choose>
                    <c:when test="${batch.qualityCheck==1}">
                        Ok
                    </c:when>
                    <c:when test="${batch.qualityCheck==2}">
                        Hylätty
                    </c:when>
                    <c:otherwise>
                        <form style="background-color: yellow" action="${pageContext.servletContext.contextPath}/doCheck/${batch.id}+${batch.substance.id}" method="POST">
                            <select name="qualityCheck">
                                <option value="1">Hyväksytty</option>
                                <option value="2">Hylätty</option>
                            </select>
                            <input type="submit" value="Kirjaa tulos">
                        </form>
                    </c:otherwise>
                </c:choose>
            </td>
        </tr>
        
        <c:forEach var="location" varStatus="i" items="${batch.storageLocations}">
            <c:choose>
                <c:when test="${batch.storageLocations[i.index][1] > 0}">
                    <tr>
                        <td>Jääkaapissa ${batch.storageLocations[i.index][0]} on ${location[1]} kappaletta</td>  
                    </tr>  
                </c:when>
            </c:choose>
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
    <form action="${pageContext.servletContext.contextPath}/updateBatch/${batch.id}" method="POST">  
        <input type="submit" value="Muokkaa erän tietoja">
    </form>    
</div>

<%@include file="footer.jsp" %>