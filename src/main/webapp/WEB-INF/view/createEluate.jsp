<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="header.jsp" %>
<div id="contents">
    <h2>Uusi eluaatti</h2>

    <form:form commandName="eluate" action="createEluate" method="POST">
        Aine: <form:select path="substance">
            <c:forEach var="substance" items="${substances}">
                <form:option value="${substance.id}">${substance.name}</form:option>
            </c:forEach>
        </form:select><br/>
        Eränumero: <form:input path="batchNumber" type="text"/><form:errors path="batchNumber"/><br/>
        <!-- Määrä: <form:input path="amount" type="number"/><form:errors path="amount"/><br/>-->
        Saapumispäivä: <form:input path="arrivalDate" type="text" id="arrivalDate"/><form:errors path="arrivalDate"/><br/>
        Vanhenemispäivä: <form:input path="expDate" type="text" id="expDate"/><form:errors path="expDate"/><br/>

        <div id="varastot">
            <form:select path="storageLocations[0][0]">
                <c:forEach var="locations" items="${batch.storageLocations}" varStatus="i">
                    <form:option value="${i.index+1}">Jääkaappi ${i.index+1}</form:option>
                </c:forEach>
            </form:select> <form:input path="storageLocations[0][1]" type="number"/> kappaletta<br/> 
        </div>
        <button type="button" onClick="addStorage(1, ${batch.storageLocationsCount})">Lisää varastopaikka</button><br />
        Huomioita: <form:textarea path="note" type="text"/><form:errors path="note"/><br/>
        Nimikirjaimet: <form:input path="signature" type="text" id="signature"/><form:errors path="signature"/><br/>
        <input type="submit">
    </form:form>


    <table class="noborder">

        <tr>
            <td>Valitse aine</td>
            <td></td>
            <td></td>
            <td></td>
        </tr>

        <tr>
            <td>   
                <select>
                    <option selected="selected">Generaattori</option>
                    <option>Kitti</option>
                    <option>Muu</option>
                </select>
            </td>
            <td>
                <select class="substance">
                    <option>Teknetiumgeneraattori 21,5 GBq</option>
                    <option>Teknetiumgeneraattori 24 GBq</option>
                    <option>Teknetiumgeneraattori 30 GBq</option>
                </select>
            </td>
            <td>
                <select class="batch">
                    <option>Erä 1234567, 1.krs, Laatu OK, 27.5.2012</option>
                    <option>Erä 1234568</option>
                    <option>Erä 1234569</option>
                </select>
            </td>   
            <td></td>
        </tr>

        <tr>
            <td>   
                <select>
                    <option>Generaattori</option>
                    <option>Kitti</option>
                    <option selected="selected">Muu</option>
                </select>
            </td>
            <td>
                <select class="substance">
                    <option>Keittosuolaliuos 1000 ml</option>
                    <option>Keittosuolaliuos 100 ml</option>
                    <option>Keittosuolaliuos 10 ml</option>
                </select>
            </td>
            <td>
                <select class="batch">
                    <option>Erä 1234567, 2.krs jääkaappi, Laatu OK, 27.5.2012</option>
                    <option>Erä 1234568</option>
                    <option>Erä 1234569</option>
                </select><br/>
            </td>
            <td>
                <button type="button">Lisää</button>
            </td>       
        </tr>

    </table>

<form action="frontpage.html" method="post">
    <table class="noborder">

        <tr>
            <td class="name"></td>
            <td>Klo</td>
            <td>Pvm</td>
        </tr>

        <tr>
            <td class="name">Eluointiaika</td>
            <td><input required type="text" name="hour" size="2" />:<input required type="text" name="minute" size="2" /></td>
            <td><input required type="text" name="date" size="8" value="3.3.2012" /></td>
        </tr>

        <tr>
            <td>Aktiivisuus</td>
            <td>
                <input type="text" name="activity" size="5" />
                <select>
                    <option>GBq</option>
                    <option>MBq</option>
                </select>
                &nbsp;
            </td>
            <td></td>
        </tr>

        <tr>
            <td>Tilavuus</td>
            <td>
                <input type="text" name="volume" size="5" />
                <input type="text" name="volumeUnit" size="4"  value="ml"/>
            </td>
            <td></td>
        </tr>

    </table>

    <table class="noborder">

        <tr>
            <td class="name">Sijainti</td>
            <td>
                <select>
                    <option>Valitse</option>
                    <option>1. krs jääkaappi</option>
                    <option>2. krs jääkaappi</option>
                </select>
            </td>
            <td></td>
        </tr>

        <tr>
            <td>Huomautuksia</td>
            <td><input type="text" name="comments" size="70" /></td>
            <td></td>
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

</form>


</div>
<%@include file="footer.jsp" %>        