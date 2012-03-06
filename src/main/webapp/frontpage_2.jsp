<%-- 
    Document   : frontpage_2
    Created on : 6.3.2012, 16:44:14
    Author     : Suvi Jentze-Korpi
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        
        <br>
        <button><strong>LUO ELUAATTI</strong></button>
        <br>
        <br>
        <br>
              
        16.2.2012 valmistuneet
        <br>
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
            
            <c:forEach var="product" items="${products}">
                <c:if test="${product.type == '1'}AND${product.timeCreated==tänään!}">
                    <tr>
                        <td>$(product.timeCreated)</td> <!--sarake eluaatin kellonajalle-->
                        <td>""</td><!--sarake ko. eluaatista tehdyn lääkkeen kellonajalle-->
                        <td>${product.name}</td>
                        <td>${eluate.strength}</td>
                        <td>${eluate. määrä}</td>
                        <td>${eluate.storageLocations}</td>
                        <td>${eluate.creator}</td>
                        <td class="noborder"><button>Luo lääke</button></td>
                    </tr>
                </c:if>
                
                
            </c:forEach>
         
     
      
        </table>     
        
    </body>
</html>
