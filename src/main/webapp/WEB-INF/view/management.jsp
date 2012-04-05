<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="headeradmin.jsp" %>
<div id="contents">
    
    <a href="<c:out value="${pageContext.servletContext.contextPath}" />/addSubstance">Lisää uusi lääkeaine</a><br />
    <a href="<c:out value="${pageContext.servletContext.contextPath}" />/addStorageLocation">Lisää uusi varastopaikka</a><br />
    
</div>
<%@include file="footer.jsp" %>
