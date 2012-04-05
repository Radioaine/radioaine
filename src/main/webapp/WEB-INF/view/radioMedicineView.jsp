<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="headerstorage.jsp" %>

<div id="contents">
    <h1>Radiol‰‰ke ${radioMedicine.id}</h1>
    <c:forEach var="eluate" items="${radioMedicine.eluates}">
        <b>Eluaatti ${eluate.id}</b><br>
    </c:forEach>

    <c:forEach var="kit" items="${radioMedicine.kits}">
        <b>${kit.substance.name}</b><br>
    </c:forEach>

    <c:forEach var="other" items="${radioMedicine.others}">
        <b>${other.substance.name}</b><br>
    </c:forEach>


    <br>
    <table>

        <tr>
            <td>Aktiivisuus</td>
            <td>${radioMedicine.strength}</a></td>
        </tr>
        <tr>
            <td>Tilavuus</td>
            <td>${radioMedicine.volume} ml</td>
        </tr>
        <tr>
            <td>Vahvuus</td>
            <td>${radioMedicine.strength}
                <c:choose>
                    <c:when test="${radioMedicine.unit == 0}">
                        GBq
                    </c:when>
                    <c:otherwise>
                        MBq
                    </c:otherwise>
                </c:choose>
            </td>
        </tr>
        <tr>
            <td>Luotu</td>
            <td><fmt:formatDate value="${radioMedicine.date}" pattern="dd.MM.yyyy HH:mm"/></td>
        </tr>
        <tr>
            <td>Kommentit</td>
            <td>${radioMedicine.note}</td>
        </tr>
        <tr>
            <td>Tekij‰</td>
            <td>${radioMedicine.signature}</td>
        </tr>

    </table>
</div>


<%@include file="footer.jsp" %>