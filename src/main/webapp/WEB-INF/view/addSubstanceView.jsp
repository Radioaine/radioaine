<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="headeradmin.jsp" %>

<div id="contents">
    <h2>Lisää lääkeaine</h2>


    <form:form commandName="substance" action="substance" method="POST">
        <table class="noborder">
            <tr>
                <td>Aine:</td>
                <td><form:input path="name" type="text"/><form:errors path="name"/></td>
            </tr>
            <tr>
                <td>Tyyppi:</td>
                <td><form:select path="type">
                        <form:option value="0">Kitti</form:option>
                        <form:option value="1">Generaattori</form:option>
                        <form:option value="2">Muu</form:option>
                    </form:select></td>
            </tr>
            <tr>
                <td>Puoliintumisaika (jos on):</td>
                <td><form:input path="halflife" type="text"/><form:errors path="halflife"/></td>
            </tr>
            
            <tr>
                <td>Valmistaja:</td>
                <td><form:input path="manufacturer" type="text"/><form:errors path="manufacturer"/></td>
            </tr>
            <tr>
                <td>Toimittaja:</td>
                <td><form:input path="supplier" type="text"/><form:errors path="supplier"/></td>
            </tr>
            <tr>
                <td>Säilytettävä kylmässä:</td>
                <td><form:select path="needsColdStorage">
                        <form:option value="1">Kyllä</form:option>
                        <form:option value="0">Ei</form:option>
                    </form:select></td>
            </tr>
            <tr>
                <td>Hälytysraja 1:</td>
                <td><form:input path="alertLimit1" type="number"/><form:errors path="alertLimit1"/></td>
            </tr>
            <tr>
                <td>Hälytysraja 2:</td>
                <td><form:input path="alertLimit2" type="number"/><form:errors path="alertLimit2"/></td>
            </tr>
            <tr>
                <td><input type="submit" value="Lisää"></td>
            </tr>
        </table>
    </form:form>  

</div>

<%@include file="footer.jsp" %>