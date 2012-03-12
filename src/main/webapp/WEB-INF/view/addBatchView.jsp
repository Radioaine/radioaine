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

<div id="contents">
    <h2>Lisää lähetys</h2>
        
    <form:form commandName="batch" action="batch" method="POST">
        <table class="noborder">
            <tr>
                <td>Tuote</td>
                <td>
                    <form:select path="substance">
                        <c:forEach var="substance" items="${substances}">
                            <form:option value="${substance.id}">${substance.name}</form:option>
                        </c:forEach>
                    </form:select>                            
                </td>
                <td>Pitääkö tässä pystyä lisäämään kategoriaan "Muu" tuote, jota ei ole lisätty järjestelmään aineen lisäämisen kautta?</td>
            </tr>
            <tr>
                <td>Eränumero</td>
                <td><form:input path="batchNumber" type="text"/><form:errors path="batchNumber"/></td>
            </tr>
            <tr>
                <td>Saapumispäivä</td>
                <td><form:input path="arrivalDate" type="text" id="arrivalDate"/><form:errors path="arrivalDate"/></td>
                <td></td>
            </tr>
            <tr>
                <td>Vanhenemispäivä</td>
                <td><form:input path="expDate" type="text" id="expDate"/><form:errors path="expDate"/></td>
                <td></td>
            </tr>
            <tr>
                <td>Sijainti</td>
                <td><div id="varastot"><form:select path="storageLocations[0][0]">
                            <c:forEach var="locations" items="${batch.storageLocations}" varStatus="i">
                                <form:option value="${i.index+1}">Jääkaappi ${i.index+1}</form:option>
                            </c:forEach>
                        </form:select> <form:input path="storageLocations[0][1]" type="number"/> kpl<br/> 
                    </div></td>
                <td><button type="button" onClick="addStorage(1, ${batch.storageLocationsCount})">Lisää varastopaikka</button></td>
                <td></td>
            </tr>
            <tr>
                <td>Määrä yhteensä</td>
                <td><form:input path="amount" type="number"/><form:errors path="amount"/>kpl</td>
                <td></td>
            </tr>
            <tr>
                <td>Huomioita</td>
                <td><form:textarea path="note" type="text"/><form:errors path="note"/></td>
                <td></td>
            </tr>
            <tr>
                <td>Nimikirjaimet</td>
                <td><form:input path="signature" type="text" id="signature"/><form:errors path="signature"/></td>
                <td></td>
            </tr>
            <tr>
                <td><input type="submit" value="Tallenna" />  </td>
                <td>&nbsp;&nbsp;<input type="submit" value="Peruuta"/></td>
            </tr>
        </table>
    </form:form>
        
</div>

<%@include file="footer.jsp" %>