<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="nav">
    <a href="<c:out value="${pageContext.servletContext.contextPath}" />/list">Etusivu</a><br>
    <a href="<c:out value="${pageContext.servletContext.contextPath}" />/createRadioDrug">Valmista l‰‰ke</a><br>
    <a href="<c:out value="${pageContext.servletContext.contextPath}" />/createEluate">Valmista eluaatti</a><br>
    <a href="<c:out value="${pageContext.servletContext.contextPath}" />/add">Lis‰‰ l‰hetys</a></br>
    <a href="<c:out value="${pageContext.servletContext.contextPath}" />/historyView">Historia</a><br>
    <a href="<c:out value="${pageContext.servletContext.contextPath}" />/admin">Hallinta</a>
</div>