<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="headerstorage.jsp" %>

<div id="contents">
    <form method="link" action="addBatch">
        <input type="submit" value="Saapuminen varastoon">
    </form>
    <br/>
    <h2>Kitit</h2>
    <br/>
    <table class="listing">
        <tr>
            <th class="amount">Lkm</th>
            <th class="substance">Tuotenimi</th>
            <th class="oldest">Käytettävä ennen</th>
            <th class="warnigs">Varoitukset</th>
        </tr>

        <c:forEach var="substance" items="${substances}">
            <c:if test="${substance.type == '0' && substance.inUse == true}">
                <tr>
                    <td>${substance.totalAmount}</td>
                    <td><a href="substance/${substance.id}">${substance.name}</a></td>
                    <td><fmt:formatDate pattern="dd.MM.yyyy" value="${substance.oldestDate}"/></td>
                    <td></td>
                </tr>
            </c:if>
        </c:forEach>

    </table>
    <br/>

    <h2>Generaattorit</h2>
    <br/>
    <table class="listing">
        <tr>
            <th class="amount">Lkm</th>
            <th class="substance">Tuotenimi</th>
            <th class="oldest">Käytettävä ennen</th>
            <th class="warnigs">Varoitukset</th>
        </tr>

        <c:forEach var="substance" items="${substances}">
            <c:if test="${substance.type == '1' && substance.inUse == true}">
                <tr>                  
                    <td>${substance.totalAmount}</td>
                    <td><a href="substance/${substance.id}">${substance.name}</a></td>
                    <td><fmt:formatDate pattern="dd.MM.yyyy" value="${substance.oldestDate}"/></td>
                    <td></td>
                </tr>
            </c:if>
        </c:forEach>
    </table>
    <br/>

    <h2>Muut</h2>   
    <br/>
    <table class="listing">
        <tr>
            <th class="amount">Lkm</th>
            <th class="substance">Tuotenimi</th>
            <th class="oldest">Käytettävä ennen</th>
            <th class="warnigs">Varoitukset</th>
        </tr>

        <c:forEach var="substance" items="${substances}">
            <c:if test="${substance.type == '2' && substance.inUse == true}">
                <tr>
                    <td>${substance.totalAmount}</td>
                    <td><a href="substance/${substance.id}">${substance.name}</a></td>
                    <td><fmt:formatDate pattern="dd.MM.yyyy" value="${substance.oldestDate}"/></td>
                    <td></td>
                </tr>
            </c:if>
        </c:forEach>
    </table>

</div>
<%@include file="footer.jsp" %>