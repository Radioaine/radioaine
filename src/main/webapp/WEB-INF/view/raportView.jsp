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
                <c:forEach var="eluate" items="${eluates}">
                    <tr>
                        <th class="timestamp"><fmt:formatDate value="${eluate.date}" pattern="dd.MM.yyyy HH:mm"/></th>
                        <th colspan="3">
                            <c:forEach var="generator" items="${eluate.generators}">
                                ${generator.substance.eluateName}<br>
                            </c:forEach>
                        </th>
                    </tr>

                    <c:forEach var="generator" items="${eluate.generators}">
                        <tr>
                            <td></td>
                            <td>${generator.substance.name}</td>
                            <td>Erä ${generator.batchNumber}</td>
                            <td>Käyt. ennen <fmt:formatDate value="${generator.expDate}" pattern="dd.MM.yyyy"/></td>
                        </tr>
                    </c:forEach>

                    <c:forEach var="other" items="${eluate.others}">
                        <tr>
                            <td></td>
                            <td>${other.substance.name}</td>
                            <td>Erä ${other.batchNumber}</td>
                            <td>Käyt. ennen <fmt:formatDate value="${other.expDate}" pattern="dd.MM.yyyy"/></td>
                        </tr>
                    </c:forEach>
                        
                    </tr>
                    
                    <tr>
                        <td></td>
                        <td>Aktiivisuus</td>
                        <td>${eluate.strength}
                            <c:choose>
                                <c:when test="${eluate.unit == 0}">
                                    GBq
                                </c:when>
                                <c:when test="${eluate.unit == 1}">
                                    kBq
                                </c:when>
                                <c:otherwise>
                                    MBq
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                    
                    <tr>
                        <td></td>
                        <td>Tilavuus</td>
                        <td>${eluate.volume} ml</td>
                    </tr>
                    
                    <tr>
                        <td></td>
                        <td>Kommentit</td>
                        <td>${eluate.note}</td>
                    </tr>
                    
                    <tr>
                        <td></td>
                        <td>Tekijä</td>
                        <td>${eluate.signature}</td>
                    </tr>
                    <tr>
                        <td>&nbsp; </td>
                        <td colspan="3"></td>
                    </tr>

                    <c:forEach var="radioMed" items="${radioMeds}">
                        <c:if test="${radioMed.eluates[0].id == eluate.id}">
                            <tr>
                                <th></th>
                                <th><fmt:formatDate value="${radioMed.date}" pattern=" HH:mm"/></th>
                            </tr>
                            <c:forEach var="kit" items="${radioMed.kits}">
                                <tr>
                                    <td></td>

                                    <th class="reportName">${kit.substance.name}</th>
                                    <td class="batch">Erä ${kit.batchNumber}</td>
                                    <td class="before">Käyt. ennen <fmt:formatDate pattern="dd.MM.yyyy" value="${kit.expDate}"/> </td>

                                </tr> 
                            </c:forEach>
                            <c:forEach var="other" items="${radioMed.others}">
                                <tr>
                                    <td class="time"></td>
                                    <td>${other.substance.name}</td>
                                    <td class="batch">Erä ${other.batchNumber}</td>
                                    <td class="before">Käyt. ennen <fmt:formatDate pattern="dd.MM.yyyy" value="${other.expDate}"/> </td>
                                </tr> 
                            </c:forEach>
                            <tr>
                                <td></td>
                                <td>Aktiivisuus</td>
                                <td>${radioMed.strength}<c:choose>
                                <c:when test="${radioMed.unit == 0}">
                                    GBq
                                </c:when>
                                <c:when test="${radioMed.unit == 1}">
                                    kBq
                                </c:when>
                                <c:otherwise>
                                    MBq
                                </c:otherwise>
                            </c:choose></td>
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
                                <td>Kommentit</td>
                                <td>${radioMed.note}</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>Nimikirjaimet</td>
                                <td>${radioMed.signature}</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>&nbsp; </td>
                                <td colspan="3"></td>
                            </tr>
                        </c:if>   
                    </c:forEach>
                </c:forEach>
            </table>
        </div>
    </c:if>
</div>

<%@include file="footer.jsp" %>
