<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="header.jsp" %>

<div id="contents">
    <p>
    <h2>Valmisteet 
        <script>
            var myDate = new Date();
            var displayDate = (myDate.getDate()) + '.' + (myDate.getMonth()+1) + '.' + myDate.getFullYear();
            document.write(displayDate);
        </script>
    </h2>
</p>
<p>
<form method="link" action="createEluate">
    <input type="submit" value="LUO ELUAATTI">
</form>
</p>
<p>
<table class="listing">
    <col width="30px"/>
    <col width="60px"/>
    <col width="200px"/>
    <col width="100px"/>
    <col width="100px"/>
    <col width="100px"/>
    <col width="70px"/>
    <col width="200px"/>
    <tr>
        <th colspan="2">Klo</th>
        <th>Aine</th>
        <th>Vahvuus</th>
        <th>Määrä</th>
        <th>Sijainti</th>
        <th>Tekijä</th>
        <th></th> <!--sarake lisäysnapille-->
    </tr>
    <tr>            
        <td colspan="2">7:34</td>
        <td><a>Molybdeeni 99</a></td>
        <td>30,2 GBq</td>
        <td>11 ml</td>
        <td>1. krs</td>
        <td>MK</td>
        <th class="noborder">
    <form method="link" action="createRadioMedicine.html">
        <input type="submit" value="Luo radiolääke">
    </form>
    </th>
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
        <th class="noborder"></th>
        <td>8:22</td>
        <td><a>NephroMAG</a></td>
        <td>3,20 GBq</td>
        <td>5 ml</td>
        <td>2. krs</td>
        <td>MK</td>
    </tr>
</table>
</br>           
<table class="listing">
    <col width="30px"/>
    <col width="60px"/>
    <col width="200px"/>
    <col width="100px"/>
    <col width="100px"/>
    <col width="100px"/>
    <col width="70px"/>
    <col width="200px"/>
    <tr> 
        <td colspan="2">8:54</td>
        <td><a>Molybdeeni 99</a></td>
        <td>66,6 GBq</td>
        <td>10 ml</td>
        <td>2. krs</td>
        <td>RHN</td>
        <th class="noborder">
    <form method="link" action="createRadioMedicine.html">
        <input type="submit" value="Luo radiolääke">
    </form>
    </th>
    </tr>          
</table>
</p>
<p>
<h2>Muut käytetyt aineet</h2>
</p>
<p>
<table class="listing">
    <col width="200px"/>
    <tr>
        <th>Aine</th>
    </tr>
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