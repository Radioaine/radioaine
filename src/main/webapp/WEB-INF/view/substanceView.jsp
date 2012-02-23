<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="header.jsp" %>

<div id="sisalto">
    
    <h1>Lääkeaineet</h1>
    
    <table id="listaus">
        <c:forEach var="substance" items="${substances}">
            <tr>
                <td>
                    <a href="<c:out value="${pageContext.servletContext.contextPath}" />/substance/${substance.id}">${substance.name}</a>
                </td>
            </tr>
        </c:forEach>
    </table>
    <br>
    <button type="button">Käytä valmistukseen</button>
</div>
<%@include file="footer.jsp" %>