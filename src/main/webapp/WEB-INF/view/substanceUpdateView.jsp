<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<script type="text/javascript" src="<c:url value="/css/script.js" />"></script>
<%@include file="headeradmin.jsp" %>

<div id="contents">
    <h2>${substance.name}</h2>
    <br />
    
    <form:form commandName="substance" action="${pageContext.servletContext.contextPath}/updateSubstance/${substance.id}" method="POST">
    <table class="noborder">
        <tr>
            <th></th>
            <th>Päivitetty</th>
            <th>Aiempi</th>
        </tr>
        <tr>
            <td>Tyyppi</td>
            <td>
                <!--<form:select path="type">
                    <form:option value="0">Kitti</form:option>
                    <form:option value="1">Generaattori</form:option>
                    <form:option value="2">Muu</form:option>
                </form:select>-->
            </td>
            <td style="font-size: 90%;"><c:choose>
                    <c:when test="${substance.type=='0'}">
                        Kitti
                    </c:when>
                    <c:when test="${substance.type=='1'}">
                        Generaattori
                    </c:when>
                    <c:otherwise>
                        Muu
                    </c:otherwise>
                </c:choose>
            </td>
        </tr>
        <tr>
            <td class="substanceFirst">Tuotenimi</td>
            <td class="substanceSecond"><form:input path="name" type="text" class="substance"/><form:errors path="name"/></td>
            <td style="font-size: 90%;">${substance.name}</td>
        </tr>
        <tr>
            <td>Geneerinen nimi</td>
            <td><input path="genericName" type="text" value="TODO" class="substance"/></td>
            <td style="font-size: 90%;">TODO</td>
        </tr>
        <c:if test="${substance.type=='1'}"> <!--Tämä tarvitaan vain, jos tyyppi on generaattori-->
            <tr>
                <td>Valmistettava eluaatti</td>
                <td><input id="genericName" name="genericName" type="text" value="TODO" class="substance"/></td>
                <td style="font-size: 90%;">TODO</td>
            </tr>
        </c:if>
        <tr>
            <td>Valmistaja</td>
            <td><form:input path="manufacturer" type="text" class="substance"/><form:errors path="manufacturer"/></td>
            <td style="font-size: 90%;">${substance.manufacturer}</td>
        </tr>
        <tr>
            <td>Tukkuliike</td>
            <td><form:input path="supplier" type="text" class="substance"/><form:errors path="supplier"/></td>
            <td style="font-size: 90%;">${substance.supplier}</td>
        </tr>
        <tr>

            <td>Tilavuus</td>
            <td><input path="size" type="text" value="TODO" class="substance"/></td>
            <td style="font-size: 90%;">TODO</td>
        </tr>
        <tr>
            <td>Vahvuus</td>
            <td><input path="strength" type="text" value="TODO" class="substance"/></td>
            <td style="font-size: 90%;">TODO</td>
        </tr>
        <c:if test="${substance.type=='1'}"><!--Tämä tarvitaan vain, jos tyyppi on generaattori-->
            <tr>
                <td>Puoliintumisaika</td>
                <td><form:input path="halflife" type="number"/><form:errors path="halflife"/> tuntia</td>
                <td style="font-size: 90%;">${substance.halflife} tuntia</td>
            </tr>   
        </c:if>
        <tr>
            <td>Laadunvarmistus</td>
            <td><select id="qualityControl" name="qualityControl" class="substance">
                    <option value="1" selected="selected">Huomautetaan puuttumisesta</option>
                    <option value="0">Ei huomauteta puuttumisesta</option>
                </select>
            </td>
            <td style="font-size: 90%;">TODO</td>
        </tr>
        <tr>
            <td>Huomautus vanhenemisesta</td>
            <td><form:input path="alertLimit1" type="number"/><form:errors path="alertLimit1"/></td>
            <td style="font-size: 90%;">${substance.alertLimit1} päivää ennen viimeistä käyttöpäivää</td>
        </tr>
        <tr>
            <td>Huomautus määrästä, kun</td>
            <td><form:input path="alertLimit2" type="number"/><form:errors path="alertLimit2"/></td>
            <td style="font-size: 90%;">${substance.alertLimit2} yksikköä jäljellä</td>
        </tr>
    </table>

    <br />
    <input type="submit" value="Tallenna">&nbsp; &nbsp;
    <input type="button" value="Peruuta" onClick="parent.location = '${pageContext.servletContext.contextPath}/substanceView'" />
    <br />
    <br />
    
    <input type="button" value="Poista aine" onClick="parent.location = '${pageContext.servletContext.contextPath}/substanceView'" />TODO

    </form:form>
</div>

<%@include file="footer.jsp" %>