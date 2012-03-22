<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script type="text/javascript" src="<c:url value="/css/script.js" />"></script>
<%@include file="headeradmin.jsp" %>

<div id="contents">
    <h1>${substance.name}</h1>
    <p><b>Vanhat tiedot</b></p>
    <table id="reunaton">
        
        <tr>
            <td>Aine</td>
            <td>${substance.name}</td>
        </tr>
        <tr>
            <td>Tyyppi</td>
            <td><c:choose>
                    <c:when test="${substance.type=='0'}">
                        Kitti
                    </c:when>
                    <c:when test="${substance.type=='1'}">
                        Generaattori
                    </c:when>
                    <c:otherwise>
                        Muu
                    </c:otherwise>
                </c:choose></td>
        </tr>
        <tr>
            <td>Valmistaja</td>
            <td>${substance.manufacturer}</td>
        </tr>
        <tr>
            <td>Toimittaja</td>
            <td>${substance.supplier}</td>
        </tr>
        <tr>
            <td>Säilytettävä kylmässä</td>
            <td>
                <c:choose>
                    <c:when test="${substance.needsColdStorage==true}">
                        Kyllä
                    </c:when>
                    <c:otherwise>
                        Ei 
                    </c:otherwise>
                </c:choose>
            </td>
        </tr>
        <tr>
            <td>Hälytysraja 1</td>
            <td>${substance.alertLimit1}</td>
        </tr>
        <tr>
            <td>Hälytysraja 2</td>
            <td>${substance.alertLimit2}</td>
        </tr>
        
    </table>
    <br>
    
    <form:form commandName="substance" action="${pageContext.servletContext.contextPath}/updateSubstance/${substance.id}" method="POST">
        Aine: <form:input path="name" type="text"/><form:errors path="name"/><br/>
        Tyyppi: <form:select path="type">
            <form:option value="0">Kitti</form:option>
            <form:option value="1">Generaattori</form:option>
            <form:option value="2">Muu</form:option>
        </form:select><br/>
        Valmistaja: <form:input path="manufacturer" type="text"/><form:errors path="manufacturer"/><br/>
        Toimittaja: <form:input path="supplier" type="text"/><form:errors path="supplier"/><br/>
        Säilytettävä kylmässä: <form:select path="needsColdStorage">
            <form:option value="1">Kyllä</form:option>
            <form:option value="0">Ei</form:option>
        </form:select><br/>
        Hälytysraja 1: <form:input path="alertLimit1" type="number"/><form:errors path="alertLimit1"/><br/>
        Hälytysraja 2: <form:input path="alertLimit2" type="number"/><form:errors path="alertLimit2"/><br/>
        <input type="submit" value="Tallenna muutokset">
    </form:form>
</div>

<%@include file="footer.jsp" %>