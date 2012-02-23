<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script type="text/javascript" src="<c:url value="/css/script.js" />"></script>
<%@include file="header.jsp" %>

<script>
    $(function() {
        $( "#arrivalDate" ).datepicker();
    });
    
    $(function() {
        $( "#expDate" ).datepicker();
    });
    
    
</script>
<script type="text/javascript" src="script/ui.datepicker-fi.js"></script>

<div id="sisalto">
    <h1>Erä ${batch.batchNumber}</h1>
    <p><b>Vanhat tiedot</b></p>
    <table id="reunaton">

        <tr>
            <td>Aine</td>
            <td>${batch.substance}</a></td>
        </tr>
        <tr>
            <td>Jäljellä</td>
            <td>${batch.amount}kpl</td>
        </tr>
        <tr>
            <td>Pakkauskoko</td>
            <td>${batch.substanceVolume}ml</td>
        </tr>
        <tr>
            <td>Vahvuus</td>
            <td>${batch.strength}</td>
        </tr>
        <tr>
            <td>Saapunut</td>
            <td><fmt:formatDate value="${batch.arrivalDate}" pattern="dd.MM.yyyy"/></td>
        </tr>
        <tr>
            <td>Vanhenee</td>
            <td><fmt:formatDate value="${batch.expDate}" pattern="dd.MM.yyyy"/></td>
        </tr>
        <tr>
            <td>Valmistaja</td>
            <td>${batch.manufacturer}</td>
        </tr>
        <tr>
            <td>Tukkuliike</td>
            <td>${batch.supplier}</td>
        </tr>
        <tr>
            <td>Laadunvarmistus</td>
            <td>Suoritettu (MK) ${batch.qualityCheck}</td>
        </tr>
        <tr>
            <td>Kommentit</td>
            <td>${batch.note}</td>
        </tr>

    </table>
    <br>

    <form:form commandName="batch" action="${pageContext.servletContext.contextPath}/updateBatch/${batch.id}" method="POST">
        Aine: <form:select path="substance">
            <c:forEach var="substance" items="${substances}">
                <form:option value="${substance.id}">${substance.name}</form:option>
            </c:forEach>
        </form:select><br/>
        Eränumero: <form:input path="batchNumber" type="text"/><form:errors path="batchNumber"/><br/>
        Määrä: <form:input path="amount" type="number"/><form:errors path="amount"/><br/>
        Pakkauskoko: <form:input path="substanceVolume" type="number"/><form:errors path="substanceVolume"/><br/>
        Saapumispäivä: <form:input path="arrivalDate" type="text" id="arrivalDate"/><form:errors path="arrivalDate"/><br/>
        Vanhenemispäivä: <form:input path="expDate" type="text" id="expDate"/><form:errors path="expDate"/><br/>
        Huomioita: <br /><form:textarea path="note" type="text"/><form:errors path="note"/><br/>
        <input type="submit" value="Tallenna muutokset">
        <input type="button" value="Peruuta" onClick="parent.location = '${pageContext.servletContext.contextPath}/batch/${batch.id}'" />
    </form:form>
</div>

<%@include file="footer.jsp" %>