<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="<c:out value="${pageContext.servletContext.contextPath}" />/css/basic.css" />
        <link rel="stylesheet" type="text/css" href="<c:out value="${pageContext.servletContext.contextPath}" />/css/tabs.css" />
        <link type="text/css" href="${pageContext.servletContext.contextPath}/css/flick/jquery-ui-1.8.17.custom.css" rel="stylesheet" />
        <title>Radioaine</title>
        <script type="text/javascript" src="<c:url value="/script/jquery-1.7.1.min.js" />"></script>
        <script type="text/javascript" src="<c:url value="/script/jquery-ui-1.8.17.custom.min.js" />"></script>
        <script type="text/javascript" src="<c:url value="/script/script.js" />"></script>

    </head>
    <body>
        <%@include file="mainMenu.jsp" %>
        <div id="main">