<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="headerfront.jsp" %>

<div id="contents">
    <h2>Radiol‰‰kkeen ${radioMedicine.id} tiedot</h2>

    <table class="noborder">
        <tr>
            <td>K‰ytetyt aineet</td>
            <td>
                <br/>
                <c:forEach var="eluate" items="${radioMedicine.eluates}">
                    <a href="${pageContext.servletContext.contextPath}/eluate/${eluate.id}">Eluaatti ${eluate.id} TODO T‰h‰n eluaattiin k‰ytetyn (yhden) generaattorin eluaatin nimi</a><br/>
                </c:forEach>

                <c:forEach var="kit" items="${radioMedicine.kits}">
                    <a href="${pageContext.servletContext.contextPath}/substance/${kit.substance.id}">${kit.substance.name}</a>, 
                    <a href="${pageContext.servletContext.contextPath}/batch/${kit.id}">Er‰ ${kit.batchNumber}</a><br/>
                </c:forEach>

                <c:forEach var="other" items="${radioMedicine.others}">
                    <a href="${pageContext.servletContext.contextPath}/substance/${other.substance.id}">${other.substance.name}</a>, 
                    <a href="${pageContext.servletContext.contextPath}/batch/${other.id}">Er‰ ${other.batchNumber}</a><br/>
                </c:forEach>
                    
                <br/>
            </td>
        </tr>
        <tr>
            <td class="name">Aktiivisuus</td>
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
            <td>Tilavuus</td>
            <td>${radioMedicine.volume} ml</td>
        </tr>
        <tr>
            <td>Varastopaikka</td>
            <td>${radioMedicine.storageLocation} TODO varastopaikan nimi</td>
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
    <br/>
    <form action="${pageContext.servletContext.contextPath}/modifyRadioMed/${radioMedicine.id}" method="GET">  
            <input type="submit" value="Muokkaa" />
    </form>
</div>


<%@include file="footer.jsp" %>