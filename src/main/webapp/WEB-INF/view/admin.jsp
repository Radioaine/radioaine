<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="headeradmin.jsp" %>
<fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${warning}" var="wDate"/>


<div id="contents">
    
    <h2>Varoitukset</h2>
    </br>
    <table class="listing">

        <tr>
            <th class="amount">Pvm</th>
            <th class="substance">Tuotenimi</th>
            <th class="oldest">Käytettävä ennen</th>
            <th class="warnigs">Varoitukset</th>
            <th>Kommentit</th>
        </tr>

        <c:forEach var="substance" items="${substances}">
            <c:if test="${substance.warningDate < compareDate && substance.totalAmount > 0 && substance.inUse == true}">
                <c:choose>
                    <c:when test="${substance.oldestDate < compareDate}">
                        <tr class="red">
                            <td class="center">${date}</td>
                            <td><a href="substance/${substance.id}">${substance.name}</a></td>
                            <td><fmt:formatDate pattern="dd.MM.yyyy" value="${substance.oldestDate}"/></td>
                            <td>Eriä vanhentunut</td>
                            <td><form action="addStatusComment/${substance.id}+0" method="POST" >
                                    <input name="comment" type="text" value="${substance.statusMessages[0]}" class="comm" />
                                    <button type="submit">Tallenna</button>
                                </form>
                            </td>
                        </tr>
                    </c:when>
                    <c:otherwise>
                       <tr class="blue">
                            <td class="center">${date}</td>
                            <td><a href="substance/${substance.id}">${substance.name}</a></td>
                            <td><fmt:formatDate pattern="dd.MM.yyyy" value="${substance.oldestDate}"/></td>
                            <td>Eriä vanhenemassa</td>
                            <td><form action="addStatusComment/${substance.id}+0" method="POST" >
                                    <input name="comment" type="text" value="${substance.statusMessages[0]}" class="comm" />
                                    <button type="submit">Tallenna</button>
                                </form>
                            </td>

                        </tr>     
                    </c:otherwise>
                    
                </c:choose>
                
            </c:if>
            <!--Tähän aineitten hälytysrajat-->
            <c:if test="${substance.totalAmount < substance.warningBeforeAmount && substance.inUse == true}">
                <c:choose>
                    <c:when test="${substance.totalAmount == 0}">
                        <tr class="red">
                            <td class="center">${date}</td>
                            <td><a href="substance/${substance.id}">${substance.name}</a></td>
                            <td><fmt:formatDate pattern="dd.MM.yyyy" value="${substance.oldestDate}"/></td>
                            <td>Loppu</td>
                            <td><form action="addStatusComment/${substance.id}+1" method="POST" >
                                    <input name="comment" type="text" value="${substance.statusMessages[1]}" class="comm"/>
                                    <button type="submit">Tallenna</button>
                                </form>
                            </td>
                        </tr>
                    </c:when>
                    <c:otherwise>
                        <tr class="yellow">
                            <td class="center">${date}</td>
                            <td><a href="substance/${substance.id}">${substance.name}</a></td>
                            <td><fmt:formatDate pattern="dd.MM.yyyy" value="${substance.oldestDate}"/></td>
                            <td>Vähissä</td>
                            <td><form action="addStatusComment/${substance.id}+1" method="POST" >
                                    <input name="comment" type="text" value="${substance.statusMessages[1]}" class="comm" />
                                    <button type="submit">Tallenna</button>
                                </form>
                            </td>
                        </tr>
                    </c:otherwise>
                </c:choose>             
            </c:if>
                    <c:if test="${(substance.qualityStatus == 0 || substance.qualityStatus == 2) && substance.totalAmount > 0 && substance.inUse == true}">
                <tr class="orange">
                    <td class="center">${date}</td>
                    <td><a href="substance/${substance.id}">${substance.name}</a></td>
                    <td><fmt:formatDate pattern="dd.MM.yyyy" value="${substance.oldestDate}"/></td>
                    <td>Laadunvarmistus puuttuu</td>
                    <td><form action="addStatusComment/${substance.id}+2" method="POST" >
                            <input name="comment" type="text" value="${substance.statusMessages[2]}" class="comm" />
                            <button type="submit">Tallenna</button>
                        </form>
                    </td>
                </tr>
            </c:if>
        </c:forEach>

    </table>
    </br>
</div>
<%@include file="footer.jsp" %>
