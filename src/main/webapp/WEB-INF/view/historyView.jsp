<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="headeradmin.jsp" %>
<script type="text/javascript" src="<c:url value="/script/ui.datepicker-fi.js" />"></script>
<script>
    $(function() {
        $( "#start" ).datepicker();
    });
    
    $(function() {
        $( "#end" ).datepicker();
    });
    
    
</script>
<div id="contents">
    <h2>Raportit</h2>
    <p>
    <form action="${pageContext.servletContext.contextPath}/seek">
        <table class="noborder">
            <tr>
                <td>Alkupvm</td>

                <td><input id="start" name="start" type="text" value=""/></td>
            </tr>
            <tr>
                <td>Loppupvm</td>
                <td><input id="end" name="end" type="text" value=""/></td>
            </tr>
        </table>
        </br>


        <input type="checkbox" name="reports" value="arrived" /> Saapuneet radiolääkkeet <br />
        <input type="checkbox" name="reports" value="removed" /> Poistuneet radiolääkkeet <br />
        <input type="checkbox" name="reports" value="RadioMedQuantity" /> Käyttökuntoon saatetut radiolääkkeet / lkm <br />
        <input type="checkbox" name="reports" value="RadioMedDetails" /> Käyttökuntoon saatetut radiolääkkeet / tarkat tiedot <br />
        <input type="submit" value="Luo raportti">
    </form>
    </p>
    
</br>
</br>

<h2>Tapahtumien haku</h2>
</br>
<form action="/radioaine/seek">Etsi aineen nimellä <input type="text" name="searchString"> <input type="submit" value="Hae"></form>

</div>
<%@include file="footer.jsp" %>
