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
                <c:if test="${storage.hidden == false}">
                    <tr>
                        <form action="${pageContext.servletContext.contextPath}/updateStorageName/${i.index+1}" method="POST">
                                <td>
                                    <div id="name${i.index+1}">${storage.name}</div>
                                    <input required name="name" id="inp${i.index+1}" style="display: none;"></input>
                                </td>
                                <td id="editButton${i.index+1}">
                                    <div id="edit${i.index+1}">
                                        <button type="button" onClick="editStorageName(${i.index+1})">Muokkaa</button>

                                    </div>
                                    <div id="save${i.index+1}" style="display: none;">
                                        <button type="submit">Tallenna</button>
                                    </div>
                                </td>
                                <td id="cancel${i.index+1}" style="display: none;">
                                    <button type="button" onClick="parent.location = '/radioaine/storagesView'">Peruuta</button>
                                </td>
                        </form>
                        <c:if test="${storage.inUse == false}">
                            <form action="${pageContext.servletContext.contextPath}/removeStorageName/${i.index+1}" method="POST">
                                <td>
                                    <button id="remove${i.index+1}" type="submit">Poista</button>
                                </td>
                            </form>
                        </c:if>
                    </tr>
                </c:if>
            </c:forEach>
    </table>
    <br />
    <form method="link" action="${pageContext.servletContext.contextPath}/addStorage">
        <input type="submit" value="Lisää varastopaikka">
    </form>
</div>
<%@include file="footer.jsp" %>