<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="header.jsp" %>
<script type="text/javascript" src="<c:url value="/script/ui.datepicker-fi.js" />"></script>

<div id="contents">
    <h2>Uusi radiolääke</h2>
    <p>
        <table class="noborder">
            <tr>
                <td>Valitse aine</td>
            </tr>

            <tr>
                
                <form:form commandName="radioMedicine" action="createRadioMedicine" method="POST">
                <td>   
                    <select>
                        <option onClick="setType(1)">Eluaatti</option>
                        <option onClick="setType(2)">Kitti</option>
                        <option onClick="setType(3)">Muu</option>
                    </select>
                </td>
                <td>
                    <form:select class="substance" path="solvent">
                        <c:forEach var="substance" items="${substances}">
                            <c:if test="${substance.type == '2'}">
                                <form:option value="${substance.id}">${substance.name}</form:option>
                            </c:if>
                        </c:forEach>
                    </form:select><br/>
                </td>
                <td>
                    <form:select class="batch" path="solvent">
                        <c:forEach var="batch" items="${batches}">
                                <form:option value="${batch.id}">${batch.batchNumber}</form:option>
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
        </form:form>
            </tr>

        </table>
    </p>
    <p>

        <form action="frontpage.html" method="post">
        <table class="noborder">

            <tr>
                <td class="name"></td>
                <td>Klo</td>
                <td>Pvm</td>
            </tr>

            <tr>
                <td>Valmistusaika</td>
                <td><input required type="text" name="hour" size="2" />:<input required type="text" name="minute" size="2" /></td>
                <td><input required type="text" name="date" size="8" value="3.3.2012" /> <!--Tähän oletusarvoisesti näkymään kuluva päivä--></td>
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
            </tr>

            <tr>
                <td>Tilavuus</td>
                <td>
                    <input type="text" name="volume" size="5" />
                    <input type="text" name="volumeUnit" size="4"  value="ml"/>
                </td>
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

        </form>

    </p>
</div>
<%@include file="footer.jsp" %>      