<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%@include file="headeradmin.jsp" %>

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

    <form:form commandName="substance" action="${pageContext.servletContext.contextPath}/substance/${substance.type}" method="POST">

        <table class="noborder">
            <tr>
                <td class="substanceFirst">Tuotenimi</td>
                <td><form:input path="name" type="text" class="substance"/><form:errors path="name"/></td>
            </tr>
            <tr>
                <td>Geneerinen nimi</td>
                <td><form:input path="genericName" type="text" class="substance"/><form:errors path="genericName"/></td>
            </tr>

            <c:if test="${substance.type=='1'}"> <!--Tämä tarvitaan vain, jos tyyppi on generaattori-->
                <tr>
                    <td>Valmistettava eluaatti</td>
                    <td><form:input path="eluateName" name="genericName" type="text" class="substance"/><form:errors path="eluateName"/></td>
                </tr>
            </c:if>
            <tr>
                <td>Valmistaja</td>
                <td><form:input path="manufacturer" type="text" class="substance"/><form:errors path="manufacturer"/></td>
            </tr>
            <tr>
                <td>Tukkuliike</td>
                <td><form:input path="supplier" type="text" class="substance"/><form:errors path="supplier"/></td>
            </tr>
            <tr>
                <td>Tilavuus</td>
                <td><form:input path="volume" type="text" class="substance"/><form:errors path="volume"/></td>
            </tr>
            <tr>
                <td>Vahvuus</td>
                <td><form:input path="strength" type="text" class="substance"/><form:errors path="strength"/></td>
            </tr>
            <!--<c:if test="${substance.type=='1'}"><!--Tämä tarvitaan vain, jos tyyppi on generaattori--><!--
                <tr>
                    <td>Puoliintumisaika</td>
                    <td><form:input path="halflife" type="text" size="2"/><form:errors path="halflife"/> tuntia</td>
                </tr>
            </c:if>
            <tr>
                <td>Säilytettävä kylmässä</td>
                <td><select path="needsColdStorage" class="substance">
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
                <td><form:select path="qualityControl" name="qualityControl" class="substance">
                        <form:option value="1" label="Huomautetaan puuttumisesta" selected="selected"></form:option>
                        <form:option value="2" label="Ei huomauteta puuttumisesta"></form:option>
                    </form:select>

                </td>
            </tr>
            <tr>-->
                <td>Huomautus vanhenemisesta</td>
                <td><form:input path="warningBeforeDays" type="number"/><form:errors path="warningBeforeDays"/> päivää ennen viimeistä käyttöpäivää</td>
            </tr>
            <tr>
                <td>Huomautus määrästä, kun</td>
                <td><form:input path="warningBeforeAmount" type="number"/><form:errors path="warningBeforeAmount"/> yksikköä jäljellä</td>
            </tr>
        </table>

        <br />
        <input type="submit" value="Lisää">&nbsp; &nbsp;
        <input type="button" value="Peruuta" onClick="parent.location = '${pageContext.servletContext.contextPath}/substanceView'" />

    </form:form>  

</div>

<%@include file="footer.jsp" %>