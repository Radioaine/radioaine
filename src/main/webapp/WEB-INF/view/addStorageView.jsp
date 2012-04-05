<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="headeradmin.jsp" %>

<div id="contents">
    <h2>Lisää varasto</h2>
    
    <form action="addStorage" method="POST">
        <table class="noborder">
            <tr>
                <td>Nimi:</td>
                <td><input required name="name" type="text"/></td>
            </tr>
            <tr>
                <td><input type="submit" value="Lisää"></td>
            </tr>
        </table>
    </form>  
</div>

<%@include file="footer.jsp" %>
