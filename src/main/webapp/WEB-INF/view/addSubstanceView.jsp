<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="headeradmin.jsp" %>

<!--KESKEN!-->

<!--Tähän pitää jotenkin tuoda tieto siitä, minkä tyyppisen aineen lisäys on valittu-->

<div id="contents">
    <h2>Lisää <c:choose>
                    <c:when test="${substance.type=='0'}">
                        kitti
                    </c:when>
                    <c:when test="${substance.type=='1'}">
                        generaattori
                    </c:when>
                    <c:otherwise>
                        muu
                    </c:otherwise>
                </c:choose></h2>
    <br />

    <form:form commandName="substance" action="substance" method="POST">
        
        <table class="noborder">
            <tr>
                <td>Tuotenimi</td>
                <td><form:input path="name" type="text" class="substance"/><form:errors path="name"/></td>
            </tr>
            <tr>
                <td>Geneerinen nimi</td>
                <td><input path="genericName" type="text" value="TODO" class="substance"/></td>
            </tr>
            <!--<tr>
                <td>Tyyppi</td>
                <td><select id="type" name="type" class="substance">
                        <option value="0" selected="selected">Kitti</option>
                        <option value="1">Generaattori</option>
                        <option value="2">Muu</option>
                    </select></td>
            </tr>-->
            <c:if test="${substance.type=='1'}">
            <tr>
                <td>Valmistettava eluaatti</td> <!--Tämä vain jos tyyppi on generaattori-->
                <td><input id="genericName" name="genericName" type="text" value="" class="substance"/></td>
            </tr>
            </c:if>
            <tr>
                <td>Valmistaja</td>
                <td><input id="manufacturer" name="manufacturer" type="text" value="" class="substance"/></td>
            </tr>
            <tr>
                <td>Tukkuliike</td>
                <td><input id="supplier" name="supplier" type="text" value="" class="substance"/></td>
            </tr>
            <tr>
                <td>Tilavuus</td>
                <td><input id="size" name="size" type="text" value="" class="substance"/></td>
            </tr>
            <tr>
                <td>Vahvuus</td>
                <td><input id="strength" name="strength" type="text" value="" class="substance"/></td>
            </tr>
            <tr>
                <td>Säilytettävä kylmässä</td>
                <td><select id="needsColdStorage" name="needsColdStorage" class="substance">
                        <option value="1" selected="selected">Kyllä</option>
                        <option value="0">Ei</option>
                    </select></td>
            </tr>
            <tr>
                <td>Käyttötapa</td>
                <td><select id="usage" name="usage" class="substance">
                        <option value="0" selected="selected">Kerralla</option>
                        <option value="1">Saman päivän aikana</option>
                        <option value="2">Poistettava erikseen</option>
                    </select></td>
            </tr>
            <tr>
                <td>Laadunvarmistus</td>
                <td><select id="needsColdStorage" name="needsColdStorage" class="substance">
                        <option value="1" selected="selected">Huomautetaan puuttumisesta</option>
                        <option value="0">Ei huomauteta puuttumisesta</option>
                    </select></td>
            </tr>
            <tr>
                <td>Huomautus vanhenemisesta</td>
                <td><input id="alertLimit1" name="alertLimit1" type="number" value="0" size="2"/> päivää ennen viimeistä käyttöpäivää</td>
            </tr>
            <tr>
                <td>Huomautus määrästä, kun</td>
                <td><input id="alertLimit2" name="alertLimit2" type="number" value="0" size="2"/> yksikköä jäljellä</td>
            </tr>
        </table>
        
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