<%-- 
    Document   : frontpage_2
    Created on : 6.3.2012, 16:44:14
    Author     : Suvi Jentze-Korpi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="style_2.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Valmistus</title>
    </head>
    
    <%@include file="header_2.jsp" %>
    
    <body>

        <div id="navigation">
            <ul class="tabrow">
                <li class="selected">VALMISTUS</li>
                <li>VARASTO</li>
                <li>HALLINTA</li>
            </ul>
        </div>
    
        <div ib="buttons">
           <br>
            <button><strong>LUO ELUAATTI</strong></button>
            <br>     
        </div>
    
        
        
        <br>
        <br>
        
        16.2.2012 valmistuneet
        <br>
        <br>
        <table align="left">
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
                <th>   </th>
                <th>Aine</th>
                <th>Vahvuus</th>
                <th>Määrä</th>
                <th>Sijainti</th>
                <th>Tekijä</th>
                <th></th> <!--sarake lisäysnapille-->    
            </tr>
            <tr>
                <td>7:34</td>
                <td>   </td>
                <td>Molybdeeni 99</td>
                <td>30,2 GBq</td>
                <td>11 ml</td>
                <td>1. krs</td> 
                <td>MK</td> 
                <td class="noborder"><button>Luo lääke</button></td>
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
        
    </body>
</html>
