<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="headeradmin.jsp" %>

<div id="contents">
    <h2>Lisää varasto</h2>
    
    <form:form commandName="storage" action="addStorage" method="POST">
        <table class="noborder">
            <tr>
                <td>Nimi:</td>
                <td><form:input path="name" type="text"/><form:errors path="name"/></td>
            </tr>
            <tr>
                <td><input type="submit" value="Lisää"></td>
            </tr>
        </table>
    </form:form>  
</div>

<%@include file="footer.jsp" %>
