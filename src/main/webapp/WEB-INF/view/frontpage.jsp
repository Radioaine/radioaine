<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="headerfront.jsp" %>

<div id="contents">
    <table class="noborder">
        <tr>
            <td class="elbutton">
                <form method="link" action="createEluate">
                    <input type="submit" value="Luo eluaatti">
                </form>
            </td>
            <td>
                <form method="link" action="createRadioMedicine">
                    <input type="submit" value="Luo radiolääke">
                </form> 
            </td>
        </tr>
    </table>
    <br>
    <h2>Valmisteet 
        
    </h2>

    <br>
    <c:forEach var="eluate" items="${eluates}">
        <table class="listing">
            <tr>
                <th>Klo</th>
                <th>Aine</th>
                <th>Aktiivisuus</th>
                <th>Määrä</th>
                <th>Sijainti</th>
                <th>Tekijä</th>
                <th></th> <!--sarake lisäysnapille-->
            </tr>  
            <tr>
                <td><fmt:formatDate value="${eluate.date}" pattern="HH:mm"/> </td>
                <td><c:forEach var="generator" items="${eluate.generators}">
                        <a href="eluate/${eluate.id}"><b>${generator.substance.name}</b></a><br>
                    </c:forEach></td>
                <td>${eluate.strength} GBq</td>
                <td>${eluate.volume} ml</td>
                <td>${eluate.storageLocation}</td>
                <td>${eluate.signature}</td>
            </tr>

            <c:forEach var="radioMed" items="${radioMeds}">
                <c:if test="${radioMed.eluates[0].id == eluate.id}">  
                    <tr>
                        <td><fmt:formatDate value="${radioMed.date}" pattern="HH:mm"/></td>
                        <td><c:forEach var="kit" items="${radioMed.kits}">
                                <a href="RadioMedicine/${radioMed.id}">${kit.substance.name}</a><br>
                            </c:forEach></td>
                        <td>${radioMed.strength} GBq</td>
                        <td>${radioMed.volume} ml</td>
                        <td>${radioMed.storageLocation}</td>
                        <td>${radioMed.signature}</td>
                    </tr>
                </c:if>   
            </c:forEach> 
        </table>        
    </c:forEach>    
</div>
<%@include file="footer.jsp" %>