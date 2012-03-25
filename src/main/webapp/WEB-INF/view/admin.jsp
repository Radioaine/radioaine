<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="headeradmin.jsp" %>

<div id="contents">
    <table class="listing">
			
				<tr>
					<th class="amount">Pvm</th>
					<th class="substance">Tuotenimi</th>
					<th class="oldest">Käytettävä ennen</th>

					<th class="warnigs">Varoitukset</th>
				</tr>
				
				<tr class="blue">
					<td class="center">22.3.2012</td>
					<td><a href="substance.html">Angiocis 20.12mg</a></td>
					<td>12.2.2012</td>
					<td>Huomaa päiväys</td>

				</tr>
			
				<tr class="red">
					<td class="center">22.3.2012</td>
					<td><a>Bridatec</a></td>
					<td>13.4.2012</td>
					<td>Loppu</td>
				</tr>

			
				<tr class="yellow">
					<td class="center">22.3.2012</td>
					<td><a>Ceretec Stabilised</a></td>
					<td>9.4.2012</td>
					<td>Vähissä</td>
				</tr>
			
				<tr class="orange">

					<td class="center">22.3.2012</td>
					<td><a>Myoview</a></td>
					<td>5.5.2012</td>
					<td>Laadunvarmistus puuttuu</td>
				</tr>
			
				<tr class="yellow">
					<td class="center">22.3.2012</td>

					<td><a>Octreoscan (In-111)</a></td>
					<td>6.6.2012</td>
					<td>Vähissä</td>
				</tr>
				
				<tr class="blue">
					<td class="center">22.3.2012</td>
					<td><a>Pentacis</a></td>

					<td>8.3.2012</td>
					<td>Huomaa päiväys</td>
				</tr>
				
			</table>
			</br>
			
			<form method="link" action="admin.html">
				<input type="submit" value="Kuittaa nähdyksi">
			</form>

			
    </div>
<%@include file="footer.jsp" %>
