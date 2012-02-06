<%-- 
    Document   : createRadioDrug
    Created on : 6.2.2012, 9:35:08
    Author     : rmjheino
--%>

<div id="sisalto">
    <h1>Radiol‰‰kkeen luonti</h1>
    <form action="addRadioDrug" method="POST">
    <!-- Lista tuotteista automaagisesti? -->
       Valitse eluaatti: <select>
        <option>Nr 1. tehty 7.35 aktiivisuus 23.7 tilavuus 11 eluoija LR sijainti alakerta</option>
        <option>Nr 2. tehty 7.35 aktiivisuus 23.7 tilavuus 11 eluoija LR sijainti alakerta</option>
        <option>Nr 3. tehty 7.35 aktiivisuus 23.7 tilavuus 11 eluoija LR sijainti alakerta</option>
       </select><br/>
       Kitti: <input autofocus required type="text" name="batchNumber"><br/>
       Liuotin: <input required placeholder="Muodossa DD/MM/YYYY" type="date" name="arrivalDate"><br/>
       Kellonaika: <input required placeholder="Muodossa DD/MM/YYYY" type="date" name="expDate"><br/>
       S‰ilytyspaikka:<br/>
       <textarea required rows="3"  name="storageLocation" ></textarea><br/>
       Huomautuksia:<br/>
       <textarea rows="3" name="comments" ></textarea><br/>
       <input type="submit" value="Lis‰‰ tuotteet">            
      </form>
    </div>
