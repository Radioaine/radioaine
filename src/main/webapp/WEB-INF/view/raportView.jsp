<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="headeradmin.jsp" %>

<div id="contents">
         
    <div id="arrived">
        <h2>Saapuneet radiolääkkeet <fmt:formatDate pattern="dd.MM.yyyy" value="${startDate}"/>  - <fmt:formatDate pattern="dd.MM.yyyy" value="${endDate}"/></h2>

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
        <h2>Poistuneet radiolääkkeet <fmt:formatDate pattern="dd.MM.yyyy" value="${startDate}"/>  - <fmt:formatDate pattern="dd.MM.yyyy" value="${endDate}"/></h2>

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
        <h2>Käyttökuntoon saatetut radiolääkkeet / lkm <fmt:formatDate pattern="dd.MM.yyyy" value="${startDate}"/>  - <fmt:formatDate pattern="dd.MM.yyyy" value="${endDate}"/></h2>
        <br/>

        <table class="noborder">        
            <c:forEach var="substance" items="${substances}" varStatus="k">
                <tr id="radio${k.index}" style="display: none;">
                    <th class="reportName">${substance.name}</th>
                    <c:set var="count" value="0"/>

                    <c:forEach var="radioMed" items="${radioMeds}">
                        <c:if test="${radioMed.getName() == substance.name}">
                            <script>$("#radio${k.index}").css("display","inline");</script>
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
        <table class="noborder">    
            <c:forEach var="radioMed" items="${radioMeds}">
                    <tr>
                        <td class="timestamp"><fmt:formatDate pattern="HH.mm dd.MM.yyyy" value="${radioMed.date}"/> </td>
                        <td class="reportName">${radioMed.eluates.get(0).generators.get(0).substance.name} </td>
                        <td class="batch">erä ${radioMed.eluates.get(0).generators.get(0).batchNumber} </td>
                        <td class="before">käyt. ennen <fmt:formatDate pattern="dd.MM.yyyy" value="${radioMed.eluates.get(0).generators.get(0).expDate}"/> </td>
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
