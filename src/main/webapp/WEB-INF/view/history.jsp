<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<h1>Tapahtumat</h1>
<table id="listaus">
    <c:forEach var="event" items="${events}">
        <tr>
            <td><fmt:formatDate value="${event.timestamp}" pattern="dd.MM.yyyy HH:ss"/></td>
            <td>${event.happening}</td>
        </tr>
    </c:forEach>
    <tr>
        <th>Eluaatti</th>
        <th>Tehty</th>
        <th>Tekij�</th>
        <th>Aktiivisuus</th>
    </tr>
    <tr>
        <td>Keittosuolaliuos</a></td>
        <td>1.7.2012 13.07 (6 h sitten)</td>
        <td>RM</td>
        <td>2.2</td>
    </tr>
    <tr>
        <td>L��ke2</a></td>
        <td>1.7.2012 14.07 (5 h sitten)</td>
        <td>KH</td>
        <td>8.9</td>
    </tr>
</table>

