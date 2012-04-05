<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="headeradmin.jsp" %>
<div id="contents">
    
    <a href="<c:out value="${pageContext.servletContext.contextPath}" />/substanceView">Hallitse lääkeaineita</a><br />
    <a href="<c:out value="${pageContext.servletContext.contextPath}" />/storagesView">Hallitse varastopaikkoja</a><br />
    
</div>
<%@include file="footer.jsp" %>
