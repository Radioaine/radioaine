<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="header.jsp" %>

<div id="contents">
    <p>
    <h2>Valmisteet TIMESTAMP</h2>
</p>
<p>
<form method="link" action="createEluate">
    <input type="submit" value="LUO ELUAATTI">
</form>
</p>
<p>
<table>
    <col width="60px"/>
    <col width="60px"/>
    <col width="200px"/>
    <col width="100px"/>
    <col width="100px"/>
    <col width="100px"/>
    <col width="70px"/>
    <col width="200px"/>
    <tr>
        <th>Klo</th>
        <th> </th>
        <th>Aine</th>
        <th>Vahvuus</th>
        <th>Määrä</th>
        <th>Sijainti</th>
        <th>Tekijä</th>
        <th></th> <!--sarake lisäysnapille-->
    </tr>
    <tr>
        <td>7:34</td>
        <td> </td>
        <td>Molybdeeni 99</td>
        <td>30,2 GBq</td>
        <td>11 ml</td>
        <td>1. krs</td>
        <td>MK</td>
        <td class="noborder">
            <form method="link" action="createRadioMedicine.html">
                <input type="submit" value="Luo lääke">
            </form>
        </td>
    </tr>
    <tr>
        <td class="noborder"></td>
        <td>7:48</td>
        <td>Myoview</td>
        <td>5,39 GBq</td>
        <td>4 ml</td>
        <td>1. krs</td>
        <td>MK</td>
    </tr>
    <tr>
        <td class="noborder"></td>
        <td>8:22</td>
        <td>NephroMAG</td>
        <td>3,20 GBq</td>
        <td>5 ml</td>
        <td>2. krs</td>
        <td>MK</td>
    </tr>
</table>
</br>           
<table>
    <col width="60px"/>
    <col width="60px"/>
    <col width="200px"/>
    <col width="100px"/>
    <col width="100px"/>
    <col width="100px"/>
    <col width="70px"/>
    <col width="200px"/>
    <tr>
        <td>8:54</td>
        <td> </td>
        <td>Molybdeeni 99</td>
        <td>66,6 GBq</td>
        <td>10 ml</td>
        <td>2. krs</td>
        <td>RHN</td>
        <td class="noborder">
            <form method="link" action="createRadioMedicine.html">
                <input type="submit" value="Luo lääke">
            </form>
        </td>
    </tr>          
</table>
</p>
<p>
<h2>Muut käytetyt aineet</h2>
</p>
<p>
<table>
    <col width="200px"/>
    <tr>
        <td>Valmis lääke 1</td>
    </tr>
    <tr>
        <td>Valmis lääke 2</td>
    </tr>
    <tr>
        <td>Valmis lääke 3</td>
    </tr>
</table>

</p>
</div>