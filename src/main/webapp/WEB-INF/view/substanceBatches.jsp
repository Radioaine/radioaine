<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>



<div id="contents">
    
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
            <tr id="${batch.id}">
                <td><a href="<c:out value="${pageContext.servletContext.contextPath}" />/batch/${batch.id}">${batch.batchNumber}</a></td>
                <td>${batch.amount}</td>
                <td>20</td>
                <td>${batch.strength}</td>
                <td>${batch.expDate}</td>
                <td>${substance.manufacturer}</td>
                <td>${substance.supplier}</td>
                <td id="qualityCheck">
                    <c:choose>
                    <c:when test="${batch.qualityCheck==1}">
                        Hyväksytty
                    </c:when>
                    <c:when test="${batch.qualityCheck==2}">
                        <p style="background-color: red">Hylätty</p>
                    </c:when>
                    <c:otherwise>
                        <form style="background-color: yellow" action="${pageContext.servletContext.contextPath}/doCheck/${batch.id}+${substance.id}" method="POST">
                            <select name="qualityCheck">
                                <option value="1">Hyväksytty</option>
                                <option value="2">Hylätty</option>
                            </select>
                            <input type="submit" value="Kirjaa tulos">
                        </form>
                    </c:otherwise>
                </c:choose>
                </td>
                <td>${batch.note}</td>
            </tr>
        </c:forEach>
    </table>
</div>
<%@include file="footer.jsp" %>