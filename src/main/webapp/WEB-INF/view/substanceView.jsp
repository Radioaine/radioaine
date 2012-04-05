<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="headeradmin.jsp" %>

<div id="contents">
    
    <h2>Kitit</h2>
    <br/>
    
    <form method="link" action="${pageContext.servletContext.contextPath}/addSubstance">
        <input type="submit" value="Lisää">
    </form>
    
    <br/>
    
    <table class="noborder">
        
        <c:forEach var="substance" items="${substances}">
            <c:if test="${substance.type == '0'}">
                <tr>
                    <td>
                        <a href="<c:out value="${pageContext.servletContext.contextPath}" />/updateSubstance/${substance.id}">${substance.name}</a>
                    </td>
                </tr>
            </c:if>
        </c:forEach>
    </table>
    
    <br/>

    <h2>Generaattorit</h2>
    <br/>
    
    <form method="link" action="${pageContext.servletContext.contextPath}/addSubstance">
        <input type="submit" value="Lisää">
    </form>
    
    <br/>
    <table class="noborder">
        <c:forEach var="substance" items="${substances}">
            <c:if test="${substance.type == '1'}">
                <tr>
                    <td>
                        <a href="<c:out value="${pageContext.servletContext.contextPath}" />/updateSubstance/${substance.id}">${substance.name}</a>
                    </td>
                </tr>
            </c:if>
        </c:forEach>
    </table>
    <br/>

    <h2>Muut</h2>
    <br/>
    
    <form method="link" action="${pageContext.servletContext.contextPath}/addSubstance">
        <input type="submit" value="Lisää">
    </form>
    
    <br/>
    <table class="noborder">
        <c:forEach var="substance" items="${substances}">
            <c:if test="${substance.type == '2'}">
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