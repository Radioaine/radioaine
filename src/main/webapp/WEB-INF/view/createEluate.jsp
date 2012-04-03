<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="headerfront.jsp" %>
<script type="text/javascript" src="<c:url value="/script/ui.datepicker-fi.js" />"></script>
<script>
    $(function() {
        $( "#eluatingtime" ).datepicker();
    });
</script>


<div id="contents">
    <h2>Uusi eluaatti</h2>

    <form:form commandName="eluate" action="createEluate" method="POST">
        <table style="float: right;">
            <th>Valitut</th>
            <tr>
                <td style="float: right; border: none; font-size: 90%;" id="selected"></td>
                </td>
            </tr>
        </table>
        <table class="noborder">
            <tr>
                <td>Generaattori:</td>
                <td><select multiple="multiple" >
                        <c:forEach var="generator" items="${generators}">
                            <option id="0" onclick="eluateAmounts(event)"  value="${generator.id}">${generator.substance.name}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Muut:</td>
                <td><select multiple="multiple" >
                        <c:forEach var="other" items="${others}">
                            <option id="2" onclick="eluateAmounts(event)" value="${other.id}">${other.substance.name},
                                ${other.batchNumber}, <fmt:formatDate value="${other.expDate}" pattern="dd.MM.yyyy"/></option>
                            </c:forEach>
                    </select>
                <td>
            </tr>
            <tr>
                <td></td>
                <td>Klo<span id="pvm">Pvm</span></td>
            </tr>
            <tr>
                <td>Eluointiaika:</td>
                <td><form:input path="hours" type="text" id="hours" value="${hours}" size="2"/><form:errors path="hours"/>:<form:input
                        path="minutes" type="text" id="minutes" size="2" value="${minutes}"/><form:errors path="minutes"/>
                    <form:input path="date" type="text" id="eluatingtime" value="${date}"/><form:errors path="date"/></td>
            </tr>
            <tr>
                <td>Aktiivisuus:</td>
                <td><form:input path="strength" type="text"/><form:errors path="strength"/>
                    <form:select path="unit">
                <option value="0">GBq</option>
                <option value="1">MBq</option>
            </form:select>

            </td>
            </tr>
            <tr>
                <td>Tilavuus:</td>
                <td><form:select path="volume" type="text">
                        <form:option value="5"/>
                        <form:option value="10"/>
                        <form:option value="11"/>
                    </form:select><form:errors path="volume"/>ml
                </td>
            </tr>
            <tr>
                <td>Varastopaikka</td>
                <td><form:select  path="storageLocation">
                        <c:forEach var="storage" items="${storages}" varStatus="i">
                            <form:option value="${i.index+1}">${storage.name}</form:option>
                        </c:forEach>
                    </form:select></td>
            </tr>
            <tr>
                <td>Huomautuksia:</td>
                <td><form:textarea path="note" type="text"/><form:errors path="note"/></td>
            </tr>
            <tr>
                <td>Nimikirjaimet:</td>
                <td><form:input path="signature" type="text" id="signature"/><form:errors path="signature"/></td>
            </tr>
            <tr>
                <td><input type="submit" value="Tallenna"></td>
                <td><input type="button" value="Peruuta" onClick="parent.location = '${pageContext.servletContext.contextPath}/frontpage'" /></td>
            </tr>
        </table>

    </form:form>

</div>
<%@include file="footer.jsp" %>        