<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="headerfront.jsp" %>
<script>
    function checkType()    {
        var newdiv = $("<tr>");
        substance =  '${substances}';

    }
</script>
<script type="text/javascript" src="<c:url value="/script/ui.datepicker-fi.js" />"></script>
<script>
    $(function() {
        $( "#creationtime" ).datepicker();
    });
</script>

<div id="contents">
    <h2>Uusi radiolääke</h2>
    <br/>
    <form:form commandName="radioMedicine" action="createRadioMedicine" method="POST">
        <!--<table style="float: right;">
            <th>Valitut</th>
            <tr>
                <td style="float: right; border: none; font-size: 90%;" id="selected"></td>
                </td>
            </tr>
        </table>-->
        <table class="noborder">
            <tr>
                <td class="name">Eluaatti</td>
                <td>
                    <select multiple="multiple" class="list" >
                        <c:forEach var="eluate" items="${eluates}">
                            <option id="3" onclick="eluateAmounts(event)" value="${eluate.id}">Klo <fmt:formatDate value="${eluate.date}" pattern="hh.mm"/>, TODO Eluaatin nimi, Aktiivisuus ${eluate.strength}, Sijainti TODO${eluate.storageLocation}, Tekijä ${eluate.signature}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Kitti</td>
                <td><select multiple="multiple" class="list">
                        <c:forEach var="kit" items="${kits}">
                            <option id="1" onclick="eluateAmounts(event)" value="${kit.id}">${kit.substance.name}, Erä 
                                ${kit.batchNumber}, Käyt. ennen <fmt:formatDate value="${kit.expDate}" pattern="dd.MM.yyyy"/>, TODO Sijainti</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Muu</td>
                <td><select multiple="multiple" class="list" >
                        <c:forEach var="other" items="${others}">
                            <option id="2" onclick="eluateAmounts(event)" value="${other.id}">${other.substance.name}, Erä
                                ${other.batchNumber}, Käyt. ennen <fmt:formatDate value="${other.expDate}" pattern="dd.MM.yyyy"/>, TODO Sijainti</option>
                            </c:forEach>
                    </select>
                <td>
            </tr>
            <tr>
                <td>&nbsp; </td>
                <td> </td>
            </tr>
            <tr>
                <td>Valitut</td>
                <td style="font-size: 90%;" id="selected"></td>
            </tr>
            <tr>
                <td>&nbsp; </td>
                <td> </td>
            </tr>
            <tr>
                <td></td>
                <td style="font-size: 90%;">Klo<span id="pvm">Pvm</span></td>
            </tr>
            <tr>
                <td>Luontiaika</td>
                <td><input required name="hours" type="text" id="hours" size="2" value="${hours}"/>:<input required
                        name="minutes" type="text" id="minutes" size="2" value="${minutes}"/>
                    <input required name="date" type="text" id="creationtime" value="${date}"/></td>
            </tr>
            <tr>
                <td>Aktiivisuus</td>
                <td><form:input path="strength" type="text" size="5"/><form:errors path="strength"/>
                    <form:select path="unit">
                    <option value="0">GBq</option>
                    <option value="1">MBq</option>
                    </form:select>
                </td>
            </tr>
            <tr>
                <td>Tilavuus</td>
                <td><form:input path="volume" type="text" size="5"/><form:errors path="volume"/>ml</td>
            </tr>
            <tr>
                <td>Varastopaikka</td>
                <td><form:select  path="storageLocation">
                        <c:forEach var="storage" items="${storages}" varStatus="i">
                            <c:if test="${storage.hidden == false}">
                                <form:option value="${i.index+1}">${storage.name}</form:option>
                            </c:if>
                        </c:forEach>
                    </form:select></td>
            </tr>
            <tr>
                <td>Huomautuksia</td>
                <td><form:textarea path="note" type="text"/><form:errors path="note"/></td>
            </tr>
            <tr>
                <td>Nimikirjaimet</td>
                <td><form:input path="signature" type="text" id="signature" size="6"/><form:errors path="signature"/></td>
            </tr>
        </table>
        <br/>
        
        <td><input type="submit" value="Tallenna"></td>&nbsp; &nbsp;
        <td><input type="button" value="Peruuta" onClick="parent.location = '${pageContext.servletContext.contextPath}/frontpage'" /></td>
        
    </form:form>
</div>
<%@include file="footer.jsp" %>      