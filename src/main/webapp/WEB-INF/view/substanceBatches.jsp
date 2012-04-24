<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="headerstorage.jsp" %>



<div id="contents">

    <h2>${substance.name}</h2>
    <br/>

    <table class="noborder">

        <tr>
            <td class="name">Geneerinen nimi</td>
            <td>${substance.genericName}</td>
        </tr>

        <c:if test="${substance.type==1}">
            <tr>
                <td>Eluaatin nimi</td>
                <td>${substance.eluateName}</td>
            </tr>
        </c:if>

        <tr>
            <td>Valmistaja</td>
            <td>${substance.manufacturer}</td>
        </tr>		
        <tr>
            <td>Tukkuliike</td>
            <td>${substance.supplier}</td>
        </tr>
        <tr>
            <td>Tilavuus</td>
            <td>${substance.volume}</td>
        </tr>
        <tr>
            <td>Vahvuus</td>
            <td>${substance.strength}</td>
        </tr>		
    </table>

    <br/>

    <table class="listing">

        <tr>
            <th class="amount">Lkm</th>
            <th class="batchnumber">Eränumero</th>
            <th class="oldest">Käytettävä ennen</th>
            <th class="quality">Laadunvarmistus</th>
            <th class="wide">Kommentit</th>
        </tr>

        <c:forEach var="batch" items="${substanceBatches}">
            <c:if test="${batch.amount!= 0}">
                <c:choose>
                    <c:when test="${batch.qualityCheck==1}"> <!--TODO: Tähän myös vanhentunut-->
                        <tr id="${batch.id}">
                        </c:when>
                        <c:when test="${batch.qualityCheck==2}">
                        <tr id="${batch.id}" class="red">
                            <!--TODO: Tähän vanhenemishälytysrajan alittanut sinisellä:
                            /c:when>
                            c:when (hälytysraja on alitettu)>
                                <tr id="{batch.id}" class="blue">
                            -->
                        </c:when>
                        <c:otherwise>
                        <tr id="${batch.id}" class="yellow">
                        </c:otherwise>
                    </c:choose>
                    <td class="center">${batch.amount}</td>
                    <td><a href="<c:out value="${pageContext.servletContext.contextPath}" />/batch/${batch.id}">${batch.batchNumber}</a></td>
                    <td><fmt:formatDate pattern="dd.MM.yyyy" value="${batch.expDate}"/></td>
                    <td id="qualityCheck">
                        <c:choose>
                            <c:when test="${batch.qualityCheck==1}">
                                Hyväksytty
                            </c:when>
                            <c:when test="${batch.qualityCheck==2}">
                                Hylätty
                            </c:when>
                            <c:otherwise>
                                <form action="${pageContext.servletContext.contextPath}/doCheck/${batch.id}+${substance.id}" method="POST">
                                    <select name="qualityCheck">
                                        <option value="1">Hyväksytty</option>
                                        <option value="2">Hylätty</option>
                                    </select>
                                    <input type="text" name="sig" size="3" />
                                    <input type="submit" value="Kirjaa tulos" />
                                </form>
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td>${batch.note}</td>
                </tr>
            </c:if>
        </c:forEach>
    </table>     

    <h2>Tapahtumat</h2>
    </br>

    <c:forEach var="event" items="${substanceHistory}">
        <div class ="event"><fmt:formatDate value="${event.timestamp}" pattern="dd.MM.yyyy HH:mm:ss"/>
            ${event.info}</div></br>
        </c:forEach>

</div>

<%@include file="footer.jsp" %>