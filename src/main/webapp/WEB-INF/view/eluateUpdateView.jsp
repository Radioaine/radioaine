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
    <h2>Eluuatin ${eluate.id} muokkaus</h2>
    <br/>   
    <form:form commandName="eluateForm" action="${pageContext.servletContext.contextPath}/modifyEluate/${eluate.id}" method="POST">
        
        <table class="noborder">
            <tr>
                <td class="name">Generaattori</td>
                <td><select multiple="multiple" class="list">
                        <c:forEach var="generator" items="${generators}">
                            <option id="0" onclick="eluateAmounts(event)"  value="${generator.id}">${generator.substance.name}, Erä 
                                ${generator.batchNumber}, Käyt. ennen <fmt:formatDate value="${generator.expDate}" pattern="dd.MM.yyyy"/>, TODO Sijainti</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Eluointiliuos</td>
                <td><select multiple="multiple" class="list" >
                        <c:forEach var="other" items="${others}">
                            <option id="2" onclick="eluateAmounts(event)" value="${other.id}">${other.substance.name}, Erä
                                ${other.batchNumber}, Käyt. ennen <fmt:formatDate value="${other.expDate}" pattern="dd.MM.yyyy"/>, TODO Sijainti</option>
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
                <td class="infotext" id="selected">
                    <c:forEach var="gene" items="${eluate.generators}">
                        <script> generateDivs("${gene.substance.name}", ${gene.id}, 0);</script>
                    </c:forEach>
                    <c:forEach var="oth" items="${eluate.others}">
                        <script> generateDivs("${oth.substance.name}", ${oth.id}, 4);</script>
                    </c:forEach>
                </td>
            </tr>
            <tr>
                <td>&nbsp; </td>
                <td> </td>
            </tr>
            <tr>
                <td></td>
                <td class="infotext">Klo<span id="pvm">Pvm</span></td>
            </tr>
            <tr>
                <td>Eluointiaika</td>
                <td><input required name="hours" type="text" id="hours" value="${eluateHours}" size="2"/>:<input
                        required name="minutes" type="text" id="minutes" size="2" value="${eluateMinutes}"/>
                    <input required name="date" type="text" id="eluatingtime" value="${eluateDate}"/></td>
            </tr>
            <tr>
                <td>Aktiivisuus</td>
                <td><input pattern="\d+(\.\d)?" value="${eluate.strength}" name="strength" type="text" size="5"/>
                    <form:select path="unit">
                        <option value="0">GBq</option>
                        <option value="1">MBq</option>
                    </form:select>

            </td>
            </tr>
            <tr>
                <td>Tilavuus</td>
                <td><input type="text" name="volume" value="${eluate.volume}" size="5"/> ml
                </td>
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
            </tr>
            <tr>
                <td>Kommentit</td>
                <td><form:input path="note" type="text" value="${eluate.note}"/><form:errors path="note"/></td>
            </tr>
            <tr>
                <td>Nimikirjaimet</td>
                <td><input required name="signature" type="text" id="signature" size="6"/></td>
            </tr>
         </table>
         <br/>

                <input type="submit" value="Tallenna">&nbsp; &nbsp;
                <input type="button" value="Peruuta" onClick="parent.location = '${pageContext.servletContext.contextPath}/eluate/${eluate.id}'" />
                <br />
                <br />

                <input type="button" value="Poista eluaatti" onClick="parent.location = '${pageContext.servletContext.contextPath}/frontpage'" />TODO



    </form:form>

</div>
<%@include file="footer.jsp" %>        