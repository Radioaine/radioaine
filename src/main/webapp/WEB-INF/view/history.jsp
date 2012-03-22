<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<div id="contents">
    <h1>Tapahtumat</h1>
    <form action="${pageContext.servletContext.contextPath}/seek">
        Etsi aineen nimellä <input type="text" name="searchString">
        <input type="submit" value="Näytä">
    </form>
                            
                     
    <c:forEach var="event" items="${results}">
        <p><fmt:formatDate value="${event.timestamp}" pattern="dd.MM.yyyy HH:mm:ss"/>
            ${event.info}   
    </c:forEach>
</div>

