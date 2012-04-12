<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="headerfront.jsp" %>
<script>
    function checkType()    {
        var newdiv = $("<tr>");
        substance =  '${substances}';

    }
</script>
<script type="text/javascript" src="<c:url value="/script/ui.datepicker-fi.js" />"></script>
<script>
    $(function() {
        $( "#creationtime" ).datepicker();
    });
</script>

<div id="contents">
    <h2>Radiol‰‰kkeen ${radioMedicine.id} muokkaus</h2>
    <br/>
    <form:form commandName="radioMedicineForm" action="${pageContext.servletContext.contextPath}/modifyRadioMed/${radioMedicine.id}" method="POST">

        <table class="noborder">
            <tr>
                <td class="name">Eluaatti</td>
                <td colspan="3">
                    <select multiple="multiple" class="list" >
                        <c:forEach var="eluate" items="${eluates}">
                            <option id="3" onclick="eluateAmounts(event)" value="${eluate.id}">Klo <fmt:formatDate value="${eluate.date}" pattern="hh.mm"/>, ${eluate.getName()}, Aktiivisuus ${eluate.strength}, Sijainti TODO${eluate.storageLocation}, Tekij‰ ${eluate.signature}</option>
                        </c:forEach>
                    </select>
                </td>
                
            </tr>
            <tr>
                <td>Kitti</td>
                <td colspan="3"><select multiple="multiple" class="list">
                        <c:forEach var="kit" items="${kits}">
                            <option id="1" onclick="eluateAmounts(event)" value="${kit.id}">${kit.substance.name}, Er‰ 
                                ${kit.batchNumber}, K‰yt. ennen <fmt:formatDate value="${kit.expDate}" pattern="dd.MM.yyyy"/>, TODO Sijainti</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Muu</td>
                <td colspan="3"><select multiple="multiple" class="list" >
                        <c:forEach var="other" items="${others}">
                            <option id="2" onclick="eluateAmounts(event)" value="${other.id}">${other.substance.name}, Er‰
                                ${other.batchNumber}, K‰yt. ennen <fmt:formatDate value="${other.expDate}" pattern="dd.MM.yyyy"/>, TODO Sijainti</option>
                            </c:forEach>
                    </select>
                <td>
            </tr>
            <tr>
                <td colspan="4">&nbsp; </td>
            </tr>
                        <tr>
                <td rowspan="5" >Valitut</td>
                <th>Aiempi</th>
            </tr>
            <tr>
                <td class="infotext" colspan="3">
                    <c:forEach var="eluate" items="${radioMedicine.eluates}">
                        Klo <fmt:formatDate value="${eluate.date}" pattern="hh.mm"/> ${eluate.getName()}, Er‰ ${eluate.generators.get(0).batchNumber}, Aktiivisuus ${eluate.strength}, Sijainti TODO${eluate.storageLocation}, Tekij‰ ${eluate.signature}<br/>
                    </c:forEach>
                    <c:forEach var="kit" items="${radioMedicine.kits}">
                        ${kit.substance.name}, Er‰ ${kit.batchNumber}, K‰yt. ennen <fmt:formatDate value="${kit.expDate}" pattern="dd.MM.yyyy"/>, TODO Sijainti<br/>
                    </c:forEach>
                    <c:forEach var="oth" items="${radioMedicine.others}">
                        ${oth.substance.name}, Er‰ ${oth.batchNumber}, K‰yt. ennen <fmt:formatDate value="${oth.expDate}" pattern="dd.MM.yyyy"/>, TODO Sijainti<br/>
                    </c:forEach>
                </td>
            </tr>
            <tr>
                <td colspan="3">&nbsp; </td>
            </tr>
            <tr>
                <th colspan="3">P‰ivitetty</th>
            </tr>
            <tr>
                <td class="infotext" id="selected" colspan="3">
                    <c:forEach var="eluate" items="${radioMedicine.eluates}">
                        <script> generateDivs("Klo <fmt:formatDate value="${eluate.date}" pattern="hh.mm"/> ${eluate.getName()}, Er‰ ${eluate.generators.get(0).batchNumber}, Aktiivisuus ${eluate.strength}, Sijainti TODO${eluate.storageLocation}, Tekij‰ ${eluate.signature} ", ${eluate.id}, 3);</script>
                    </c:forEach>
                    <c:forEach var="kit" items="${radioMedicine.kits}">
                        <script> generateDivs("${kit.substance.name}, Er‰ ${kit.batchNumber}, K‰yt. ennen <fmt:formatDate value="${kit.expDate}" pattern="dd.MM.yyyy"/>, TODO Sijainti", ${kit.id}, 1);</script>
                    </c:forEach>
                    <c:forEach var="oth" items="${radioMedicine.others}">
                        <script> generateDivs("${oth.substance.name}, Er‰ ${oth.batchNumber}, K‰yt. ennen <fmt:formatDate value="${oth.expDate}" pattern="dd.MM.yyyy"/>, TODO Sijainti", ${oth.id}, 4);</script>
                    </c:forEach>
            </td>
            </tr>
            
            <tr>
                <td colspan="4">&nbsp; </td>
            </tr>
            <tr>
                <th></th>
                <th class="new">P‰ivitetty</th>
                <th class="new" colspan="2">Aiempi</th>
            </tr>
            <tr>
                <td></td>
                <td class="infotext">Klo<span id="pvm">Pvm</span></td>
                <td class="infotext">Klo<span id="pvm"> &nbsp; &nbsp;Pvm</span></td>
                <td></td>
            </tr>
            <tr>
                <td>Luontiaika</td>
                <fmt:formatDate value="${radioMedicine.date}" pattern="hh" var="radiohours"/>
                <fmt:formatDate value="${radioMedicine.date}" pattern="mm" var="radiominutes"/>
                <fmt:formatDate value="${radioMedicine.date}" pattern="dd.MM.yyyy" var="radiodate"/>
                <td><input required name="hours" type="text" id="hours" size="2" value="${radiohours}"/>:<input required
                        name="minutes" type="text" id="minutes" size="2" value="${radiominutes}"/>
                    <input required name="date" type="text" id="creationtime" value="${radiodate}"/>
                </td>
                <td class="infotext">${radiohours}:${radiominutes}<span id="pvm">${radiodate}</span></td>
                <td></td>
            </tr>
            <tr>
                <td>Aktiivisuus</td>
                <td><form:input path="strength" type="text" size="5" value="${radioMedicine.strength}"/><form:errors path="strength"/>
                    <form:select path="unit">
                    <option value="0">GBq</option>
                    <option value="1">MBq</option>
                    </form:select>
                </td>
                <td class="infotext" colspan="2">${radioMedicine.strength}
                    <c:choose>
                        <c:when test="${radioMedicine.unit == 0}">
                            GBq
                        </c:when>
                        <c:otherwise>
                            MBq
                        </c:otherwise>
                    </c:choose>
                </td>
            </tr>
            <tr>
                <td>Tilavuus</td>
                <td><form:input path="volume" pattern="^[0-9]{1,4}([,.][0-9]{1,4})?$" type="text" size="5" value="${radioMedicine.volume}" /><form:errors path="volume"/>ml</td>
                <td class="infotext" colspan="2">${radioMedicine.volume} ml</td>
            </tr>
            <tr>
                <td>Varastopaikka</td>
                <td><form:select path="storageLocation">
                        <c:forEach var="storage" items="${storages}" varStatus="i">
                            <c:if test="${storage.hidden == false}">
                                <form:option value="${storage.id}">${storage.name}</form:option>
                            </c:if>
                        </c:forEach>
                    </form:select>
                </td>
                <td class="infotext" colspan="2">${radioMedicine.storageLocation} TODO varastopaikan nimi</td>
            </tr>
            <tr>
                <td>Kommentit</td>
                <td><form:input path="note" type="text" value="${radioMedicine.note}"/><form:errors path="note"/></td>
                <td class="infotext" colspan="2">${radioMedicine.note}</td>
            </tr>
            <tr>
                <td colspan="4">&nbsp; </td>
            </tr>
            <tr>
                <td>Nimikirjaimet</td>
                <td colspan="3"><form:input required="required" path="signature" type="text" id="signature" size="6"/><form:errors path="signature"/></td>
            </tr>
        </table>
        <br/>
        
        <input type="submit" value="Tallenna muutokset">&nbsp; &nbsp;
        <input type="button" value="Peruuta" onClick="parent.location = '${pageContext.servletContext.contextPath}/RadioMedicine/${radioMedicine.id}'" />
        
    </form:form>
</div>
<%@include file="footer.jsp" %>      