<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<script type="text/javascript" src="<c:url value="/script/ui.datepicker-fi.js" />"></script>
<script>
    $(function() {
        $( "#arrivalDate" ).datepicker();
    });
    
    $(function() {
        $( "#expDate" ).datepicker();
    });
    
    
</script>

<div id="sisalto">
    <h1>Lisää lähetys</h1>

    <form:form commandName="batch" action="batch" method="POST">
        Aine: <form:select path="substance">
            <c:forEach var="substance" items="${substances}">
                <form:option value="${substance.id}">${substance.name}</form:option>
            </c:forEach>
               </form:select><br/>
        Eränumero: <form:input path="batchNumber" type="text"/><form:errors path="batchNumber"/><br/>
        <!-- Määrä: <form:input path="amount" type="number"/><form:errors path="amount"/><br/>-->
        Saapumispäivä: <form:input path="arrivalDate" type="text" id="arrivalDate"/><form:errors path="arrivalDate"/><br/>
        Vanhenemispäivä: <form:input path="expDate" type="text" id="expDate"/><form:errors path="expDate"/><br/>
        
        <div id="varastot">
                <form:select path="storageLocations[0][0]">
                    <c:forEach var="locations" items="${batch.storageLocations}" varStatus="i">
                        <form:option value="${i.index+1}">Jääkaappi ${i.index+1}</form:option>
                    </c:forEach>
                </form:select> <form:input path="storageLocations[0][1]" type="number"/> kappaletta<br/> 
        </div>
        <button type="button" onClick="addStorage(1, ${batch.storageLocationsCount})">Lisää varastopaikka</button><br />
        Huomioita: <form:textarea path="note" type="text"/><form:errors path="note"/><br/>
        <input type="submit">
    </form:form>

</div>

<%@include file="footer.jsp" %>