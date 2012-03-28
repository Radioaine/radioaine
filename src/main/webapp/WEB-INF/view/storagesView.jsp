<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="headeradmin.jsp" %>

<div id="contents">
    
    <h1>Varastopaikat</h1>
    
    <table class="noborder">
        <tr>
            <td><b>Nimi</b></td>
        </tr>
            <c:forEach var="storage" items="${storages}" varStatus="i">
                
                    <tr>
                        <td>
                            <div id="name${i.index+1}">${storage.name}</div>
                        </td>
                        <td id="editButton${i.index+1}">
                            <div id="edit${i.index+1}"><button type="button" onClick="editStorageName(${i.index+1})">Muokkaa</button></div>
                        </td>
                        <td>
                            <button type="button" onClick="removeStorage(${i.index+1})">Poista</button>
                        </td>
                    </tr>
                </div>
            </c:forEach>
    </table>
</div>
<%@include file="footer.jsp" %>