<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="headeradmin.jsp" %>

<div id="contents">
    
    <h1>Lääkeaineet</h1>
    
    <table class="noborder">
        <c:forEach var="substance" items="${substances}">
            <tr>
                <td>
                    <a href="<c:out value="${pageContext.servletContext.contextPath}" />/updateSubstance/${substance.id}">${substance.name}</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
<%@include file="footer.jsp" %>