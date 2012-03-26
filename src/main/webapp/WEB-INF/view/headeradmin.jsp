<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
        <h3>
            RADIOAINE
        </h3>

        <div id="header">
            <ul id="primary">
                <li><a href="<c:out value="${pageContext.servletContext.contextPath}" />/frontpage">VALMISTUS</a></li>
                <li><a href="<c:out value="${pageContext.servletContext.contextPath}" />/storage">VARASTO</a></li>
                <li><a class="current" href="<c:out value="${pageContext.servletContext.contextPath}"/>/admin">HALLINTA</a></li>
                <ul id="secondary">
				<li><a href="admin.html">Huomautukset</a></li>
				<li><a href="historyView.html">Historiatiedot ja raportit</a></li>
				<li><a href="substanceView.html">Aineiden tiedot</a></li>
				<li><a href="yllapito" class="last">Ylläpito</a></li>
		</ul>  
            </ul>
            <span id="headertimestamp">
                <c:set var="currentDate" value="<%=new java.util.Date()%>"/>
                <fmt:formatDate pattern="dd.MM.yyyy" value="${currentDate}" var="date"/>
                <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${currentDate}" var="compareDate"/>
                
                ${compareDate}
            </span>
        </div>
        <div id="main">