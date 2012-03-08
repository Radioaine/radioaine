<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<div id="contents">
    <h1>Tapahtumat</h1>
    <form action="${pageContext.servletContext.contextPath}/seekModify">
        <input type="submit" value="Näytä kaikki muutokset">
    </form>
                            
                     
    <c:forEach var="event" items="${events}">
        <p><fmt:formatDate value="${event.timestamp}" pattern="dd.MM.yyyy HH:mm:ss"/>
            ${event.info}   

            

    </c:forEach>
</div>

