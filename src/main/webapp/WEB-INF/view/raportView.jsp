<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="headeradmin.jsp" %>

<div id="contents">
    <table class="noborder">
        <c:forEach var="substance" items="${substances}">
            <tr>
                    <th colspan="5">${substance.name}</th>
            </tr>
            <c:forEach var="event" items="${arrived}">
                <c:if test="${event.substanceName == substance.name}">        
                <tr>
                    <td class="date">${event.arrivalDate}</td>
                    <td class="batch">eränumero ${event.batchNumber}</td>
                    <td class="before">käyt. ennen ${event.expDate}</td>
                    <td class="reportAmount">${event.amount} kpl</td>
                    <td>${event.signature}</td>
                </tr>
                </c:if>
            </c:forEach>
         </c:forEach>
         <c:forEach var="radioMed" items="${radioMeds}">
            <tr>
                <td>Radiolääke ${radioMed.id}</td>
                <td>Päiväys ${radioMed.date}</td>    
            </tr>
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
			<h2>Käyttäkuntoon saatetut radioläkkeet / lkm 1.1.2012-31.12.2012</h2>
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
			<h2>Käyttäkuntoon saatetut radiolääkkeet 1.1.2012-31.12.2012</h2>
		</p>

		<p>

		</br>	
		</p>
		
		</div>
</div>

<%@include file="footer.jsp" %>
