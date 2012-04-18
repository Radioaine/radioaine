<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="headerfront.jsp" %>
<script type="text/javascript" src="<c:url value="/script/ui.datepicker-fi.js" />"></script>
<script>
    $(function() {
        $( "#eluatingtime" ).datepicker();
    });
</script>


<div id="contents">
    <h2>Uusi eluaatti</h2>
    <br/>
    <form:form commandName="eluate" action="createEluate" method="POST">

        <table class="noborder">
            <tr>
                <td class="name">Generaattori</td>
                <td><select multiple="multiple" class="list">
                        <c:forEach var="generator" items="${generators}">
                            <c:forEach var="location" items="${generator.storageLocations}">
                                <c:if test="${location[1] != null}">
                                    <c:if test="${location[1] > 0}">
                                        <option id="0" onclick="eluateAmounts(event)"  value="${generator.id}">${generator.substance.name}, Erä 
                                            ${generator.batchNumber}, Käyt. ennen <fmt:formatDate value="${generator.expDate}" pattern="dd.MM.yyyy"/>, Sijainti 
                                            <c:forEach var="storage" items="${storages}">
                                                <c:if test="${storage.id == location[0]}">
                                                    ${storage.name}
                                                </c:if>
                                            </c:forEach>
                                        </option>
                                    </c:if>
                                </c:if>
                            </c:forEach>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Eluointiliuos</td>
                <td><select multiple="multiple" class="list">
                        <c:forEach var="other" items="${others}">
                            <c:forEach var="location" items="${other.storageLocations}">
                                <c:if test="${location[1] != null}">
                                    <c:if test="${location[1] > 0}">
                                        <option id="2" onclick="eluateAmounts(event)" value="${other.id}">${other.substance.name},
                                            ${other.batchNumber}, Käyt. ennen <fmt:formatDate value="${other.expDate}" pattern="dd.MM.yyyy"/>, Sijainti 
                                            <c:forEach var="storage" items="${storages}">
                                                <c:if test="${storage.id == location[0]}">
                                                    ${storage.name}
                                                </c:if>
                                            </c:forEach>
                                        </option>
                                    </c:if>
                                </c:if>
                            </c:forEach>
                        </c:forEach>
                    </select>
                <td>
            </tr>
            <tr>
                <td>&nbsp; </td>
                <td> </td>
            </tr>
            <tr>
                <td>Valitut</td>
                <td class="infotext" id="selected"></td>
            </tr>
            <tr>
                <td>&nbsp; </td>
                <td> </td>
            </tr>
            <tr>
                <td></td>
                <td  class="infotext"">Klo<span id="pvm">Pvm</span></td>
            </tr>
            <tr>

                <td>Eluointiaika</td>
                <td><input required name="hours" type="text" id="hours" value="${hours}" size="2"/>:<input
                        required name="minutes" type="text" id="minutes" size="2" value="${minutes}"/>
                    <input required name="date" type="text" id="eluatingtime" value="${date}"/></td>
            </tr>
            <tr>
                <td>Aktiivisuus</td>
                <td><input pattern="^[0-9]{1,4}([,.][0-9]{1,4})?$" name="strength" type="text" size="5"/>
                    <form:select path="unit">
                        <option value="0">GBq</option>
                        <option value="1">MBq</option>
                    </form:select>

            </td>
            </tr>
            <tr>
                <td>Tilavuus</td>
                <td id="volPlace"><select id="vol" name="volume" class="am">
                        <option value="5">5</option>
                        <option value="10">10</option>
                        <option value="11">11</option>
                    </select> ml &nbsp; &nbsp; <button type="button" onclick="customVolume()">Syötä muu tilavuus</button>
                </td>
            </tr>
            <tr>
                <td>Varastopaikka</td>
                <td><form:select  path="storageLocation">
                        <c:forEach var="storage" items="${storages}" varStatus="i">
                            <c:if test="${storage.hidden == false}">
                                <form:option value="${storage.id}">${storage.name}</form:option>
                            </c:if>
                        </c:forEach>
                    </form:select></td>
            </tr>
            <tr>
                <td>Kommentit</td>
                <td><form:textarea path="note" type="text"/><form:errors path="note"/></td>
            </tr>
            <tr>

                <td>Nimikirjaimet</td>
                <td><input required name="signature" type="text" id="signature" size="6"/></td>

            </tr>
        </table>
        <br/>

        <input type="submit" value="Tallenna">&nbsp; &nbsp;
        <input type="button" value="Peruuta" onClick="parent.location = '${pageContext.servletContext.contextPath}/frontpage'" />

    </form:form>

</div>
<%@include file="footer.jsp" %>     