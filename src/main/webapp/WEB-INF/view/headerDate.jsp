<%@page contentType="text/html" pageEncoding="UTF-8"%>
<span id="headertimestamp">
    <c:set var="currentDate" value="<%=new java.util.Date()%>"/>
    <fmt:formatDate pattern="dd.MM.yyyy HH:mm" value="${currentDate}" var="date"/>
    <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${currentDate}" var="compareDate"/>

    ${date}
</span>