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
    <h1>Er‰ ${batch.batchNumber}</h1>
    <p><b>Vanhat tiedot</b></p>
    <table id="reunaton">

        <tr>
            <td>Aine</td>
            <td>${batch.substance.name}</a></td>
        </tr>
        <tr>
            <td>J‰ljell‰</td>
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
            <td><fmt:formatDate value="${batch.arrivalDate}" pattern="dd.MM.yyyy" var="arrive"/>${arrive}</td>
        </tr>
        <tr>
            <td>Vanhenee</td>
            <td><fmt:formatDate value="${batch.expDate}" pattern="dd.MM.yyyy" var="expire"/>${expire}</td>
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
            <td>
                <c:choose>
                    <c:when test="${batch.qualityCheck==1}">
                        Hyv‰ksytty
                    </c:when>
                    <c:when test="${batch.qualityCheck==2}">
                        Hyl‰tty
                    </c:when>
                    <c:otherwise>
                        <form style="background-color: yellow" action="${pageContext.servletContext.contextPath}/doCheck/${batch.id}+${batch.substance.id}" method="POST">
                            <select name="qualityCheck">
                                <option value="1">Hyv‰ksytty</option>
                                <option value="2">Hyl‰tty</option>
                            </select>
                            <input type="submit" value="Kirjaa tulos">
                        </form>
                    </c:otherwise>
                </c:choose>
            </td>
        </tr>
        <c:forEach var="location" varStatus="i" items="${batch.storageLocations}">
            <c:choose>
                <c:when test="${batch.storageLocations[i.index][1] > 0}">
                    <tr>
                        <td>${storages[(batch.storageLocations[i.index][0]-1)].name}</td>     
                        <td>${location[1]} kpl</td>
                    </tr>
                </c:when>
            </c:choose>
        </c:forEach>
        <tr>
            <td>Kommentit</td>
            <td>${batch.note}</td>
        </tr>

    </table>
    <br>
    <form:form commandName="batch" action="${pageContext.servletContext.contextPath}/updateBatch/${batch.id}" method="POST">
        Aine: <form:select path="substance">
                    <form:options items="${substances}" itemValue="id" itemLabel="name"/>
              </form:select><br/>
        Er‰numero: <form:input required="required" path="batchNumber" type="text" /><form:errors path="batchNumber"/><br/>
        <!--M‰‰r‰: <form:input path="amount" type="number"/><form:errors path="amount"/><br/>-->
        Pakkauskoko: <form:input path="substanceVolume" type="number"/><form:errors path="substanceVolume"/><br/>
        Saapumisp‰iv‰: <form:input required="required" path="arrivalDate" type="text" id="arrivalDate" value="${arrive}"/><form:errors path="arrivalDate"/><br/>
        Vanhenemisp‰iv‰: <form:input required="required" path="expDate" type="text" id="expDate" value="${expire}"/><form:errors path="expDate"/><br/>
        Laadunvarmistus: <form:select path="qualityCheck">
                            <form:option  value="1" label="Hyv‰ksytty"/>
                            <form:option  value="2" label="Hyl‰tty"/>
                          </form:select><form:errors path="qualityCheck"/><br/>
        <div id="varastot">
            <c:forEach var="location" items="${batch.storageLocations}" varStatus="status">
                <c:choose>
                    <c:when test="${batch.storageLocations[status.index][1] > 0}">
                        <form:select path="storageLocations[${status.index}][0]"> 
                            <c:forEach var="storage" items="${storages}" varStatus="i">
                                <c:if test="${storage.hidden == false}">
                                    <form:option value="${i.index+1}">${storage.name}</form:option>
                                </c:if>
                            </c:forEach>
                        </form:select> <form:input path="storageLocations[${status.index}][1]" type="number"/> kappaletta<br/>
                    </c:when>
                </c:choose>
            </c:forEach>
        </div>
        <button type="button" onClick="addStorage(${batch.currentStorageLocationsCount},${batch.storageLocationsCount}, ${storageNames})">Lis‰‰ varastopaikka</button><br />
        Huomioita: <br /><form:textarea path="note" type="text"/><form:errors path="note"/><br/>
        Nimikirjaimet: <form:input required="required" path="signature" type="text" id="signature" size="6"/><form:errors path="signature"/><br />
        <input type="submit" value="Tallenna muutokset">
        <input type="button" value="Peruuta" onClick="parent.location = '${pageContext.servletContext.contextPath}/batch/${batch.id}'" />
    </form:form>
</div>

<%@include file="footer.jsp" %>