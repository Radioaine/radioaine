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
            <td id="qualityCheck">
                <c:choose>
                    <c:when test="${batch.qualityCheck==1}">
                        Hyväksytty
                    </c:when>
                    <c:when test="${batch.qualityCheck==2}">
                        <p style="background-color: red">Hylätty</p>
                    </c:when>
                    <c:otherwise>
                        <form style="background-color: yellow" action="${pageContext.servletContext.contextPath}/doCheck/${batch.id}+0" method="POST">
                            <select name="qualityCheck">
                                <option value="1">Hyväksytty</option>
                                <option value="2">Hylätty</option>
                            </select>
                            <input type="text" name="sig" size="3" />
                            <input type="submit" value="Kirjaa tulos" />
                        </form>
                    </c:otherwise>
                </c:choose>
            </td>
        </tr>

        <c:forEach var="location" varStatus="i" items="${batch.storageLocations}">
            <c:choose>
                <c:when test="${batch.storageLocations[i.index][1] > 0}">
                    <tr>
                        <td>${storages[(batch.storageLocations[i.index][0]-1)].name}</td>
                        <td>${location[1]} kpl</td>
                    </tr>  
                </c:when>
            </c:choose>
        </c:forEach>
        <tr>
            <td>Kommentit</td>
            <td>${batch.note}</td>
        </tr>
    </table>
    <form action="${pageContext.servletContext.contextPath}/removeFromBatch/${batch.id}" method="POST">
        <table>
            <tr><td></td><td>Poistettava määrä</td></tr>
            <c:forEach var="location" varStatus="i" items="${batch.storageLocations}">
                <c:choose>
                    <c:when test="${batch.storageLocations[i.index][1] > 0}">
                        <tr>
                            <td>${storages[(batch.storageLocations[i.index][0]-1)].name}</td>
                            <td><input value="0" required pattern="[0-9]{1,3}" type="number" name="amounts" /></td><br />
                        </tr>
                    </c:when>
                </c:choose>
            </c:forEach>
            <tr><td>Poiston syy:</td><td><input required type="text" name="reason" /></td></tr>
            <tr><td>Nimikirjaimet:</td><td><input required type="text" name="remover" /></td></tr>
        </table>
        <input type="submit" value="Poista" />
    </form>
</div>

