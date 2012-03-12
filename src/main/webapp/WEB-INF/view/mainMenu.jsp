<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%java.util.Date date = new java.util.Date();%>
<%String dayAndTime = date.toLocaleString();%>        

<h3>
    RADIOAINE
</h3>

<div id="header">
    <ul id="primary">
        <li><a href="<c:out value="${pageContext.servletContext.contextPath}" />/frontpage">VALMISTUS</a></li>
        <li><a href="<c:out value="${pageContext.servletContext.contextPath}" />/storage">VARASTO</a></li>
        <li><a href="<c:out value="${pageContext.servletContext.contextPath}" />/admin">HALLINTA</a></li>
    </ul>
    <span id="headertimestamp">
        <script>
            var myDate = new Date();
            var displayDate = (myDate.getDate()) + '.' + (myDate.getMonth()+1) + '.' + myDate.getFullYear() + ' ' + myDate.getHours() + ':' + myDate.getMinutes();
            document.write(displayDate);
        </script>
    </span>
</div>