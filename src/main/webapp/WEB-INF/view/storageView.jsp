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
                    <td><b>
                        <c:if test="${substance.warningDate < compareDate}">
                            <c:choose>
                                <c:when test="${substance.oldestDate < compareDate}">
                                    <font class="red">Eriä vanhentunut</font><br />
                                </c:when>
                                <c:otherwise>
                                    <font class="blue">Eriä vanhenemassa</font><br />
                                </c:otherwise>
                            </c:choose>
                        </c:if>
                        <c:if test="${substance.totalAmount < substance.warningBeforeAmount}">
                            <c:choose>
                                <c:when test="${substance.totalAmount == 0}">
                                    <font class="red">Loppu</font><br />
                                </c:when>
                                <c:otherwise>
                                    <font class="yellow">Vähissä</font><br />
                                </c:otherwise>
                            </c:choose>
                        </c:if>
                        <c:if test="${substance.qualityStatus == 0 || substance.qualityStatus == 2}">
                            <font class="orange">Laadunvarmistus puuttuu</font>
                        </c:if>
                        </b></td>
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
                    <td>
                        <b>
                        <c:if test="${substance.warningDate < compareDate}">
                            <c:choose>
                                <c:when test="${substance.oldestDate < compareDate}">
                                    <font class="red">Eriä vanhentunut</font><br />
                                </c:when>
                                <c:otherwise>
                                    <font class="blue">Eriä vanhenemassa</font><br />
                                </c:otherwise>
                            </c:choose>
                        </c:if>
                        <c:if test="${substance.totalAmount < substance.warningBeforeAmount}">
                            <c:choose>
                                <c:when test="${substance.totalAmount == 0}">
                                    <font class="red">Loppu</font><br />
                                </c:when>
                                <c:otherwise>
                                    <font class="yellow">Vähissä</font><br />
                                </c:otherwise>
                            </c:choose>
                        </c:if>
                        <c:if test="${substance.qualityStatus == 0 || substance.qualityStatus == 2}">
                            <font class="orange">Laadunvarmistus puuttuu</font>
                        </c:if>
                        </b>
                    </td>
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
                    <td>
                        <b>
                        <c:if test="${substance.warningDate < compareDate}">
                            <c:choose>
                                <c:when test="${substance.oldestDate < compareDate}">
                                    <font class="red">Eriä vanhentunut</font><br />
                                </c:when>
                                <c:otherwise>
                                    <font class="blue">Eriä vanhenemassa</font><br />
                                </c:otherwise>
                            </c:choose>
                        </c:if>
                        <c:if test="${substance.totalAmount < substance.warningBeforeAmount}">
                            <c:choose>
                                <c:when test="${substance.totalAmount == 0}">
                                    <font class="red">Loppu</font><br />
                                </c:when>
                                <c:otherwise>
                                    <font class="yellow">Vähissä</font><br />
                                </c:otherwise>
                            </c:choose>
                        </c:if>
                        <c:if test="${substance.qualityStatus == 0 || substance.qualityStatus == 2}">
                            <font class="orange">Laadunvarmistus puuttuu</font>
                        </c:if>
                        </b>
                    </td>
                </tr>
            </c:if>
        </c:forEach>
    </table>

</div>
<%@include file="footer.jsp" %>