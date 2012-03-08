<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="header.jsp" %>
<div id="contents">

    <h1>Hallitse aineita</h1>
    <a href="<c:out value="${pageContext.servletContext.contextPath}" />/addSubstance">Lisää uusi lääkeaine</a><br />
    <a href="<c:out value="${pageContext.servletContext.contextPath}" />/substanceView">Muokkaa lääkeaineiden tietoja</a>
</div>
<%@include file="footer.jsp" %>
