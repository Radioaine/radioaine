<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="headerfront.jsp" %>

<div id="contents">
    <h2>Uusi radiolääke</h2>
    <p>
        <table class="noborder">
            <tr>
                <td>Valitse aine</td>
            </tr>
            <form:form commandName="radioMedicine" action="createRadioMedicine" method="POST">
                <tr>
                    Valitse eluaatti<br />
                    <form:select class="substance" path="solvent">
                        <c:forEach var="eluate" items="${eluates}">
                                <form:option value="${eluate.id}">Klo ${eluate.date}, ${eluate.name}, ${eluate.strength}, ${eluate.volume}, Kaappi ${eluate.storageLocation}, ${eluate.signature}</form:option>
                        </c:forEach>
                    </form:select>
                </tr>
            <tr>
                <td>   
                    <select>
                        <option>Kitti</option>
                        <option>Muu</option>
                    </select>
                </td>
                <td>
                    <form:select class="substance" path="kit">
                        <c:forEach var="substance" items="${substances}">
                            <c:if test="${substance.type == '0'}">
                                <form:option value="${substance.id}">${substance.name}</form:option>
                            </c:if>
                        </c:forEach>
                    </form:select><br/>
                </td>
                <td>
                    <form:select class="batch" path="kit">
                        <c:forEach var="batch" items="${batches}">
                            <c:forEach var="storage" items="${batch.storageLocations}">
                                <c:if test="${storage[1] != '0'}">
                                    <form:option value="${batch.id}">Erä ${batch.batchNumber}, Kaappi ${storage[0]}, 
                                        Laatu 
                                        <c:if test="${batch.qualityCheck=='0'}">tekemättä</c:if>
                                        <c:if test="${batch.qualityCheck=='1'}">hyväksytty</c:if>
                                        <c:if test="${batch.qualityCheck=='2'}">hylätty</c:if>
                                        , vanh. ${batch.expDate}
                                    </form:option>
                                </c:if>
                            </c:forEach>
                        </c:forEach>
                    </form:select>
                </td>
                </tr>
                <tr>
                <td>   
                    <select>
                        <option>Eluaatti</option>
                        <option>Kitti</option>
                        <option>Muu</option>
                    </select>
                </td>
                <td>
                    <select class="substance">
                        <option>Angiocis 20.12mg</option>
                        <option>Bridatec</option>
                        <option>Ceretec Exametazine Agent</option>
                        <option>Ceretec Stabilised</option>
                        <option>Myoview</option>
                        <option>Nanocoll</option>
                        <option>Nephromag 0.2mg</option>
                        <option>Octreoscan (In-111)</option>
                        <option>Pentacis</option>
                        <option>Technescan HDP</option>
                        <option>Vasculocis HSA</option>
                        <option>Technescan DMSA</option>
                        <option>Technescan Sestamibi</option>
                        <option>Technescan LyoMAA</option>
                    </select>

                    
                </td>
                <td>
                    <select class="batch">
                        <option>Erä 1234567, 1.krs, Laatu OK, vanh. 27.5.2012</option>
                        <option>Erä 1234568</option>
                        <option>Erä 1234569</option>
                    </select>
                </td>       
            </tr>

            <tr>
                <td>   
                    <select>
                        <option>Valitse</option>
                        <option>Eluaatti</option>
                        <option>Kitti</option>
                        <option selected="selected">Muu</option>
                    </select>
                </td>
                <td>
                    <select class="substance">
                        <option>Valitse</option>
                        <option>Keittosuolaliuos 1000 ml</option>
                        <option>Keittosuolaliuos 100 ml</option>
                        <option>Keittosuolaliuos 10 ml</option>
                    </select>
                </td>
                <td>
                    <select class="batch">
                        <option selected="selected"> </option>
                        <option>Erä 1234567, 2.krs jääkaappi, Laatu OK, vanh. 27.5.2012</option>
                        <option>Erä 1234568</option>
                        <option>Erä 1234569</option>
                    </select>
                    <br/>
                </td>
                <td>
                    <button type="button">Lisää</button>
                </td>
            </tr>

        </table>
    </p>
    <p>

        <!--<form action="frontpage.html" method="post">-->
        <table class="noborder">

            <tr>
                <td class="name"></td>
                <td>Klo</td>
                <td>Pvm</td>
            </tr>

            <tr>
                <td>Valmistusaika</td>
                <td>
                    <form:input path="hours" type="text" id="hours" size="2"/><form:errors path="hours"/>:<form:input 
                    path="minutes" type="text" id="minutes" size="2"/><form:errors path="minutes"/>
                    <form:input path="date" type="text" id="eluatingtime"/><form:errors path="date"/>
                </td>
            </tr>

            <tr>
                <td>Aktiivisuus</td>
                
                    <!--<input type="text" name="activity" size="5" />
                    <select>
                        <option>GBq</option>
                        <option>MBq</option>
                    </select>
                    &nbsp;-->
                <td>
                    <form:input path="strength" type="text"/><form:errors path="strength"/>GBq
                </td>
            </tr>

            <tr>
                <td>Tilavuus</td>
                <td>
                    <form:input path="volume" type="text"/><form:errors path="volume"/>ml
                </td>
            </tr>

        </table>

        <table class="noborder">

            <tr>
                <td class="name">Sijainti</td>
                <td>
                    <!-- IHAN HIVREELLÄ TAVALLA TEHTY -->
                    <form:select path="storageLocation">
                        <c:forEach var="batch" items="${batches}" varStatus="i">
                            <c:if test="${i.index == 1}">
                                <c:forEach var="location" items="${batch.storageLocations}" varStatus="j">
                                    <form:option value="${j.index + 1}">Kaappi ${j.index + 1}</form:option>
                                </c:forEach>
                            </c:if>
                        </c:forEach>

                    </form:select>
                </td>
            </tr>

            <tr>
                <td>Huomautuksia</td>
                <td><input type="text" name="comments" size="70" /></td>
            </tr>

        </table>

        <br/>

        <table class="noborder">
            <tr>
                <td class="name">Nimikirjaimet</td>
                <td><input required type="text" name="initials" size="6" /></td>
            </tr>
        </table>

        <br/>
        <input type="submit" value="Tallenna" /> &nbsp; &nbsp;<input type="submit" value="Peruuta"/><!-- disabled="disabled"-->

        </form:form>

    </p>
</div>
<%@include file="footer.jsp" %>      