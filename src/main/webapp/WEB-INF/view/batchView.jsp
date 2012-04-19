<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="headerstorage.jsp" %>

<div id="contents">
    <h2><a href="${pageContext.servletContext.contextPath}/substance/${batch.substance.id}">${batch.substance.name}</a> / erä ${batch.batchNumber}</h2>
    <br/>

    <table class="noborder">
        <tr>
            <td class="name">Käytettävä ennen</td>
            <td><fmt:formatDate value="${batch.expDate}" pattern="dd.MM.yyyy"/></td>
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
            <td id="qualityCheck">
                <c:choose>
                    <c:when test="${batch.qualityCheck==1}">
                        Hyväksytty
                    </c:when>
                    <c:when test="${batch.qualityCheck==2}">
                        Hylätty
                    </c:when>
                    <c:otherwise>
                        <form action="${pageContext.servletContext.contextPath}/doCheck/${batch.id}+0" method="POST">
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
            <td>
                <c:forEach var="storage" varStatus="i" items="${batch.storageLocations}">
                    <c:choose>
                        <c:when test="${batch.storageLocations[i.index][1] > 0}">
                            ${storage[1]} kpl ${storages[(storage[0])-1].name} <br/>
                        </c:when>
                    </c:choose>
                </c:forEach>
            </td>
        </tr> 

    </table>
    <br>
    <div id="batchButtons">
        
        <table class="noborder">
            <tr>
                <td class="editButton">
                    <form action="${pageContext.servletContext.contextPath}/updateBatch/${batch.id}" method="POST">  
                        <input type="submit" value="Muokkaa" />
                    </form>
                </td>
                <td>
                    <form action="${pageContext.servletContext.contextPath}/removeFromBatch/${batch.id}">  
                        <input type="submit" value="Poista erästä" />
                    </form>
                </td>
            </tr>
        </table>
              
    </div>
</div>

<%@include file="footer.jsp" %>