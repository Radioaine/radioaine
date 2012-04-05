<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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
            <td>${eluate.strength}
                <c:choose>
                    <c:when test="${eluate.unit == 0}">
                        GBq
                    </c:when>
                    <c:otherwise>
                        MBq
                    </c:otherwise>
                </c:choose>
            </td>
        </tr>
        <tr>
            <td>Tilavuus</td>
            <td>${eluate.volume} ml</td>
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
    <form action="${pageContext.servletContext.contextPath}/modifyEluate/${eluate.id}" method="GET">  
            <input type="submit" value="Muokkaa erän tietoja" />
    </form>
</div>


<%@include file="footer.jsp" %>