<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="headerstorage.jsp" %>

<div id="contents">
    <form method="link" action="addBatch">
        <input type="submit" value="Lisää lähetys">
    </form>
    <br/>
    <h2>Kitit</h2>
    <br/>
    <table class="listing">
        <col width="200px"/>
        <col width="100px"/>
        <col width="100px"/>
        <col width="100px"/>
        <tr>
            <th class="amount">Lkm</th>
            <th class="substance">Tuotenimi</th>
            <th class="oldest">Vanhenemassa</th>
            <th class="warnigs">Varoitukset</th>
        </tr>

        <c:forEach var="substance" items="${substances}">
            <c:if test="${substance.type == '0'}">
                <tr>
                    <td><a href="substance/${substance.id}">${substance.name}</a></td>
                    <td class="maara">${substance.totalAmount}</td>
                    <td>${substance.oldestDate}</td>
                    <td></td>
                </tr>
            </c:if>
        </c:forEach>

    </table>
    <br/>

    <h2>Generaattorit</h2>
    <table class="listing">
        <col width="200px"/>
        <col width="100px"/>
        <col width="100px"/>
        <col width="100px"/>
        <tr>
            <th class="amount">Lkm</th>
            <th class="substance">Tuotenimi</th>
            <th class="oldest">Vanhenemassa</th>
            <th class="warnigs">Varoitukset</th>
        </tr>

        <c:forEach var="substance" items="${substances}">
            <c:if test="${substance.type == '1'}">
                <tr>
                    <td><a href="substance/${substance.id}">${substance.name}</a></td>
                    <td class="maara">${substance.totalAmount}</td>
                    <td>${substance.oldestDate}</td>
                    <td></td>
                </tr>
            </c:if>
        </c:forEach>
    </table>
    <br/>

    <h2>Muut</h2>   
    <br/>
    <table class="listing">
        <col width="200px"/>
        <col width="100px"/>
        <col width="100px"/>
        <col width="100px"/>
        <tr>
            <th class="amount">Lkm</th>
            <th class="substance">Tuotenimi</th>
            <th class="oldest">Vanhenemassa</th>
            <th class="warnigs">Varoitukset</th>
        </tr>

        <c:forEach var="substance" items="${substances}">
            <c:if test="${substance.type == '2'}">
                <tr>
                    <td><a href="substance/${substance.id}">${substance.name}</a></td>
                    <td class="maara">${substance.totalAmount}</td>
                    <td>${substance.oldestDate}</td>
                    <td></td>
                </tr>
            </c:if>
        </c:forEach>
    </table>

</div>
<%@include file="footer.jsp" %>