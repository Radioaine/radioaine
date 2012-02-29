<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<div id="sisalto">
<h1>Tapahtumat</h1>

    <c:forEach var="event" items="${events}">
        <p><fmt:formatDate value="${event.timestamp}" pattern="dd.MM.yyyy HH:ss"/>
            ${event.happening}</p>    
    </c:forEach>
</div>

