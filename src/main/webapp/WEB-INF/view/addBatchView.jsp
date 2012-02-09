<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="header.jsp" %>

<div id="sisalto">
    <h1>Lisää lähetys</h1>


    <form:form commandName="batch" action="add" method="POST">
        Aine: <form:select path="substance">
            <form:option value="1">Bridatec</form:option>
            <form:option value="2">Stamicis</form:option>
            <form:option value="3">Nanocolli</form:option>
        </form:select><br/>
        Eränumero: <form:input path="batchNumber" type="text"/><form:errors path="batchNumber"/><br/>
        Määrä: <form:input path="amount" type="number"/><form:errors path="amount"/><br/>
        Saapumispäivä: <form:input path="arrivalDate" type="date"/><form:errors path="arrivalDate"/><br/>
        Vanhenemispäivä: <form:input path="expDate" type="date"/><form:errors path="expDate"/><br/>
        Huomioita: <form:textarea path="note" type="text"/><form:errors path="note"/><br/>
        <input type="submit">
    </form:form>
</div>

<%@include file="footer.jsp" %>