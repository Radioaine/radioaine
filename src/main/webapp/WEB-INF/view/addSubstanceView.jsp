<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="header.jsp" %>

<div id="contents">
    <h1>Lisää lääkeaine</h1>


    <form:form commandName="substance" action="substance" method="POST">
        Aine: <form:input path="name" type="text"/><form:errors path="name"/><br/>
        Tyyppi: <form:select path="type">
            <form:option value="0">Kitti</form:option>
            <form:option value="1">Generaattori</form:option>
            <form:option value="2">Muu</form:option>
        </form:select><br/>
        Valmistaja: <form:input path="manufacturer" type="text"/><form:errors path="manufacturer"/><br/>
        Toimittaja: <form:input path="supplier" type="text"/><form:errors path="supplier"/><br/>
        Säilytettävä kylmässä: <form:select path="needsColdStorage">
            <form:option value="1">Kyllä</form:option>
            <form:option value="0">Ei</form:option>
        </form:select><br/>
        Hälytysraja 1: <form:input path="alertLimit1" type="number"/><form:errors path="alertLimit1"/><br/>
        Hälytysraja 2: <form:input path="alertLimit2" type="number"/><form:errors path="alertLimit2"/><br/>
        <input type="submit" value="Lisää">
    </form:form>  

</div>

<%@include file="footer.jsp" %>