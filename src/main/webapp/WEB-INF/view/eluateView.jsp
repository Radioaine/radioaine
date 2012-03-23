<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="headerstorage.jsp" %>

<div id="contents">
    <h1>Eluaatti ${eluate.id}</h1>

    <table id="reunaton">
        <tr>
            <td>Generaattorit</td>
            <c:forEach var="gen" items="${eluate.generators}">
                <td>${gen.substance.name}</td><br /> 
            </c:forEach>
        </tr>
        <tr>
            <td>Kitit</td>
            <c:forEach var="kit" items="${eluate.kits}">
                <td>${kit.substance.name}</td><br /> 
            </c:forEach>
        </tr>
        <tr>
            <td>Muut</td>
            <c:forEach var="other" items="${eluate.others}">
                <td>${other.substance.name}</td><br /> 
            </c:forEach>
        </tr>
 
    </table>
      
</div>

<%@include file="footer.jsp" %>
