<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="header.jsp" %>
<script type="text/javascript" src="<c:url value="/script/ui.datepicker-fi.js" />"></script>
<script>
    $(function() {
        $( "#eluatingtime" ).datepicker();
    });
</script>

<div id="contents">
    <h2>Uusi eluaatti</h2>



    <form:form commandName="eluate" action="createEluate" method="POST">
        <table class="noborder">
            <tr>
                <td>Generaattori:</td>
                <td><form:select path="generator">
                        <c:forEach var="substance" items="${substances}">
                            <c:if test="${substance.type == '1'}">
                                <form:option value="${substance.id}">${substance.name}</form:option>
                            </c:if>
                        </c:forEach>
                    </form:select>
                </td>
            </tr>
            <tr>
                <td>Kitti:</td>
                <td><form:select path="generator">
                        <c:forEach var="substance" items="${substances}">
                            <c:if test="${substance.type == '0'}">
                                <form:option value="${substance.id}">${substance.name}</form:option>
                            </c:if>
                        </c:forEach>
                    </form:select>
                </td>
            </tr>
            <tr>
                <td>Liuotin:</td>
                <td><form:select path="solvent">
                        <c:forEach var="substance" items="${substances}">
                            <c:if test="${substance.type == '2'}">
                                <form:option value="${substance.id}">${substance.name}</form:option>
                            </c:if>
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
                <td><form:input path="volume" type="number"/><form:errors path="volume"/> GBq</td>
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