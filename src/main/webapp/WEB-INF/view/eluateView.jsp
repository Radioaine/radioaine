<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="headerstorage.jsp" %>

<div id="contents">
    <h1>Eluaatti</h1>
    <c:forEach var="generator" items="${eluate.generators}">
        <b>${generator.substance.name}</b><br>
    </c:forEach>

    <c:forEach var="other" items="${eluate.others}">
        <b>${other.substance.name}</b><br>
    </c:forEach>


    <br>
    <table>

        <tr>
            <td>Aktiivisuus</td>
            <td>${eluate.strength}</a></td>
        </tr>
        <tr>
            <td>Tilavuus</td>
            <td>${eluate.volume} ml</td>
        </tr>
        <tr>
            <td>Vahvuus</td>
            <td>${eluate.strength} GBq</td>
        </tr>
        <tr>
            <td>Luotu</td>
            <td><fmt:formatDate value="${eluate.date}" pattern="dd.MM.yyyy HH:mm"/></td>
        </tr>
        <tr>
            <td>Kommentit</td>
            <td>${eluate.note}</td>
        </tr>
        <tr>
            <td>Tekijä</td>
            <td>${eluate.signature}</td>
        </tr>

    </table>
</div>


<%@include file="footer.jsp" %>