<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="headeradmin.jsp" %>

<div id="contents">
    <table class="noborder">
        <h2>Saapuneet radiol‰‰kkeet <fmt:formatDate pattern="dd.MM.yyyy" value="${startDate}"/>  - <fmt:formatDate pattern="dd.MM.yyyy" value="${endDate}"/></h2>
        <c:forEach var="substance" items="${substances}" varStatus="i">   
                <tr id="substance${i.index}" style="display: none;">
                        <th colspan="5" >${substance.name}</th>
                </tr>
                <c:forEach var="event" items="${arrived}">
                    <c:if test="${event.substanceName == substance.name}">
                        <script>$("#substance${i.index}").css("display","inline");</script>
                    <tr>
                        <td class="date"><fmt:formatDate pattern="dd.MM.yyyy" value="${event.arrivalDate}"/></td>
                        <td class="batch">er‰ ${event.batchNumber}</td>
                        <td class="before">k‰yt. ennen <fmt:formatDate pattern="dd.MM.yyyy" value="${event.expDate}"/></td>
                        <td class="reportAmount">${event.amount} kpl</td>
                        <td>${event.signature}</td>
                    </tr>
                    </c:if>
                </c:forEach>     
         </c:forEach>
    </table>
    <table class="noborder">
        <h2>Poistuneet radiol‰‰kkeet <fmt:formatDate pattern="dd.MM.yyyy" value="${startDate}"/>  - <fmt:formatDate pattern="dd.MM.yyyy" value="${endDate}"/></h2>
         <c:forEach var="substance" items="${substances}" varStatus="j">
            <tr>
                    <th colspan="5" id="substance${j.index}" style="display: none;">${substance.name}</th>
            </tr>
            <c:forEach var="event" items="${removed}">
                <c:if test="${event.substanceName == substance.name}">
                    <script>$("#substance${j.index}").css("display","inline");</script>
                <tr>
                    <td class="date"><fmt:formatDate pattern="dd.MM.yyyy" value="${event.arrivalDate}"/></td>
                    <td class="batch">er‰ ${event.batchNumber}</td>
                    <td class="before">k‰yt. ennen <fmt:formatDate pattern="dd.MM.yyyy" value="${event.expDate}"/></td>
                    <td class="reportAmount">${event.amount} kpl</td>
                    <td>${event.signature}</td>
                </tr>
                </c:if>
            </c:forEach>
         </c:forEach>
    </table>
    <table class="noborder">
         <c:forEach var="radioMed" items="${radioMeds}">
            <tr>
                <td>Radiol‰‰ke ${radioMed.id}</td>
                <td>P‰iv‰ys ${radioMed.date}</td>    
            </tr>
         </c:forEach>
    </table>
    
            
    <div id="arrived">
		<p>
        <h2>Saapuneet radiol‰‰kkeet 1.1.2012-31.12.2012</h2>
		</p>
		<p>
        <table class="noborder">
            <tr>
                <th colspan="5">Angiocis</th>
            </tr>
            <tr>
                <td class="date">1.2.2012</td>
                <td class="batch">er‰ OIUHTTK</td>
                <td class="before">k‰yt. ennen 30.4.2012</td>
                <td class="reportAmount">3 kpl</td>
                <td>MK</td>
            </tr>
            <tr>
                <td>3.5.2012</td>
                <td>er‰ OIUYYTK</td>
                <td>k‰yt. ennen 5.7.2012</td>
                <td>6 kpl</td>
                <td>RR</td>
            </tr>
            <tr>
                <td>6.7.2012</td>
                <td>er‰ AOTHTTK</td>
                <td>k‰yt. ennen 15.8.2012</td>
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
                <td class="batch">er‰ 13541254</td>
                <td class="before">k‰yt. ennen 28.4.2012</td>
                <td class="reportAmount">2 kpl</td>
                <td>NN</td>
            </tr>
            <tr>
                <td>3.5.2012</td>
                <td>er‰ 6758654</td>
                <td>k‰yt. ennen 5.7.2012</td>
                <td>3 kpl</td>
                <td>MM</td>
            </tr>
            <tr>
                <td>6.7.2012</td>
                <td>er‰ 4136584</td>
                <td>k‰yt. ennen 15.8.2012</td>
                <td>4 kpl</td>
                <td>KK</td>
            </tr>
		</table>
		</br>
		</p>
		</div>
		
		<div id="removed">
		<p>
			<h2>Poistuneet radiol‰‰kkeet 1.1.2012-31.12.2012</h2>
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
			<h2>K‰yttˆkuntoon saatetut radiol‰kkeet / lkm 1.1.2012-31.12.2012</h2>
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
			<h2>K‰yttˆkuntoon saatetut radiol‰‰kkeet 1.1.2012-31.12.2012</h2>
		</p>

		<h4>3.1.2012</h4>
		<p>
		<table class="noborder">
            <tr>
                <td class="time">7.38</td>
                <td class="reportName">Teknetiumeluaatti</td>
                <td class="batch">er‰ 6758654</td>
                <td class="before">k‰yt. ennen 3.3.2012</td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td>NaCl 100 ml</td>
                <td>er‰ OIUHTTK</td>
                <td>k‰yt. ennen 5.7.2012</td>
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
                <td>K‰ytett‰v‰ ennen</td>
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
                <td class="batch">er‰ 15611654</td>
                <td class="before">k‰yt. ennen 5.4.2012</td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td>Myoview</td>
                <td>er‰ 15611654</td>
                <td>k‰yt. ennen 5.4.2012</td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td>NaCl 100 ml</td>
                <td>er‰ OIUHTTK</td>
                <td>k‰yt. ennen 5.7.2012</td>
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
                <td>K‰ytett‰v‰ ennen</td>
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
