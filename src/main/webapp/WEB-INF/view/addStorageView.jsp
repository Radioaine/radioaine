<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%@include file="headeradmin.jsp" %>

<div id="contents">
    <h2>Lis‰‰ varastopaikka</h2>
    <br/>
    
    <form action="addStorage" method="POST">
        <table class="noborder">
            <tr>
                <td class="short">Nimi</td>
                <td><input required name="name" type="text" size="60" /></td>
            </tr>
        </table>
        <br/>
        <table class="noborder">
            <tr>
                <td class="shortButton">
                    <input type="submit" value="Lis‰‰">
                </td>
                <td>
                    <input type="button" value="Palaa" onClick="parent.location = '${pageContext.servletContext.contextPath}/storagesView'" />
                </td>
            </tr>
        </table>
        
    </form>  
</div>

<%@include file="footer.jsp" %>
