<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="headeradmin.jsp" %>

<div id="contents">
         
    <div id="arrived">
        <h2 id="reportHeader1" style="display: none;">Saapuneet radiolääkkeet <fmt:formatDate pattern="dd.MM.yyyy" value="${startDate}"/>  - <fmt:formatDate pattern="dd.MM.yyyy" value="${endDate}"/></h2>

        <c:forEach var="substance" items="${substances}" varStatus="i">  
            <table class="noborder" id="substance${i.index}" style="display: none;">        
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <th>${substance.name}</th>
                </tr>
            </table>

            <table class="noborder">                
                <c:forEach var="event" items="${arrived}">
                    <c:if test="${event.substanceName == substance.name}">
                        <script>$("#substance${i.index}").css("display","inline");</script>
                        <script>$("#reportHeader1").css("display","inline");</script>
                        <tr>
                            <td class="date"><fmt:formatDate pattern="dd.MM.yyyy" value="${event.arrivalDate}"/></td>
                            <td class="batch">erä ${event.batchNumber}</td>
                            <td class="before">käyt. ennen <fmt:formatDate pattern="dd.MM.yyyy" value="${event.expDate}"/></td>
                            <td class="reportAmount">${event.amount} kpl</td>
                            <td>${event.signature}</td>
                        </tr>
                    </c:if>
                </c:forEach>
            </table>
        </c:forEach>   
        <br/>
    </div>
        
    <div id="removed">
        <h2 id="reportHeader2" style="display: none;">Poistuneet radiolääkkeet <fmt:formatDate pattern="dd.MM.yyyy" value="${startDate}"/>  - <fmt:formatDate pattern="dd.MM.yyyy" value="${endDate}"/></h2>

        <c:forEach var="substance" items="${substances}" varStatus="j">
            
            <table class="noborder"  id="removed${j.index}" style="display: none;">        
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <th>${substance.name}</th>
                </tr>
            </table>
            
            <table class="noborder" >
                    
                    <c:forEach var="event" items="${removed}">
                        <c:if test="${event.substanceName == substance.name}">
                            <script>$("#removed${j.index}").css("display","inline");</script>
                            <script>$("#reportHeader2").css("display","inline");</script>
                        <tr>
                            <td class="date"><fmt:formatDate pattern="dd.MM.yyyy" value="${event.timestamp}"/></td>
                            <!--<td class="batch">erä ${event.batchNumber}</td>-->
                            <td class="reportAmount">${event.amount} kpl</td>
                            <td class="reportReason">${event.note}</td>
                            <td>${event.signature}</td>
                        </tr>
                        
                        </c:if>
                    </c:forEach>
            </table>           
        </c:forEach>
        <br/>
    </div>
        
    <div id="RadioMedQuantity">
        <h2 id="reportHeader3" style="display: none;">Käyttökuntoon saatetut radiolääkkeet / lkm <fmt:formatDate pattern="dd.MM.yyyy" value="${startDate}"/>  - <fmt:formatDate pattern="dd.MM.yyyy" value="${endDate}"/></h2>
        <br/>
        <br/>
        <table class="noborder">        
            <c:forEach var="substance" items="${substances}" varStatus="k">
                <tr id="radio${k.index}" style="display: none;">
                    <th class="reportName">${substance.name}</th>
                    <c:set var="count" value="0"/>

                    <c:forEach var="radioMed" items="${radioMeds}">
                        <c:if test="${radioMed.getName() == substance.name}">
                            <script>$("#radio${k.index}").css("display","inline");</script>
                            <script>$("#reportHeader3").css("display","inline");</script>
                            <c:set var="count" value="${count + 1}"/>
                        </c:if>    
                    </c:forEach>
                    <td>${count} kpl</td>
                    <tr>
                        <td colspan="2"></td>
                    </tr>
                </tr>
            </c:forEach>
        </table>
    </div>
        
    <div id="RadioMedDetails">
        <h2>Käyttökuntoon saatetut radiolääkkeet <fmt:formatDate pattern="dd.MM.yyyy" value="${startDate}"/>  - <fmt:formatDate pattern="dd.MM.yyyy" value="${endDate}"/></h2>  
        <br/>
        <br/>
        <table class="noborder">    
            <c:forEach var="radioMed" items="${radioMeds}">
                    <tr>
                        <td class="timestamp"><fmt:formatDate pattern="HH.mm dd.MM.yyyy" value="${radioMed.date}"/> </td>

                    </tr>

                    <c:forEach var="kit" items="${radioMed.kits}">
                        
                        <tr>
                            <td class="time"></td>
                            <td>${kit.substance.name}</td>
                            <td class="batch">erä ${kit.batchNumber}</td>
                            <td class="before">käyt. ennen <fmt:formatDate pattern="dd.MM.yyyy" value="${kit.expDate}"/> </td>
                        </tr> 
                    </c:forEach>

            </c:forEach>
        </table>
    </div>
        
 
        <c:forEach var="eluate" items="${eluates}">
        <table class="listing">
            <tr>
                <th class="time">Klo</th>
                <th class="time">Aine</th>
                <th class="substance"></th>
                <th class="activity">Aktiivisuus</th>
                <th class="amount">Määrä</th>
                <th class="location">Sijainti</th>
                <th class="signature">Tekijä</th>
            </tr>  
            <tr>
                <td><fmt:formatDate value="${eluate.date}" pattern="HH:mm"/> </td>
                <td colspan="2"><c:forEach var="generator" items="${eluate.generators}">
                        <a href="eluate/${eluate.id}"><b>${generator.substance.name}</b></a><br>
                    </c:forEach></td>
                <td>${eluate.strength}
                    <c:choose>
                        <c:when test="${eluate.unit == 0}">
                            GBq
                        </c:when>
                        <c:otherwise>
                            MBq
                        </c:otherwise>
                    </c:choose>
                </td>
                <td>${eluate.volume} ml</td>
                <td>
                    <c:forEach var="storage" items="${storages}" varStatus="i">
                        <c:if test="${eluate.storageLocation == storage.id}">
                            ${storage.name}
                        </c:if>
                    </c:forEach>
                </td>
                <td>${eluate.signature}</td>
            </tr>

            <c:forEach var="radioMed" items="${radioMeds}">
                <c:if test="${radioMed.eluates[0].id == eluate.id}">
                    <tr>
                        <td class="noborder" style="background-color:#FDFDF0"></td>
                        <td><fmt:formatDate value="${radioMed.date}" pattern="HH:mm"/></td>
                        <td><c:forEach var="kit" items="${radioMed.kits}">
                                <a href="RadioMedicine/${radioMed.id}">${kit.substance.name}</a><br>
                            </c:forEach></td>
                        <td>${radioMed.strength}
                            <c:choose>
                                <c:when test="${radioMed.unit == 0}">
                                    GBq
                                </c:when>
                                <c:otherwise>
                                    MBq
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>${radioMed.volume} ml</td>
                        <td>
                            <c:forEach var="storage" items="${storages}" varStatus="i">
                                <c:if test="${radioMed.storageLocation == storage.id}">
                                    ${storage.name}
                                </c:if>
                            </c:forEach>
                        </td>
                        <td>${radioMed.signature}</td>
                    </tr>
                </c:if>   
            </c:forEach> 
        </table>
        </br>
    </c:forEach>    
        
		
		<div id="RadioMedDetails">
		
		<p>
			<h2>Käyttökuntoon saatetut radiolääkkeet 1.1.2012-31.12.2012</h2>
		</p>

		<h4>3.1.2012</h4>
		<p>
		<table class="noborder">
            <tr>
                <td class="time">7.38</td>
                <td class="reportName">Teknetiumeluaatti</td>
                <td class="batch">erä 6758654</td>
                <td class="before">käyt. ennen 3.3.2012</td>
            </tr>
            <tr>
                <td></td>
                <td>NaCl 100 ml</td>
                <td>erä OIUHTTK</td>
                <td>käyt. ennen 5.7.2012</td>
            </tr>
            <tr>
                <td></td>
                <td>Aktiivisuus</td>
                <td>16,56 GBq</td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td>Tilavuus</td>
                <td>5 ml</td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td>Käytettävä ennen</td>
                <td>klo 12.38</td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td>Huomautuksia</td>
                <td colspan="3"></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td>Nimikirjaimet</td>
                <td>TT</td>
                <td></td>
            </tr>
		</table>
		</br>	
		<table class="noborder">
            <tr>
                <td class="time">7.45</td>
                <td class="reportName">Myoview</td>
                <td class="batch">erä 15611654</td>
                <td class="before">käyt. ennen 5.4.2012</td>
            </tr>
            <tr>
                <td></td>
                <td>Myoview</td>
                <td>erä 15611654</td>
                <td>käyt. ennen 5.4.2012</td>
            </tr>
            <tr>
                <td></td>
                <td>NaCl 100 ml</td>
                <td>erä OIUHTTK</td>
                <td>käyt. ennen 5.7.2012</td>
            </tr>
            <tr>
                <td></td>
                <td>Aktiivisuus</td>
                <td>4,23 GBq</td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td>Tilavuus</td>
                <td>12 ml</td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td>Käytettävä ennen</td>
                <td>klo 12.45</td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td>Huomautuksia</td>
                <td colspan="3"></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td>Nimikirjaimet</td>
                <td>MM</td>
                <td></td>
            </tr>
		</table>
		</br>
		</p>
		
		</div>
</div>

<%@include file="footer.jsp" %>
