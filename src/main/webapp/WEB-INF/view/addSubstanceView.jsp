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
                <td><select path="type" class="substance">
                        <option value="0">Kitti</option>
                        <option value="1">Generaattori</option>
                        <option value="2">Muu</option>
                    </select></td>
            </tr>-->
            <c:if test="${substance.type=='1'}"> <!--Tämä tarvitaan vain, jos tyyppi on generaattori-->
                <tr>
                    <td>Valmistettava eluaatti</td>
                    <td><input id="genericName" name="genericName" type="text" value="TODO" class="substance"/></td>
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
                <td><input path="size" type="text" value="TODO" class="substance"/></td>
            </tr>
            <tr>
                <td>Vahvuus</td>
                <td><input path="strength" type="text" value="TODO" class="substance"/></td>
            </tr>
            <c:if test="${substance.type=='1'}"><!--Tämä tarvitaan vain, jos tyyppi on generaattori-->
                <tr>
                    <td>Puoliintumisaika</td>
                    <td><form:input path="halflife" type="text" size="2"/><form:errors path="halflife"/> tuntia</td>
                </tr>
            </c:if>
            <!--<tr>
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
            </tr>-->
            <tr>
                <td>Laadunvarmistus</td>
                <td><select id="qualityControl" name="qualityControl" class="substance">
                        <option value="1" selected="selected">Huomautetaan puuttumisesta</option>
                        <option value="0">Ei huomauteta puuttumisesta</option>
                    </select></td>
            </tr>
            <tr>
                <td>Huomautus vanhenemisesta</td>
                <td><form:input path="alertLimit1" type="number"/><form:errors path="alertLimit1"/> päivää ennen viimeistä käyttöpäivää</td>
            </tr>
            <tr>
                <td>Huomautus määrästä, kun</td>
                <td><form:input path="alertLimit2" type="number"/><form:errors path="alertLimit2"/> yksikköä jäljellä</td>
            </tr>
        </table>
        
            <br />
        <input type="submit" value="Lisää">&nbsp; &nbsp;
        <input type="button" value="Peruuta" onClick="parent.location = '${pageContext.servletContext.contextPath}/substanceView'" />

    </form:form>  

</div>

<%@include file="footer.jsp" %>