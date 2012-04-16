<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="headerfront.jsp" %>

<div id="contents">
    <h2>${eluate.generators[0].substance.eluateName}</h2>
    <br>
    <table class="noborder">
        <tr>
            <td class="name">Käytetyt aineet</td>
            <td>
                <c:forEach var="generator" items="${eluate.generators}">
                    <a href="${pageContext.servletContext.contextPath}/substance/${generator.substance.id}">${generator.substance.name}</a>, 
                    <a href="${pageContext.servletContext.contextPath}/batch/${generator.id}">Erä ${generator.batchNumber}</a><br />
                </c:forEach>

                <c:forEach var="other" items="${eluate.others}">
                    <a href="${pageContext.servletContext.contextPath}/substance/${other.substance.id}">${other.substance.name}</a>, 
                    <a href="${pageContext.servletContext.contextPath}/batch/${other.id}">Erä ${other.batchNumber}</a><br />
                </c:forEach>
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
            <td>Varastopaikka</td>
            <td>
                <c:forEach var="storage" items="${storages}">
                    <c:if test="${storage.id == eluate.storageLocation}">
                        ${storage.name}
                    </c:if>
                </c:forEach>
            </td>
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

    <table class="noborder">
        <tr>
            <td class="editButton">
                <form action="${pageContext.servletContext.contextPath}/modifyEluate/${eluate.id}" method="GET">  
                    <input type="submit" value="Muokkaa" />
                </form>
            </td>
            <td>
                <input type="button" value="Palaa" onClick="parent.location = '${pageContext.servletContext.contextPath}/frontpage'" />
            </td>
            <td>
                <form action="${pageContext.servletContext.contextPath}/removeEluateRequest/${eluate.id}" method="GET">  
                    <input type="submit" value="Poista" />
                </form>
            </td>
        </tr>
    </table>

</div>


<%@include file="footer.jsp" %>