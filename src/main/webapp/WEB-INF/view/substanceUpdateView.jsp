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
                    <c:choose>
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
                    <form:select hidden="hidden" path="type">
                        <form:option value="${substance.type}"></form:option>
                    </form:select>
                </td>
                <td class="infotext"><c:choose>
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
                <td class="infotext">${substance.name}</td>
            </tr>
            <tr>
                <td>Geneerinen nimi</td>
                <td><form:input path="genericName" type="text" value="${substance.genericName}" class="substance"/><form:errors path="genericName"/></td>
                <td style="font-size: 90%;">${substance.genericName}</td>
            </tr>
            <c:if test="${substance.type=='1'}"> <!--Tämä tarvitaan vain, jos tyyppi on generaattori-->
                <tr>
                    <td>Valmistettava eluaatti</td>
                    <td><input id="eluateName" name="eluateName" type="text" value="${substance.eluateName}" class="substance"/></td>
                    <td class="infotext">${substance.eluateName}</td>
                </tr>
            </c:if>
            <tr>
                <td>Valmistaja</td>
                <td><form:input path="manufacturer" type="text" class="substance"/><form:errors path="manufacturer"/></td>
                <td class="infotext">${substance.manufacturer}</td>
            </tr>
            <tr>
                <td>Tukkuliike</td>
                <td><form:input path="supplier" type="text" class="substance"/><form:errors path="supplier"/></td>
                <td class="infotext">${substance.supplier}</td>
            </tr>
            <tr>

                <td>Tilavuus</td>
                <td><form:input path="volume" type="text" value="${substance.volume}" class="substance"/><form:errors path="volume"/></td>
                <td class="infotext">${substance.volume}</td>
            </tr>
            <tr>
                <td>Vahvuus</td>
                <td><form:input path="strength" type="text" value="${substance.strength}" class="substance"/><form:errors path="strength"/></td>
                <td class="infotext">${substance.strength}</td>
            </tr>
            <!--
            <tr>
                <td>Laadunvarmistus</td>
                <td><form:select path="qualityControl" name="qualityControl" class="substance">
                        <c:choose>
                            <c:when test="${substance.qualityControl=='2'}"> 
                                <form:option value="1">Huomautetaan puuttumisesta</form:option>
                                <form:option value="2" selected="selected">Ei huomauteta puuttumisesta</form:option>
                            </c:when>
                            <c:otherwise> 
                                <form:option value="1" selected="selected">Huomautetaan puuttumisesta</form:option>
                                <form:option value="2">Ei huomauteta puuttumisesta</form:option>
                            </c:otherwise>

                        </c:choose>
                    </form:select>
                </td>
                <c:choose>
                    <c:when test="${substance.qualityControl=='2'}"> 
                        <td class="infotext">Ei huomauteta puuttumisesta</td>
                    </c:when>
                    <c:otherwise> 
                        <td class="infotext">Huomautetaan puuttumisesta</td>
                    </c:otherwise>
                </c:choose>-->
            <tr>
                <td>Huomautus vanhenemisesta</td>
                <td><form:input path="warningBeforeDays" type="number"/><form:errors path="warningBeforeDays"/></td>
                <td style="font-size: 90%;">${substance.warningBeforeDays} päivää ennen viimeistä käyttöpäivää</td>
            </tr>
            <tr>
                <td>Huomautus määrästä, kun</td>
                <td><form:input path="warningBeforeAmount" type="number"/><form:errors path="warningBeforeAmount"/></td>
                <td class="infotext">${substance.warningBeforeAmount} yksikköä jäljellä</td>
            </tr>
        </table>

        <br />
        <c:choose>
            <c:when test="${substance.inUse == true}">
                <input type="submit" value="Tallenna">&nbsp; &nbsp;
            </c:when>
            <c:otherwise>
                <input disabled="disabled" type="submit" value="Tallenna">&nbsp; &nbsp;
            </c:otherwise>
        </c:choose>
        
        <input type="button" value="Peruuta" onClick="parent.location = '${pageContext.servletContext.contextPath}/substanceView'" />
        <br />
    </form:form>
        
    <c:if test="${substanceInUse == false && substance.inUse == true}">
        <form action="${pageContext.servletContext.contextPath}/deactivateSubstance/${substance.id}" method="POST">
            <input type="submit" value="Poista aine käytöstä" />
        </form>
    </c:if>
    <c:if test="${substanceInUse == true }">
        <input disabled="disabled" type="submit" value="Poista aine käytöstä" />
    </c:if>
    <c:if test="${substance.inUse == false}">
        <form action="${pageContext.servletContext.contextPath}/activateSubstance/${substance.id}" method="POST">
            <input type="submit" value="Ota aine käyttöön" />
        </form>
    </c:if>
</div>

<%@include file="footer.jsp" %>