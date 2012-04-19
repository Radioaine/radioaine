<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="headeradmin.jsp" %>

<div id="contents">
    <h2>Varastopaikat</h2>
    <br/>
    
    <table class="noborder">
        
            <c:forEach var="storage" items="${storages}" varStatus="i">
                <c:if test="${storage.hidden == false}">
                    <tr>
                        <form action="${pageContext.servletContext.contextPath}/updateStorageName/${storage.id}" method="POST">
                                <td class="name">
                                    <div id="name${storage.id}">${storage.name}</div>
                                    <input required name="name" id="inp${storage.id}" style="display: none;"></input>
                                </td>
                                <td id="editButton${storage.id}">
                                    <div id="edit${storage.id}">
                                        <button type="button" onClick="editStorageName(${storage.id})">Muokkaa</button>

                                    </div>
                                    <div id="save${storage.id}" style="display: none;">
                                        <button type="submit">Tallenna</button>
                                    </div>
                                </td>
                                <td id="cancel${storage.id}" style="display: none;">
                                    <button type="button" onClick="parent.location = '/radioaine/storagesView'">Peruuta</button>
                                </td>
                        </form>
                        <c:if test="${storage.inUse == false}">
                            <form action="${pageContext.servletContext.contextPath}/removeStorageName/${storage.id}" method="POST">
                                <td>
                                    <button id="remove${storage.id}" type="submit">Poista</button>
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