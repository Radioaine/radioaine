<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="headerfront.jsp" %>
<script type="text/javascript" src="<c:url value="/script/ui.datepicker-fi.js" />"></script>
<script>
    $(function() {
        $( "#eluatingtime" ).datepicker();
    });
</script>
    <fmt:formatDate pattern="HH" value="${eluate.date}" var="eluateHours"/>
    <fmt:formatDate pattern="mm" value="${eluate.date}" var="eluateMinutes"/>
    <fmt:formatDate pattern="dd.MM.yyyy" value="${eluate.date}" var="eluateDate"/>


<div id="contents">
    <h2>Eluaatin ${eluate.generators[0].substance.eluateName} muokkaus</h2>
    <br/>   
    <form:form commandName="eluateForm" action="${pageContext.servletContext.contextPath}/modifyEluate/${eluate.id}" method="POST">
        <table class="noborder">
            <tr>
                <td>Valitut</td>
                <td class="infotext" colspan="3">
                    <c:forEach var="gene" items="${eluate.generators}">
                        ${gene.substance.name}, Erä ${gene.batchNumber}, Käyt. ennen <fmt:formatDate value="${gene.expDate}" pattern="dd.MM.yyyy"/>, Sijainti 
                        <c:forEach var="location" items="${gene.storageLocations}">
                            <c:if test="${location[1] != null}">
                                <c:if test="${location[1] > 0}">
                                    <c:forEach var="storage" items="${storages}">
                                        <c:if test="${storage.id == location[0]}">
                                            ${storage.name}
                                        </c:if>
                                    </c:forEach>
                                </c:if>
                            </c:if>
                        </c:forEach>
                        <br/>
                    </c:forEach>
                    <c:forEach var="oth" items="${eluate.others}">
                        ${oth.substance.name}, Erä ${oth.batchNumber}, Käyt. ennen <fmt:formatDate value="${oth.expDate}" pattern="dd.MM.yyyy"/>, Sijainti
                        <c:forEach var="location" items="${oth.storageLocations}">
                            <c:if test="${location[1] != null}">
                                <c:if test="${location[1] > 0}">
                                    <c:forEach var="storage" items="${storages}">
                                        <c:if test="${storage.id == location[0]}">
                                            ${storage.name}
                                        </c:if>
                                    </c:forEach>
                                </c:if>
                            </c:if>
                        </c:forEach>
                        <br/>
                    </c:forEach>
                </td>
            </tr>
            
            <tr style="display: none;">
                <td class="infotext" id="selected" colspan="3">
                    <c:forEach var="gene" items="${eluate.generators}">
                        <script> generateDivs("${gene.substance.name}, Erä ${gene.batchNumber}, Käyt. ennen <fmt:formatDate value="${gene.expDate}" pattern="dd.MM.yyyy"/>, TODO Sijainti", ${gene.id}, 0);</script>
                    </c:forEach>
                    <c:forEach var="oth" items="${eluate.others}">
                        <script> generateDivs("${oth.substance.name}, Erä ${oth.batchNumber}, Käyt. ennen <fmt:formatDate value="${oth.expDate}" pattern="dd.MM.yyyy"/>, TODO Sijainti", ${oth.id}, 4);</script>
                    </c:forEach>
                </td>
            </tr>
            <tr>
                <td colspan="4">&nbsp; </td>
            </tr>
            <tr>
                <th></th>
                <th class="new">Päivitetty</th>
                <th>Aiempi</th>
                <th></th>
            </tr>
            <tr>
                <td></td>
                <td class="infotext">Klo<span id="pvm">Pvm</span></td>
                <td class="infotext">Klo<span id="pvm"> &nbsp; &nbsp;Pvm</span></td>
                <td class="new"></td>
            </tr>
            <tr>
                <td>Eluointiaika</td>
                <td><input required name="hours" type="text" id="hours" value="${eluateHours}" size="2"/>:<input
                        required name="minutes" type="text" id="minutes" size="2" value="${eluateMinutes}"/>
                    <input required name="date" type="text" id="eluatingtime" value="${eluateDate}"/>
                </td>
                <td class="infotext">${eluateHours}:${eluateMinutes}<span id="pvm">${eluateDate}</span></td>
                <td></td>
            </tr>
            <tr>
                <td>Aktiivisuus</td>
                <td><input pattern="^[0-9]{1,4}([,.][0-9]{1,4})?$" value="${eluate.strength}" name="strength" type="text" size="5"/>
                    <form:select path="unit">
                        <c:choose>
                            <c:when test="${eluate.unit == 0}">
                                <option value="0" selected="selected">GBq</option>
                                <option value="2">MBq</option>
                                <option value="1">kBq</option>
                            </c:when>
                            <c:when test="${eluate.unit == 1}">
                                <option value="0">GBq</option>
                                <option value="2">MBq</option>
                                <option value="1" selected="selected">kBq</option>
                            </c:when>
                            <c:otherwise>
                                <option value="0">GBq</option>
                                <option value="2" selected="selected">MBq</option>
                                <option value="1">kBq</option>
                            </c:otherwise>
                        </c:choose>
                    </form:select>
                </td>
                <td class="infotext" colspan="2">${eluate.strength}
                    <c:choose>
                        <c:when test="${eluate.unit == 0}">
                            GBq
                        </c:when>
                        <c:when test="${eluate.unit == 1}">
                            kBq
                        </c:when>
                        <c:otherwise>
                            MBq
                        </c:otherwise>
                    </c:choose>
                </td>

            </tr>
            <tr>
                <td>Tilavuus</td>
                <td><input type="text" pattern="^[0-9]{1,4}([,.][0-9]{1,4})?$" name="volume" value="${eluate.volume}" size="5"/> ml</td>
                <td class="infotext" colspan="2">${eluate.volume} ml</td>
            </tr>
            <tr>
                <td>Varastopaikka</td>
                <td><form:select path="storageLocation">
                        <c:forEach var="storage" items="${storages}" varStatus="i">
                            <c:if test="${storage.hidden == false}">
                                <c:choose>
                                    <c:when test="${storage.id == eluate.storageLocation}">
                                        <form:option selected="selected" value="${storage.id}">${storage.name}</form:option>
                                    </c:when>
                                    <c:otherwise>
                                        <form:option value="${storage.id}">${storage.name}</form:option>
                                    </c:otherwise>
                                </c:choose>
                            </c:if>
                        </c:forEach>
                    </form:select>
                </td>
                <td class="infotext" colspan="2">
                    <c:forEach var="storage" items="${storages}" varStatus="i">
                        <c:if test="${storage.id == eluate.storageLocation}">
                            ${storage.name}
                        </c:if>
                    </c:forEach>
                </td>
            </tr>
            <tr>
                <td>Kommentit</td>
                <td><form:input path="note" type="text" value="${eluate.note}"/><form:errors path="note"/></td>
                <td class="infotext" colspan="2">${eluate.note}</td>
            </tr>
            <tr>
                <td colspan="4">&nbsp; </td>
            </tr>
            <tr>
                <td>Nimikirjaimet</td>
                <td colspan="3"><input required name="signature" type="text" id="signature" size="6"/></td>
            </tr>
         </table>
         <br/>

        <input type="submit" value="Tallenna">&nbsp; &nbsp;
        <input type="button" value="Peruuta" onClick="parent.location = '${pageContext.servletContext.contextPath}/eluate/${eluate.id}'" />

    </form:form>

</div>
<%@include file="footer.jsp" %>        