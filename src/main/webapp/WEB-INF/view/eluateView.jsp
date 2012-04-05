<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="headerfront.jsp" %>

<div id="contents">
    <h2>Eluaatin tiedot</h2>
    
    <table class="noborder">
        <tr>
            <td class="name">Käytetyt aineet</td>
            <td>
                <br/>
                <c:forEach var="generator" items="${eluate.generators}">
                    ${generator.substance.name}<br>
                </c:forEach>
                    
                <c:forEach var="other" items="${eluate.others}">
                    ${other.substance.name}<br>
                </c:forEach>
                <br/>
            </td>
        </tr>
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
            <td><fmt:formatDate value="${eluate.date}" pattern="HH:mm / dd.MM.yyyy"/></td>
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
    <br />
    <form action="${pageContext.servletContext.contextPath}/modifyEluate/${eluate.id}" method="GET">  
            <input type="submit" value="Muokkaa" />&nbsp; &nbsp;
            <input type="button" value="Peruuta" onClick="parent.location = '${pageContext.servletContext.contextPath}/frontpage'" />
    </form>
</div>


<%@include file="footer.jsp" %>