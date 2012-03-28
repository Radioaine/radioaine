<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<div id="contents">
    <h1>Saapuneet</h1>
    <c:forEach var="event" items="${raport1}">
        <p><fmt:formatDate value="${event.timestamp}" pattern="dd.MM.yyyy HH:mm:ss"/>
            ${event.info}   
    </c:forEach>
</div>

