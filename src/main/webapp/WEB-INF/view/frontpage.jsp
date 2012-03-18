<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="headerfront.jsp" %>

<div id="contents">
    <h2>Valmisteet 
        <script>
            var myDate = new Date();
            var displayDate = (myDate.getDate()) + '.' + (myDate.getMonth()+1) + '.' + myDate.getFullYear();
            document.write(displayDate);
        </script>
    </h2>

    <table class="noborder">
        <tr>
            <td class="elbutton">
                <form method="link" action="createEluate">
                    <input type="submit" value="Luo eluaatti">
                </form>
            </td>
            <td>
                <form method="link" action="createRadioMedicine">
                    <input type="submit" value="Luo radiolääke">
                </form> 
            </td>
        </tr>
    </table>

    <c:forEach var="eluate" items="${eluates}">
        <p>${eluate.id} ${eluate.strength}</p>
    </c:forEach>

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
            <th>Aktiivisuus</th>
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
        </tr>          
    </table>
</p>
<!--<p>
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
</p>-->
</div>
<%@include file="footer.jsp" %>