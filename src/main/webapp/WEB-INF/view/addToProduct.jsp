<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="header.jsp" %>

<div id="sisalto">
    <h1>Lisäyssivu</h1>
    <form action="lisaa" method="POST">
        <!-- Lista tuotteista automaagisesti? -->
        Tuote: <select>
                <option>Bridatec</option>
                <option>Stamicis</option>
                <option>Nanocolli</option>
                </select><br/>
        Eränumero: <input autofocus required type="text" name="batchNumber"><br/>
        Saapumispäivämäärä: <input required placeholder="Muodossa DD/MM/YYYY" type="date" name="arrivalDate"><br/>
        Vanhenemispäivämäärä: <input required placeholder="Muodossa DD/MM/YYYY" type="date" name="expDate"><br/>
        Lukumäärä: <input required type="number" step="1" min="1" max="999" /><br />
        <!-- Määritetään tuotteen mukaan automaagisesti? -->
        Säilytettävä kylmässä: <select>
                                <option>Kyllä</option>
                                <option>Ei</option>
                                </select><br/>
        Säilytyspaikka:<br/>
        <textarea required rows="3"  name="storageLocation" ></textarea><br/>
        Kommentit:<br/>
        <textarea rows="3" name="comments" ></textarea><br/>
        <input type="submit" value="Lisää tuotteet">            
    </form>
</div>

<%@include file="footer.jsp" %>