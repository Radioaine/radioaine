<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="headeradmin.jsp" %>

<div id="contents">
    <table class="noborder">
        <c:forEach var="event" items="${events}">
                    <tr>
                        <td style="padding-bottom: 1em;">${event.info}</td>
                    </tr>
        </c:forEach>
    </table>
</div>

<%@include file="footer.jsp" %>
