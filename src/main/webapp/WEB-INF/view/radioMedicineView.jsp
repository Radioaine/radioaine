<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="headerfront.jsp" %>

<div id="contents">
    <h2>Radiol‰‰kkeen tiedot</h2>

    <table class="noborder">
        <tr>
            <td>K‰ytetyt aineet</td>
            <td>
                <br/>
                <c:forEach var="eluate" items="${radioMedicine.eluates}">
                    Eluaatti ${eluate.id} TODO t‰lle k‰ytetyn generaattorin eluaatin nimi<br/>
                </c:forEach>

                <c:forEach var="kit" items="${radioMedicine.kits}">
                    ${kit.substance.name}<br/>
                </c:forEach>

                <c:forEach var="other" items="${radioMedicine.others}">
                    ${other.substance.name}<br/>
                </c:forEach>
                <br/>
            </td>
        </tr>
        <tr>
            <td class="name">Aktiivisuus</td>
            <td>${radioMedicine.strength}</td>
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
            <td><fmt:formatDate value="${radioMedicine.date}" pattern="HH:mm / dd.MM.yyyy"/></td>
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