<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


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
    <table class="listing">

        <tr>
            <th class="amount">Pvm</th>
            <th class="substance">Tuotenimi</th>
            <th class="oldest">Käytettävä ennen</th>
            <th class="warnigs">Varoitukset</th>
        </tr>

        <c:forEach var="substance" items="${substances}">
            <c:if test="${substance.oldestDate < compareDate}">
                <tr class="red">
                    <td class="center">${date}</td>
                    <td><a href="substance/${substance.id}">${substance.name}</a></td>
                    <td>${substance.oldestDate}</td>
                    <td>Vanhentuneita eriä</td>
                    <td><form action="addStatusComment/${substance.id}+0" method="POST" >
                            <input name="comment" type="text" value="${substance.statusMessages[0]}" />
                            <button type="submit">Tallenna kommentti</button>
                        </form>
                    </td>

                </tr>
            </c:if>
            <!--Tähän aineitten hälytysrajat-->
            <c:if test="${substance.totalAmount < 10}">
                <tr class="yellow">
                    <td class="center">${date}</td>
                    <td><a href="substance/${substance.id}">${substance.name}</a></td>
                    <td>${substance.oldestDate}</td>
                    <td>Vähissä</td>
                    <td><form action="addStatusComment/${substance.id}+1" method="POST" >
                            <input name="comment" type="text" value="${substance.statusMessages[1]}" />
                            <button type="submit">Tallenna kommentti</button>
                        </form>
                    </td>
                </tr>
            </c:if>
            <c:if test="${substance.totalAmount == 0}">
                <tr class="red">
                    <td class="center">${date}</td>
                    <td><a href="substance/${substance.id}">${substance.name}</a></td>
                    <td>${substance.oldestDate}</td>
                    <td>Loppu</td>
                    <td><form action="addStatusComment/${substance.id}+1" method="POST" >
                            <input name="comment" type="text" value="${substance.statusMessages[1]}" />
                            <button type="submit">Tallenna kommentti</button>
                        </form>
                    </td>
                </tr>
            </c:if>
            <c:if test="${substance.qualityStatus == 0}">
                <tr class="orange">
                    <td class="center">${date}</td>
                    <td><a href="substance/${substance.id}">${substance.name}</a></td>
                    <td>${substance.oldestDate}</td>
                    <td>Laadunvarmistus puuttuu</td>
                    <td><form action="addStatusComment/${substance.id}+2" method="POST" >
                            <input name="comment" type="text" value="${substance.statusMessages[2]}" />
                            <button type="submit">Tallenna kommentti</button>
                        </form>
                    </td>
                </tr>
            </c:if>
            <c:if test="${substance.qualityStatus == 2}">
                <tr class="red">
                    <td class="center">${date}</td>
                    <td><a href="substance/${substance.id}">${substance.name}</a></td>
                    <td>${substance.oldestDate}</td>
                    <td>Kaikki erät hylätty</td>
                    <td><form action="addStatusComment/${substance.id}+2" method="POST" >
                            <input name="comment" type="text" value="${substance.statusMessages[2]}" />
                            <button type="submit">Tallenna kommentti</button>
                        </form>
                    </td>
                </tr>
            </c:if>


        </c:forEach>

    </table>
    </br>



</div>
<%@include file="footer.jsp" %>
