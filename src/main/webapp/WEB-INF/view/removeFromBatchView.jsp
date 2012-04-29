<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="headerstorage.jsp" %>

<div id="contents">
    <h2>${batch.substance.name} / er‰ ${batch.batchNumber}</h2> 
    <br/>

    <table class="noborder">

        <tr>
            <td class="name">K‰ytett‰v‰ ennen</td>
            <td><fmt:formatDate value="${batch.expDate}" pattern="dd.MM.yyyy" var="expire"/>${expire}</td>
        </tr>
        
        <c:choose>
            <c:when test="${batch.qualityCheck==1}">
                <tr>
            </c:when>
            <c:when test="${batch.qualityCheck==2}">
                <tr class="red">
            </c:when>
            <c:otherwise>
                <tr class="yellow">
            </c:otherwise>
        </c:choose>
            <td>Laadunvarmistus</td>
            <td>
                <c:choose>
                    <c:when test="${batch.qualityCheck==1}">
                        Hyv‰ksytty
                    </c:when>
                    <c:when test="${batch.qualityCheck==2}">
                        Hyl‰tty
                    </c:when>
                    <c:otherwise>
                        Suorittamatta
                    </c:otherwise>
                </c:choose>
            </td>
        </tr>
        
        <tr>
            <td>Kommentit</td>
            <td>${batch.note}</td>
        </tr>
        
        <tr>
            <td>Varastossa</td>
            <td>${batch.amount} kpl</td>
        </tr>
        
        <tr>
            <td>Sijainnit</td>
            <td valign="top">
                <c:forEach var="location" varStatus="i" items="${batch.storageLocations}">
                    <c:choose>
                        <c:when test="${batch.storageLocations[i.index][1] > 0}">
                            <c:forEach var="storage" items="${storages}">
                                <c:if test="${storage.id == location[0]}">
                                    ${location[1]} kpl ${storage.name}<br/>
                                </c:if>
                            </c:forEach>
                        </c:when>
                    </c:choose>
                </c:forEach>  
            </td>
        </tr>

    </table>
    <br/>    
    
    <h2>Poistettavat</h2>
    
    <form action="${pageContext.servletContext.contextPath}/removeFromBatch/${batch.id}" method="POST">
        <table class="noborder">
            <tr>
                <th class="name">Sijainti</th>
                <th>Poistettava m‰‰r‰</th>
            </tr>
            <c:forEach var="location" varStatus="i" items="${batch.storageLocations}">
                <c:choose>
                    <c:when test="${batch.storageLocations[i.index][1] > 0}">
                        <c:forEach var="storage" items="${storages}">
                            <c:if test="${storage.id == location[0]}">
                                <tr>
                                    <td>${storage.name}</td>
                                    <td><input required="required" pattern="[0-9]{1,3}" min="1" max="${batch.storageLocations[i.index][1]}" type="number" name="amounts" /></td><br />
                                </tr>
                            </c:if>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <input style="display: none;" value="0" required="required" pattern="[0-9]{1,3}" type="number" name="amounts" />
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            
            <tr>
                <td colspan="2">&nbsp;</td>
            </tr>
                        
            <tr>
                <td>Poiston syy</td>
                <td><input required="required" type="text" name="reason" /></td>
            </tr>
            
            <tr>
                <td colspan="2">&nbsp;</td>
            </tr>
            
            <tr>
                <td>Nimikirjaimet</td>
                <td><input required="required" type="text" size="6" name="remover" /></td>
            </tr>
            
        </table>
        <br/>
        <input type="submit" value="Tallenna" /> &nbsp; &nbsp;<input type="button" value="Peruuta" onClick="parent.location = '${pageContext.servletContext.contextPath}/batch/${batch.id}'" />
    </form>
</div>

