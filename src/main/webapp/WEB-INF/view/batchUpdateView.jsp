<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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
    <h2>${batch.substance.name} / er� ${batch.batchNumber}</h2>
    <br/>
    
    <form:form commandName="batch" action="${pageContext.servletContext.contextPath}/updateBatch/${batch.id}" method="POST">
    <table class="noborder">
        <tr>
            <th class="name"></th>
            <th class="updated">P�ivitetty</th>
            <th>Aiempi</th>
        </tr>
        
        <tr>
            <td>Tuotenimi</td>
            <td><form:select path="substance">
                    <c:forEach var="temp" items="${substances}">
                        <c:if test="${temp.inUse == true}">
                            <c:choose>
                                <c:when test="${temp.name == batch.substance.name}">
                                    <form:option value="${temp.id}" label="${temp.name}" selected="selected"></form:option>
                                </c:when>
                                <c:otherwise>
                                    <form:option value="${temp.id}" label="${temp.name}"></form:option>
                                </c:otherwise>
                            </c:choose>
                        </c:if>
                    </c:forEach>
                </form:select>
            </td>
            <td>${batch.substance.name}</td>
        </tr>
        
        <tr>
            <td>Er�numero</td>
            <td><form:input required="required" path="batchNumber" type="text" /><form:errors path="batchNumber"/></td>
            <td>${batch.batchNumber}</td>
        </tr>
        <fmt:formatDate value="${batch.expDate}" pattern="dd.MM.yyyy" var="expire"/>
        <tr>
            <td>K�ytett�v� ennen</td>
            <td><form:input required="required" pattern="^(0[1-9]|[1-2][0-9]|3[0-1])\.(0[1-9]|1[0-2])\.[0-9]{4}$" placeholder="Muodossa pp.kk.vvvv" path="expDate" type="text" id="expDate" value="${expire}"/><form:errors path="expDate"/></td>
            <td>${expire}</td>
        </tr> 
        
        <tr class="red" style="display: none;"> <!--Turha tieto, mutta tietokanta vaatii, joten annetaan tietokannalle muttei n�ytet�-->
            <td>Saapumisp�iv�</td>
            <td><form:input path="arrivalDate" type="text" id="arrivalDate" value="${arrive}"/><form:errors path="arrivalDate"/></td>
            <td></td>
        </tr>
        
        <c:choose>
            <c:when test="${batch.qualityCheck==1}">
                <tr>
            </c:when>
            <c:when test="${batch.qualityCheck==2}">
                <tr class="red">
            </c:when>
            <c:otherwise>
                <tr class="yellow">
            </c:otherwise>
        </c:choose>
            <td>Laadunvarmistus</td>
            <td><form:select path="qualityCheck">
                    <form:option  value="0" label="Suorittamatta"/>
                    <form:option  value="1" label="Hyv�ksytty"/>
                    <form:option  value="2" label="Hyl�tty"/>
                </form:select>
                <form:errors path="qualityCheck"/>
            </td>
            <td>
                <c:choose>
                    <c:when test="${batch.qualityCheck==1}">
                        Hyv�ksytty / ${batch.qualityCheckSignature}
                    </c:when>
                    <c:when test="${batch.qualityCheck==2}">
                        Hyl�tty / ${batch.qualityCheckSignature}
                    </c:when>
                    <c:otherwise>
                        Suorittamatta
                    </c:otherwise>
                </c:choose>
            </td>
        </tr>
        
        <tr>
            <td>Kommentit</td>
            <td><form:textarea path="note" type="text"/><form:errors path="note"/></td>
            <td>${batch.note}</td>
        </tr>
        
        <tr>
            <td>Varastossa</td>
            <td>${batch.amount} kpl</td>
            <td>${batch.amount} kpl</td>
        </tr>
        
        <tr>
            <td>Sijainnit</td>
            <td>
                <div id="varastot">
                    <c:forEach var="location" items="${batch.storageLocations}" varStatus="status">
                        <c:choose>
                            <c:when test="${batch.storageLocations[status.index][1] > 0}">
                                <form:select path="storageLocations[${status.index}][0]"> 
                                    <c:forEach var="storage" items="${storages}" varStatus="i">
                                        <c:if test="${storage.hidden == false}">
                                            <form:option value="${storage.id}">${storage.name}</form:option>
                                        </c:if>
                                    </c:forEach>
                                </form:select> <form:input path="storageLocations[${status.index}][1]" type="number"/> kpl<br/>
                            </c:when>
                        </c:choose>
                    </c:forEach>
                </div>
                <button type="button" onClick="addStorage(${batch.currentStorageLocationsCount},${batch.storageLocationsCount}, ${storageNames})">Lis�� varastopaikka</button>
            </td>
            <td valign="top">
                <c:forEach var="location" varStatus="i" items="${batch.storageLocations}">
                    <c:choose>
                        <c:when test="${batch.storageLocations[i.index][1] > 0}">
                            <c:forEach var="storage" items="${storages}">
                                <c:if test="${storage.id == location[0]}">
                                    ${storage.name} ${location[1]} kpl<br/>
                                </c:if>
                            </c:forEach>
                        </c:when>
                    </c:choose>
                </c:forEach>
                
            </td>
        </tr>
        
        <tr>
            <td colspan="3">&nbsp;</td>
        </tr>
        
        <tr>
            <td>Nimikirjaimet</td>
            <td>
                <form:input required="required"  value="" path="signature" type="text" id="signature" size="6"/><form:errors path="signature"/><br />
            </td>
        </tr>
    </table>
    <br/>
    <input type="submit" value="Tallenna"> &nbsp; &nbsp;<input type="button" value="Peruuta" onClick="parent.location = '${pageContext.servletContext.contextPath}/batch/${batch.id}'" />
                            
    </form:form>
    

        
        
        
   
</div>

<%@include file="footer.jsp" %>
