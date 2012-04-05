<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="headeradmin.jsp" %>
<fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${warning}" var="wDate"/>


<div id="contents">
    
    </br>
    <table class="listing">

        <tr>
            <th class="amount">Pvm</th>
            <th class="substance">Tuotenimi</th>
            <th class="oldest">K�ytett�v� ennen</th>
            <th class="warnigs">Varoitukset</th>
            <th>Kommentit</th>
        </tr>

        <c:forEach var="substance" items="${substances}">
            <c:if test="${substance.oldestDate < compareDate}">
                <tr class="red">
                    <td class="center">${date}</td>
                    <td><a href="substance/${substance.id}">${substance.name}</a></td>
                    <td><fmt:formatDate pattern="dd.MM.yyyy" value="${substance.oldestDate}"/></td>
                    <td>Eri� vanhentunut</td>
                    <td><form action="addStatusComment/${substance.id}+0" method="POST" >
                            <input name="comment" type="text" value="${substance.statusMessages[0]}" class="comm" />
                            <button type="submit">Tallenna</button>
                        </form>
                    </td>

                </tr>
            </c:if>
            <c:if test="${substance.warningDate < wDate}">
                <tr class="blue">
                    <td class="center">${date}</td>
                    <td><a href="substance/${substance.id}">${substance.name}</a></td>
                    <td><fmt:formatDate pattern="dd.MM.yyyy" value="${substance.oldestDate}"/></td>
                    <td>Eri� vanhenemassa</td>
                    <td><form action="addStatusComment/${substance.id}+0" method="POST" >
                            <input name="comment" type="text" value="${substance.statusMessages[0]}" class="comm" />
                            <button type="submit">Tallenna</button>
                        </form>
                    </td>

                </tr>
            </c:if>
            <!--T�h�n aineitten h�lytysrajat-->
            <c:if test="${substance.totalAmount < 10}">
                <tr class="yellow">
                    <td class="center">${date}</td>
                    <td><a href="substance/${substance.id}">${substance.name}</a></td>
                    <td><fmt:formatDate pattern="dd.MM.yyyy" value="${substance.oldestDate}"/></td>
                    <td>V�hiss�</td>
                    <td><form action="addStatusComment/${substance.id}+1" method="POST" >
                            <input name="comment" type="text" value="${substance.statusMessages[1]}" class="comm" />
                            <button type="submit">Tallenna</button>
                        </form>
                    </td>
                </tr>
            </c:if>
            <c:if test="${substance.totalAmount == 0}">
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
            </c:if>
            <c:if test="${substance.qualityStatus == 0}">
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
