<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="headeradmin.jsp" %>

<div id="contents">
    
    <h2>Tuotenimikkeet</h2>
    <br/>
    
    <table class="noborder">
        <tr>
            <td class="substanceHeader">Kitit &nbsp; &nbsp;</td>
            <td>
                <form method="link" action="${pageContext.servletContext.contextPath}/addSubstance/0">
                    <input type="submit" value="Lisää">
                </form>
            </td>
        </tr>
    </table>

    <table class="noborder">
        
        <c:forEach var="substance" items="${substances}">
            <c:if test="${substance.type == '0' && substance.inUse == true}">
                <tr>
                    <td>
                        <a href="<c:out value="${pageContext.servletContext.contextPath}" />/updateSubstance/${substance.id}">${substance.name}</a>
                    </td>
                </tr>
            </c:if>
        </c:forEach>
    </table>
    
    <br/>

    <table class="noborder">
        <tr>
            <td class="substanceHeader">Generaattorit &nbsp; &nbsp;</td>
            <td>
                <form method="link" action="${pageContext.servletContext.contextPath}/addSubstance/1">
                    <input type="submit" value="Lisää">
                </form>
            </td>
        </tr>
    </table>

    <table class="noborder">
        <c:forEach var="substance" items="${substances}">
            <c:if test="${substance.type == '1' && substance.inUse == true}">
                <tr>
                    <td>
                        <a href="<c:out value="${pageContext.servletContext.contextPath}" />/updateSubstance/${substance.id}">${substance.name}</a>
                    </td>
                </tr>
            </c:if>
        </c:forEach>
    </table>
    <br/>

    <table class="noborder">
        <tr>
            <td class="substanceHeader">Muut &nbsp; &nbsp;</td>
            <td>
                <form method="link" action="${pageContext.servletContext.contextPath}/addSubstance/2">
                    <input type="submit" value="Lisää">
                </form>
            </td>
        </tr>
    </table>
    
    <table class="noborder">
        <c:forEach var="substance" items="${substances}">
            <c:if test="${substance.type == '2' && substance.inUse == true}">
                <tr>
                    <td>
                        <a href="<c:out value="${pageContext.servletContext.contextPath}" />/updateSubstance/${substance.id}">${substance.name}</a>
                    </td>
                </tr>
            </c:if>
        </c:forEach>
    </table>
    
    <br/>
    <br/>
    
    <h2>Käytöstä poistetut</h2>
    <br/>
    
    <div class="substanceHeader">Kitit</div>
    
    <table class="noborder">
        <c:forEach var="substance" items="${substances}">
            <c:if test="${substance.type == '0' && substance.inUse == false}">
                <tr>
                    <td>
                        <a href="<c:out value="${pageContext.servletContext.contextPath}" />/updateSubstance/${substance.id}">${substance.name}</a>
                    </td>
                </tr>
            </c:if>
        </c:forEach>
    </table>
    
    <div class="substanceHeader">Generaattorit</div>
                    
    <table class="noborder">
        <c:forEach var="substance" items="${substances}">
            <c:if test="${substance.type == '1' && substance.inUse == false}">
                <tr>
                    <td>
                        <a href="<c:out value="${pageContext.servletContext.contextPath}" />/updateSubstance/${substance.id}">${substance.name}</a>
                    </td>
                </tr>
            </c:if>
        </c:forEach>
    </table>
    
    <div class="substanceHeader">Muut</div>
                    
    <table class="noborder">
        <c:forEach var="substance" items="${substances}">
            <c:if test="${substance.type == '2' && substance.inUse == false}">
                <tr>
                    <td>
                        <a href="<c:out value="${pageContext.servletContext.contextPath}" />/updateSubstance/${substance.id}">${substance.name}</a>
                    </td>
                </tr>
            </c:if>
        </c:forEach>
    </table>
</div>
<%@include file="footer.jsp" %>