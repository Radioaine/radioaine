<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="headeradmin.jsp" %>

<div id="contents">
    <c:if test="${wantArrived == 1}">
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
    </c:if>

    <c:if test="${wantRemoved == 1}">
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
                                <td class="batch">erä ${event.batchNumber}</td>
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
    </c:if>

    <c:if test="${wantRadioMedQuantity == 1}">
        <div id="RadioMedQuantity">
            <h2 id="reportHeader3" style="display: inline;">Käyttökuntoon saatetut radiolääkkeet / lkm <fmt:formatDate pattern="dd.MM.yyyy" value="${startDate}"/>  - <fmt:formatDate pattern="dd.MM.yyyy" value="${endDate}"/></h2>
            <br>
            <br>
            <table class="noborder">        
                <c:forEach var="substance" items="${substances}" varStatus="k">
                    <c:if test="${substance.countForReport > 0}">
                        <tr style="display: inline;">
                            <th class="reportName">${substance.name}</th>
                            <td>${substance.countForReport} kpl</td>
                        </tr>
                    </c:if>
                </c:forEach>
            </table>
        </div>
        <br>
    </c:if>

    <c:if test="${wantRadioMedDetails == 1}">
        <div id="RadioMedDetails">
            <h2>Käyttökuntoon saatetut radiolääkkeet <fmt:formatDate pattern="dd.MM.yyyy" value="${startDate}"/>  - <fmt:formatDate pattern="dd.MM.yyyy" value="${endDate}"/></h2>  
            <br/>
            <br/>
            <table class="noborder">    
                <c:forEach var="substance" items="${substances}">
                    <c:forEach var="radioMed" items="${radioMeds}">
                        <c:if test="${substance.name == radioMed.kits[0].substance.name}">
                            <tr>
                                <td class="timestamp"><b><fmt:formatDate pattern="dd.MM.yyyy HH.mm" value="${radioMed.date}"/></b></td>

                            </tr>

                            <c:forEach var="kit" items="${radioMed.kits}">
                                <tr>
                                    <td class="time"></td>
                                    <td><b>${kit.substance.name}</b></td>
                                    <td class="batch">erä ${kit.batchNumber}</td>
                                    <td class="before">käyt. ennen <fmt:formatDate pattern="dd.MM.yyyy" value="${kit.expDate}"/> </td>
                                </tr> 
                            </c:forEach>
                            <c:forEach var="eluate" items="${radioMed.eluates}">
                                <tr>
                                    <td class="time"></td>
                                    <td>${eluate.generators[0].substance.eluateName}</td>
                                    <td class="batch">erä ${eluate.generators[0].batchNumber}</td>
                                    <td class="before">käyt. ennen <fmt:formatDate pattern="dd.MM.yyyy" value="${eluate.date}"/> </td>
                                </tr> 
                            </c:forEach>
                            <c:forEach var="other" items="${radioMed.others}">
                                <tr>
                                    <td class="time"></td>
                                    <td>${other.substance.name}</td>
                                    <td class="batch">erä ${other.batchNumber}</td>
                                    <td class="before">käyt. ennen <fmt:formatDate pattern="dd.MM.yyyy" value="${other.expDate}"/> </td>
                                </tr> 
                            </c:forEach>
                            <tr>
                                <td></td>
                                <td>Aktiivisuus</td>
                                <td>${radioMed.strength}</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>Tilavuus</td>
                                <td>${radioMed.volume}</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>Huomautuksia</td>
                                <td>${radioMed.note}</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>Nimikirjaimet</td>
                                <td>${radioMed.signature}</td>
                                <td></td>
                            </tr>

                        </c:if>
                    </c:forEach>
                </c:forEach>
            </table>
        </div>
    </c:if>
</div>

<%@include file="footer.jsp" %>
