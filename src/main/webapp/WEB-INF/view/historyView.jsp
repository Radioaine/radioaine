<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="headeradmin.jsp" %>
<div id="contents">
    <h2>Raportit</h2>
    <p>
    <form>
        <table class="noborder">
            <tr>
                <td>Alkupvm</td>

                <td><input id="start" name="start" type="text" value=""/></td>
            </tr>
            <tr>
                <td>Loppupvm</td>
                <td><input id="end" name="end" type="text" value=""/></td>
            </tr>
        </table>
        </br>


        <input type="checkbox" name="report" value="arrived" /> Saapuneet radiolääkkeet <br />
        <input type="checkbox" name="report" value="passivated" /> Poistuneet radiolääkkeet <br />
        <input type="checkbox" name="report" value="" /> Käyttökuntoon saatetut radiolääkkeet / lkm <br />
        <input type="checkbox" name="report" value="" /> Käyttökuntoon saatetut radiolääkkeet / tarkat tiedot
    </form>
    </p>

    <form method="link" action="historyView.html">
        <input type="submit" value="Luo raportti">
    </form>
</br>
</br>

<h2>Tapahtumien haku</h2>
</br>
<form action="/radioaine/seek">Etsi aineen nimellä <input type="text" name="searchString"> <input type="submit" value="Hae"></form>

</div>
<%@include file="footer.jsp" %>
