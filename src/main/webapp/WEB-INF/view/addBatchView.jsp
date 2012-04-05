<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%@include file="headerstorage.jsp" %>
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
    <h2>Lis‰‰ l‰hetys</h2>
        
    <form:form commandName="batch" action="batch" method="POST">
        <table class="noborder">
            <tr>
                <td class="name">Tuote</td>
                <td>
                    <form:select path="substance">
                        <c:forEach var="substance" items="${substances}">
                            <form:option value="${substance.id}">${substance.name}</form:option>
                        </c:forEach>
                    </form:select>                            
                </td>
                <td>Pit‰‰kˆ t‰ss‰ pysty‰ lis‰‰m‰‰n kategoriaan "Muu" tuote, jota ei ole lis‰tty j‰rjestelm‰‰n aineen lis‰‰misen kautta?</td>
            </tr>
            <tr>
                <td>Er‰numero</td>
                <td><form:input path="batchNumber" type="text"/><form:errors path="batchNumber"/></td>
            </tr>
            <tr>
                <td>Saapumisp‰iv‰</td>
                <td><form:input path="arrivalDate" type="text" value="${date}" id="arrivalDate"/><form:errors path="arrivalDate"/></td>
                <td></td>
            </tr>
            <tr>
                <td>Vanhenemisp‰iv‰</td>
                <td><form:input path="expDate" type="text" id="expDate"/><form:errors path="expDate"/></td>
                <td></td>
            </tr>
            <tr>
                <td valign="top">Sijainti</td>
                <td>
                    <div id="varastot">
                        <form:select  path="storageLocations[0][0]">
                            <c:forEach var="storage" items="${storages}" varStatus="i">
                                <c:if test="${storage.hidden == false}">
                                    <form:option value="${i.index+1}">${storage.name}</form:option>
                                </c:if>
                            </c:forEach>
                        </form:select> <form:input class="temp" onchange="countAmount()" id="storageAmount" path="storageLocations[0][1]" type="number" size="3"/> kpl<br/> 
                    </div>
                </td>
                <td valign="bottom"><button type="button" onClick="addStorage(1, ${batch.storageLocationsCount}, ${storageNames})">Lis‰‰ varastopaikka</button></td>
                <td></td>
            </tr>
            <tr>
                <td>M‰‰r‰ yhteens‰</td>
                <td id="t">0</td>
                <td></td>
            </tr>
            <tr>
                <td>Huomautuksia</td>
                <td><form:textarea path="note" type="text" /><form:errors path="note"/></td>
                <td></td>
            </tr>
        </table>
        
        <br/>
        
        <table class="noborder">
            <tr>
                <td class="name">Nimikirjaimet</td>
                <td><form:input path="signature" type="text" id="signature" size="6"/><form:errors path="signature"/></td>
                <td></td>
            </tr>
        </table>
        
        <br/>
            
        <input type="submit" value="Tallenna" /> &nbsp;&nbsp;<input type="button" value="Peruuta" onClick="parent.location = '${pageContext.servletContext.contextPath}/storage'"/>
        
    </form:form>
        
</div>

<%@include file="footer.jsp" %>