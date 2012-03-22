<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script type="text/javascript" src="<c:url value="/css/script.js" />"></script>
<%@include file="headerstorage.jsp" %>

<script>
    $(function() {
        $( "#arrivalDate" ).datepicker();
    });
    
    $(function() {
        $( "#expDate" ).datepicker();
    });
    
    
</script>
<script type="text/javascript" src="script/ui.datepicker-fi.js"></script>

<div id="contents">
    <h1>Erä ${batch.batchNumber}</h1>
    <p><b>Vanhat tiedot</b></p>
    <table id="reunaton">

        <tr>
            <td>Aine</td>
            <td>${batch.substance.name}</a></td>
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
            <td>
                <c:choose>
                    <c:when test="${batch.qualityCheck==1}">
                        Ok
                    </c:when>
                    <c:when test="${batch.qualityCheck==2}">
                        Hylätty
                    </c:when>
                    <c:otherwise>
                        <form style="background-color: yellow" action="${pageContext.servletContext.contextPath}/doCheck/${batch.id}+${batch.substance.id}" method="POST">
                            <select name="qualityCheck">
                                <option value="1">Hyväksytty</option>
                                <option value="2">Hylätty</option>
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
                        <td>Jääkaapissa ${batch.storageLocations[i.index][0]} on ${location[1]} kappaletta</td>     
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
        Eränumero: <form:input path="batchNumber" type="text"/><form:errors path="batchNumber"/><br/>
        <!--Määrä: <form:input path="amount" type="number"/><form:errors path="amount"/><br/>-->
        Pakkauskoko: <form:input path="substanceVolume" type="number"/><form:errors path="substanceVolume"/><br/>
        Saapumispäivä: <form:input path="arrivalDate" type="text" id="arrivalDate"/><form:errors path="arrivalDate"/><br/>
        Vanhenemispäivä: <form:input path="expDate" type="text" id="expDate"/><form:errors path="expDate"/><br/>
        <div id="varastot">
            <c:forEach var="location" items="${batch.storageLocations}" varStatus="status">
                <c:choose>
                    <c:when test="${batch.storageLocations[status.index][1] > 0}">
                        <form:select path="storageLocations[${status.index}][0]"> 
                            <c:forEach var="locations" items="${batch.storageLocations}" varStatus="i">
                                <form:option value="${i.index+1}">Jääkaappi ${i.index+1}</form:option>
                            </c:forEach>
                        </form:select> <form:input path="storageLocations[${status.index}][1]" type="number"/> kappaletta<br/>
                    </c:when>
                </c:choose>
            </c:forEach>
        </div>
        <button type="button" onClick="addStorage(${batch.currentStorageLocationsCount},${batch.storageLocationsCount})">Lisää varastopaikka</button><br />
        Huomioita: <br /><form:textarea path="note" type="text"/><form:errors path="note"/><br/>
        <input type="submit" value="Tallenna muutokset">
        <input type="button" value="Peruuta" onClick="parent.location = '${pageContext.servletContext.contextPath}/batch/${batch.id}'" />
    </form:form>
</div>

<%@include file="footer.jsp" %>