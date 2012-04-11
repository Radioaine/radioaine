<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="headeradmin.jsp" %>

<div id="contents">
    <table class="noborder" style="margin: 30px;">
        <h2>Saapuneet radiolääkkeet <fmt:formatDate pattern="dd.MM.yyyy" value="${startDate}"/>  - <fmt:formatDate pattern="dd.MM.yyyy" value="${endDate}"/></h2>
        <c:forEach var="substance" items="${substances}" varStatus="i">   
                <tr id="substance${i.index}" style="display: none;">
                        <th style="padding: 20px;">${substance.name}</th>
                </tr>
                <c:forEach var="event" items="${arrived}">
                    <c:if test="${event.substanceName == substance.name}">
                        <script>$("#substance${i.index}").css("display","inline");</script>
                    <tr>
                        <td class="date" style="padding-left: 40px;"><fmt:formatDate pattern="dd.MM.yyyy" value="${event.arrivalDate}"/></td>
                        <td>erä ${event.batchNumber}</td>
                        <td>käyt. ennen <fmt:formatDate pattern="dd.MM.yyyy" value="${event.expDate}"/></td>
                        <td>${event.amount} kpl</td>
                        <td>${event.signature}</td>
                    </tr>
                    </c:if>
                </c:forEach>
         </c:forEach>
    </table>
    <table class="noborder" style="margin: 30px;" >
        <h2>Poistuneet radiolääkkeet <fmt:formatDate pattern="dd.MM.yyyy" value="${startDate}"/>  - <fmt:formatDate pattern="dd.MM.yyyy" value="${endDate}"/></h2>
        <c:forEach var="substance" items="${substances}" varStatus="j">   
                <tr id="removed${j.index}" style="display: none;">
                        <th style="padding: 20px;">${substance.name}</th>
                </tr>
                <c:forEach var="event" items="${removed}">
                    <c:if test="${event.substanceName == substance.name}">
                        <script>$("#removed${j.index}").css("display","inline");</script>
                    <tr>
                        <td class="date" style="padding-left: 40px;"><fmt:formatDate pattern="dd.MM.yyyy" value="${event.timestamp}"/></td>
                        <td class="batch">erä ${event.batchNumber}</td>
                        <td class="reportAmount">${event.amount} kpl</td>
                        <td>${event.signature}</td>
                    </tr>
                    </c:if>
                </c:forEach>
         </c:forEach>
    </table>
    <table class="noborder">
        <h2>Käyttökuntoon saatetut radiolääkkeet / lkm <fmt:formatDate pattern="dd.MM.yyyy" value="${startDate}"/>  - <fmt:formatDate pattern="dd.MM.yyyy" value="${endDate}"/></h2>
        <c:forEach var="substance" items="${substances}" varStatus="k">
            <tr id="radio${k.index}" style="display: none;">
                        <th>${substance.name}</th>
                        <c:set var="count" value="0"/>
            
            <c:forEach var="radioMed" items="${radioMeds}">
                <c:if test="${radioMed.getName() == substance.name}">
                    <script>$("#radio${k.index}").css("display","inline");</script>
                    <c:set var="count" value="${count + 1}"/>
                </c:if>    
            </c:forEach>
                    <td  style="padding: 10px;">${count} kappaletta</td>
             </tr>
         </c:forEach>
    </table>
    <table class="noborder">
        <h2>Käyttökuntoon saatetut radiolääkkeet <fmt:formatDate pattern="dd.MM.yyyy" value="${startDate}"/>  - <fmt:formatDate pattern="dd.MM.yyyy" value="${endDate}"/></h2>  
            <c:forEach var="radioMed" items="${radioMeds}">
                <tr>
                    <td><fmt:formatDate pattern="HH.mm dd.MM.yyyy" value="${radioMed.date}"/> </td>
                    <td class="reportName">${radioMed.eluates.get(0).generators.get(0).substance.name} </td>
                    <td class="batch">erä ${radioMed.eluates.get(0).generators.get(0).batchNumber} </td>
                    <td class="before">käyt. ennen <fmt:formatDate pattern="dd.MM.yyyy" value="${radioMed.eluates.get(0).generators.get(0).expDate}"/> </td>
                </tr><br />
                <tr>
                <c:forEach var="kit" items="${radioMed.kits}">
                    <td>${kit.substance.name}</td>
                    <td class="batch">erä ${kit.batchNumber}</td>
                    <td class="before">käyt. ennen <fmt:formatDate pattern="dd.MM.yyyy" value="${kit.expDate}"/> </td>
                </c:forEach>
                </tr><br />
            </c:forEach>
    </table>
    
            
    <div id="arrived">
		<p>
        <h2>Saapuneet radiolääkkeet 1.1.2012-31.12.2012</h2>
		</p>
		<p>
        <table class="noborder">
            <tr>
                <th colspan="5">Angiocis</th>
            </tr>
            <tr>
                <td class="date">1.2.2012</td>
                <td class="batch">erä OIUHTTK</td>
                <td class="before">käyt. ennen 30.4.2012</td>
                <td class="reportAmount">3 kpl</td>
                <td>MK</td>
            </tr>
            <tr>
                <td>3.5.2012</td>
                <td>erä OIUYYTK</td>
                <td>käyt. ennen 5.7.2012</td>
                <td>6 kpl</td>
                <td>RR</td>
            </tr>
            <tr>
                <td>6.7.2012</td>
                <td>erä AOTHTTK</td>
                <td>käyt. ennen 15.8.2012</td>
                <td>1 kpl</td>
                <td>TL</td>
            </tr>
		</table>
		</br>	
		<table class="noborder">
            <tr>
                <th colspan="5">Bridatec</th>
            </tr>
            <tr>
                <td class="date">5.3.2012</td>
                <td class="batch">erä 13541254</td>
                <td class="before">käyt. ennen 28.4.2012</td>
                <td class="reportAmount">2 kpl</td>
                <td>NN</td>
            </tr>
            <tr>
                <td>3.5.2012</td>
                <td>erä 6758654</td>
                <td>käyt. ennen 5.7.2012</td>
                <td>3 kpl</td>
                <td>MM</td>
            </tr>
            <tr>
                <td>6.7.2012</td>
                <td>erä 4136584</td>
                <td>käyt. ennen 15.8.2012</td>
                <td>4 kpl</td>
                <td>KK</td>
            </tr>
		</table>
		</br>
		</p>
		</div>
		
		<div id="removed">
		<p>
			<h2>Poistuneet radiolääkkeet 1.1.2012-31.12.2012</h2>
		</p>

		<p>
			<table class="noborder">
            <tr>
                <th colspan="4">Angiocis</th>
            </tr>
            <tr>
                <td class="date">1.2.2012</td>
                <td class="reportAmount">1 kpl</td>
                <td class="reportReason">lainattu Jorviin</td>
                <td>JK</td>
            </tr>
            <tr>
                <td>3.5.2012</td>
                <td>1 kpl</td>
                <td>mennyt rikki</td>
                <td>TL</td>
            </tr>
		</table>
		</br>	
		<table class="noborder">
            <tr>
                <th colspan="4">Bridatec</th>
            </tr>
            <tr>
                <td class="date">6.7.2012</td>
                <td class="reportAmount">5 kpl</td>
                <td class="reportReason">vanhentunut</td>
                <td>LL</td>
            </tr>
		</table>
		</br>
		</p>
		</div>
		
		<div id="RadioMedQuantity">
		<p>
			<h2>Käyttökuntoon saatetut radioläkkeet / lkm 1.1.2012-31.12.2012</h2>
		</p>

		<p>
			<table class="noborder">
            <tr>
                <td class="reportName">Angiocis</td>
                <td>16 kpl</td>
            </tr>
            <tr>
                <td>Bridatec</td>
                <td>5 kpl</td>
            </tr>
            <tr>
                <td>Nanocoll</td>
                <td>60 kpl</td>
            </tr>
		</table>
		</br>	
		</p>
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
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td>NaCl 100 ml</td>
                <td>erä OIUHTTK</td>
                <td>käyt. ennen 5.7.2012</td>
                <td>5 ml</td>
            </tr>
            <tr>
                <td></td>
                <td>Aktiivisuus</td>
                <td>16,56 GBq</td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td>Tilavuus</td>
                <td>5 ml</td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td>Käytettävä ennen</td>
                <td>klo 12.38</td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td>Huomautuksia</td>
                <td colspan="3"></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td>Nimikirjaimet</td>
                <td>TT</td>
                <td></td>
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
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td>Myoview</td>
                <td>erä 15611654</td>
                <td>käyt. ennen 5.4.2012</td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td>NaCl 100 ml</td>
                <td>erä OIUHTTK</td>
                <td>käyt. ennen 5.7.2012</td>
                <td>10 ml</td>
            </tr>
            <tr>
                <td></td>
                <td>Aktiivisuus</td>
                <td>4,23 GBq</td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td>Tilavuus</td>
                <td>12 ml</td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td>Käytettävä ennen</td>
                <td>klo 12.45</td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td>Huomautuksia</td>
                <td colspan="3"></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td>Nimikirjaimet</td>
                <td>MM</td>
                <td></td>
                <td></td>
            </tr>
		</table>
		</br>
		</p>
		
		</div>
</div>

<%@include file="footer.jsp" %>
