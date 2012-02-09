<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="header.jsp" %>

<div id="sisalto">
    <h1>Lisää lähetys</h1>


    <form:form commandName="batch" action="add" method="POST">
        Aine: <form:select path="substance">
            <form:option value="1">Bridatec</form:option>
            <form:option value="2">Stamicis</form:option>
            <form:option value="3">Nanocolli</form:option>
        </form:select><br/>
        Eränumero: <form:input path="batchNumber" type="text"/><form:errors path="batchNumber"/><br/>
        Määrä: <form:input path="amount" type="number"/><form:errors path="amount"/><br/>
        Saapumispäivä: <form:input path="arrivalDate" type="date"/><form:errors path="arrivalDate"/><br/>
        Vanhenemispäivä: <form:input path="expDate" type="date"/><form:errors path="expDate"/><br/>
        Huomioita: <form:textarea path="note" type="text"/><form:errors path="note"/><br/>
        <input type="submit">

    </form:form>
    <!--    <form action="add" method="POST">
             Lista tuotteista automaagisesti? 
            Tuote: 
            <select name="">
                <option>Bridatec</option>
                <option>Stamicis</option>
                <option>Nanocolli</option>
            </select><br/>
            Eränumero: <input name="batchNumber" autofocus required type="text"><br/>
            Saapumispäivämäärä: <input name="arrivalDate" placeholder="Muodossa DD/MM/YYYY" type="date"><br/>
            Vanhenemispäivämäärä: <input name="expDate" placeholder="Muodossa DD/MM/YYYY" type="date"><br/>
            Sisällön lukumäärä: <input name="strength" required type="number" step="1" min="1" max="999" /><br />
             Määritetään tuotteen mukaan automaagisesti? 
            Säilytettävä kylmässä: <select>
                <option>Kyllä</option>
                <option>Ei</option>
            </select><br/>
            Kommentit:<br/>
            <textarea name="note" rows="3" name="comments" ></textarea><br/>
            Toimittaja: <input name="supplier" autofocus type="text"><br/>
            Valmistaja: <input name="manufacturer" autofocus type="text"><br/>
            <input type="submit" value="Lisää tuotteet">            
        </form>-->
</div>

<%@include file="footer.jsp" %>