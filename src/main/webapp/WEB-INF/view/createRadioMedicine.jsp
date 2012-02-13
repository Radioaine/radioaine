<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="header.jsp" %>

<div id="sisalto">
    <h1>Radiol‰‰kkeen kirjaus</h1>
    <form action="addRadioDrug" method="POST">
        <!-- Lista eluaateista luetaan kannasta -->
        Eluaatti: <select>
            <option>Nr 1. tehty 7.35 aktiivisuus 23.7 tilavuus 11 eluoija LR sijainti alakerta</option>
            <option>Nr 2. tehty 7.35 aktiivisuus 23.7 tilavuus 11 eluoija LR sijainti alakerta</option>
            <option>Nr 3. tehty 7.35 aktiivisuus 23.7 tilavuus 11 eluoija LR sijainti alakerta</option>
        </select>
        <select>
            <option>Er‰ 1234567</option>
            <option>Er‰ 1234568</option>
            <option>Er‰ 1234569</option>
        </select><br/>
        <!-- Lista kiteista luetaan kannasta -->
        Kitti: <select>
            <option>Myoview</option>
            <option>Yourview</option>
            <option>Ourview</option>
        </select>
        <select>
            <option>Er‰ 1234567</option>
            <option>Er‰ 1234568</option>
            <option>Er‰ 1234569</option>
        </select><br/>
        <!-- Lista liuottimista luetaan kannasta -->
        Liuotin: <select>
            <option>NaCl</option>
            <option>h2o</option>
            <option>HCl</option>
        </select><br/><br/>
        <!-- Tarvitaan viela kellonaika, varmaan lisataan automaagisesti? -->
        Tekij‰:<input autofocus required type="text" name="makerInitials"><br/>
        S‰ilytyspaikka:<br/>
        <textarea required rows="3"  name="storageLocation" ></textarea><br/> 
        Huomautuksia:<br/>
        <textarea rows="3" name="comments" ></textarea><br/>
        <input type="submit" value="Kirjaa luotu l‰‰ke kantaan">            
    </form>
    
    <%@include file="history.jsp" %>
</div>

<%@include file="footer.jsp" %>