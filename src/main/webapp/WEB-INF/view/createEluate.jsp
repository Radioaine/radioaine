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
                <td><select multiple="multiple" onclick="eluateAmounts(event)">
                        <c:forEach var="generator" items="${generators}">
                            <option  value="${generator.id}">${generator.substance.name}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Kitit:</td>
                <td><form:select onclick="eluateAmounts(event)" path="kits">
                        <c:forEach var="kit" items="${kits}">
                            <form:option value="${kit.id}">${kit.substance.name},
                                ${kit.batchNumber}, <fmt:formatDate value="${kit.expDate}" pattern="dd.MM.yyyy"/></form:option>
                        </c:forEach>
                    </form:select>
                </td>
            </tr>
            <tr>
                <td>Muut:</td>
                <td><form:select onclick="eluateAmounts(event)" path="others">
                        <c:forEach var="other" items="${others}">
                            <form:option value="${other.id}">${other.substance.name},
                                ${other.batchNumber}, <fmt:formatDate value="${other.expDate}" pattern="dd.MM.yyyy"/></form:option>
                        </c:forEach>
                    </form:select>
                <td>
            </tr>
            <tr>
                <td></td>
                <td>Klo<span id="pvm">Pvm</span></td>
            </tr>
            <tr>
                <td>Eluointiaika:</td>
                <td><form:input path="hours" type="text" id="hours" size="2"/><form:errors path="hours"/>:<form:input
                        path="minutes" type="text" id="minutes" size="2"/><form:errors path="minutes"/>
                    <form:input path="date" type="text" id="eluatingtime"/><form:errors path="date"/></td>
            </tr>
            <tr>
                <td>Aktiivisuus:</td>
                <td><form:input path="strength" type="text"/><form:errors path="strength"/>GBq</td>
            </tr>
            <tr>
                <td>Tilavuus:</td>
                <td><form:input path="volume" type="text"/><form:errors path="volume"/>ml</td>
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