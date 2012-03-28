<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="headeradmin.jsp" %>

<div id="contents">
    
    <h1>Varastopaikat</h1>
    
    <table class="noborder">
        <tr>
            <td><b>Nimi</b></td>
        </tr>
        <c:forEach var="storage" items="${storages}">
            <tr>
                <td>
                    ${storage.name}
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
<%@include file="footer.jsp" %>