<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="headeradmin.jsp" %>
<div id="contents">

    <h2>Hallitse aineita</h2>
    <a href="<c:out value="${pageContext.servletContext.contextPath}" />/addSubstance">Lisää uusi lääkeaine</a><br />
    <a href="<c:out value="${pageContext.servletContext.contextPath}" />/substanceView">Muokkaa lääkeaineiden tietoja</a><br />
    <a href="<c:out value="${pageContext.servletContext.contextPath}" />/historyView">Historia</a>
</div>
<%@include file="footer.jsp" %>
