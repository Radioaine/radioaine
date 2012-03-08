<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="header.jsp" %>

<div id="contents">
    
    <h1>Kitit</h1>
    <table class="storageTable">
        <tr>
            <th>Aine</th>
            <th class="maara">Määrä</th>
            <th>Vanhimman päiväys</th>
            <th>Huom</th>
        </tr>

        <c:forEach var="substance" items="${substances}">
            <c:if test="${substance.type == '0'}">
                <tr>
                    <td><a href="substance/${substance.id}">${substance.name}</a></td>
                    <td class="maara">${substance.totalAmount}</td>
                    <td>${substance.oldestDate}</td>
                    <td></td>
                </tr>
            </c:if>
        </c:forEach>

    </table>

    <h1>Generaattorit</h1>
    <table class="storageTable">
        <tr>
            <th>Aine</th>
            <th class="maara">Määrä</th>
            <th>Vanhimman päiväys</th>
            <th>Huom</th>
        </tr>

        <c:forEach var="substance" items="${substances}">
            <c:if test="${substance.type == '1'}">
                <tr>
                    <td><a href="substance/${substance.id}">${substance.name}</a></td>
                    <td class="maara">${substance.totalAmount}</td>
                    <td>${substance.oldestDate}</td>
                    <td></td>
                </tr>
            </c:if>
        </c:forEach>
    </table>

    <h1>Muut</h1>      
    <table class="storageTable">
        <tr>
            <th>Aine</th>
            <th class="maara">Määrä</th>
            <th>Vanhimman päiväys</th>
            <th>Huom</th>
        </tr>

        <c:forEach var="substance" items="${substances}">
            <c:if test="${substance.type == '2'}">
                <tr>
                    <td><a href="substance/${substance.id}">${substance.name}</a></td>
                    <td class="maara">${substance.totalAmount}</td>
                    <td>${substance.oldestDate}</td>
                    <td></td>
                </tr>
            </c:if>
        </c:forEach>
    </table>
    <br/>
    <a href="generateTestDB">Generoi testitietokanta</a>
</div>
<%@include file="footer.jsp" %>