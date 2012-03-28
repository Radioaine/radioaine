<%@page contentType="text/html" pageEncoding="UTF-8"%>
<span id="headertimestamp">
    <c:set var="currentDate" value="<%=new java.util.Date()%>"/>
    <fmt:formatDate pattern="dd.MM.yyyy HH:mm" value="${currentDate}" var="showDate"/>
    <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${currentDate}" var="compareDate"/>
    <fmt:formatDate pattern="HH" value="${currentDate}" var="hours"/>
    <fmt:formatDate pattern="mm" value="${currentDate}" var="minutes"/>
    <fmt:formatDate pattern="dd.MM.yyyy" value="${currentDate}" var="date"/>
    ${showDate}
</span>