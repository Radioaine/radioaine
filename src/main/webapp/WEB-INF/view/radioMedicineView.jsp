<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="headerfront.jsp" %>

<div id="contents">
    <h2>Radiol��ke ${radioMedicine.kits[0].substance.name}</h2>

    <table class="noborder">
        <tr>
            <td>K�ytetyt aineet</td>
            <td>
                <br/>
                <c:forEach var="eluate" items="${radioMedicine.eluates}">
                    <a href="${pageContext.servletContext.contextPath}/eluate/${eluate.id}">Klo <fmt:formatDate value="${eluate.date}" pattern="HH.mm"/> ${eluate.generators[0].substance.eluateName}</a><br/>
                </c:forEach>

                <c:forEach var="kit" items="${radioMedicine.kits}">
                    <a href="${pageContext.servletContext.contextPath}/substance/${kit.substance.id}">${kit.substance.name}</a>, 
                    <a href="${pageContext.servletContext.contextPath}/batch/${kit.id}">Er� ${kit.batchNumber}</a><br/>
                </c:forEach>

                <c:forEach var="other" items="${radioMedicine.others}">
                    <a href="${pageContext.servletContext.contextPath}/substance/${other.substance.id}">${other.substance.name}</a>, 
                    <a href="${pageContext.servletContext.contextPath}/batch/${other.id}">Er� ${other.batchNumber}</a><br/>
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
                    <c:when test="${radioMedicine.unit == 1}">
                        kBq
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
            <td>
                <c:forEach var="storage" items="${storages}">
                    <c:if test="${storage.id == radioMedicine.storageLocation}">
                        ${storage.name}
                    </c:if>
                </c:forEach>
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
            <td>Tekij�</td>
            <td>${radioMedicine.signature}</td>
        </tr>

    </table>
    <br/>
    <table class="noborder">
        <tr>
            <td class="editButton">
                <form action="${pageContext.servletContext.contextPath}/modifyRadioMed/${radioMedicine.id}" method="GET">  
                    <input type="submit" value="Muokkaa" />
                </form>
            </td>
            <td class="deleteButton">
                <form action="${pageContext.servletContext.contextPath}/removeRadioMedRequest/${radioMedicine.id}" method="GET">  
                    <input type="submit" value="Poista" />
                </form>
            </td>
            <td>
                <input type="button" value="Palaa" onClick="parent.location = '${pageContext.servletContext.contextPath}/frontpage'" />
            </td>
        </tr>
    </table>

</div>


<%@include file="footer.jsp" %>