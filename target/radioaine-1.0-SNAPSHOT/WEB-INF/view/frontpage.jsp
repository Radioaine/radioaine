<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Varasto</title>
    </head>
    <body>
        <h1>Varasto</h1>

        <h2>Lisää esine</h2>
        <form action="lisaa" method="POST">
            Esineen nimi: <input type="text" name="nimi"><br/>
            Esineen paino (desimaalilukuna): <input type="text" name="paino"><br/>
            <input type="submit" value="Lisää">            
        </form>

        <h2>Esineet</h2>
        <ul>
            <c:forEach var="esine" items="${esineet}">
                <li>${esine.nimi}, paino ${esine.paino}, <a href="poista/${esine.id}">poista</a></li>
            </c:forEach>
        </ul>
    </body>
</html>
