<%-- 
    Document   : frontpage_2
    Created on : 6.3.2012, 16:44:14
    Author     : Suvi Jentze-Korpi
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="header.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <title>Radioaine</title> <%--tarviiko tätä? --%>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="basic.css" />
    <link rel="stylesheet" type="text/css" href="tabs.css" />
</head>

<body>
    <h1><a href="frontpage_2.jsp">Radioaine</a></h1>
    <%-- Suvi menossa tässä --%>
    <div id="header">
    <ul id="primary">
        <li><span>VALMISTUS</span></li>
        <li><a href="createEluate.html">VARASTO</a></li>
        <li><a href="createRadioMedicine.html">HALLINTA</a></li>
    </ul>
    </div>
    <div id="main">
        <div id="contents">
        <p>
            <h2>Valmisteet 16.2.2012</h2>
        </p>
     
        <p>
            <form method="link" action="createEluate.html">
     
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
    </div>
</body>
</html>