
<%@include file="header.jsp" %>

<div id="sisalto">
    <h1>Eluaatin kirjaus</h1>
    <form action="addEluate" method="POST">
    <!-- Lista eluaateista luetaan kannasta -->
       Generaattori: <select>
        <option>Molybdeeni 99</option>
        <option>Polybdeeni 89</option>
        <option>Omnibdeeni 79</option>
       </select>
       <select>
        <option>Erä 1234567</option>
        <option>Erä 1234568</option>
        <option>Erä 1234569</option>
       </select><br/>
       <!-- Lista kiteista luetaan kannasta -->
       Liuotin: <select>
        <option>NaCl</option>
        <option>h2o</option>
        <option>HCl</option>
       </select>
       <select>
        <option>Erä 1234567</option>
        <option>Erä 1234568</option>
        <option>Erä 1234569</option>
       </select><br/>
       <!-- Lista liuottimista luetaan kannasta -->
       Aktiivisuus:<input required type="text" name="activity"><br/>
       <!-- Tarvitaan viela kellonaika, varmaan lisataan automaagisesti? -->
       Tekijä:<input autofocus required type="text" name="makerInitials"><br/>
       Säilytyspaikka:<br/>
       <textarea required rows="3"  name="storageLocation" ></textarea><br/> 
       Huomautuksia:<br/>
       <textarea rows="3" name="comments" ></textarea><br/>
       <input type="submit" value="Kirjaa luotu eluaatti kantaan">            
      </form>
    </div>

<%@include file="footer.jsp" %>