<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="header.jsp" %>

<div id="sisalto">
    
    <h1>${substance.name}</h1>
    
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
        <c:forEach var="batch" items="${substanceBatches}">
            <tr>
                <td><a href="<c:out value="${pageContext.servletContext.contextPath}" />/batch/${batch.id}">${batch.batchNumber}</a></td>
                <td>${batch.amount}</td>
                <td>${batch.substanceVolume}</td>
                <td>${batch.strength}</td>
                <td>${batch.expDate}</td>
                <td>${substance.manufacturer}</td>
                <td>${substance.supplier}</td>
                <td>${batch.qualityCheck}</td>
                <td>${batch.note}</td>
            </tr>
        </c:forEach>
    </table>
    <br>
    <button type="button">Käytä valmistukseen</button>
</div>
<%@include file="footer.jsp" %>