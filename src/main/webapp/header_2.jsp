<%-- 
    Document   : header_2
    Created on : 29.2.2012, 10:49:51
    Author     : Suvi Jentze-Korpi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="style_2.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <%java.util.Date date = new java.util.Date();%>
        <%String dayAndTime = date.toLocaleString();%>        
        
        <h3>RADIOAINE 1.0  <%out.print(String.valueOf(dayAndTime));%></h3>
    </body>
</html>
