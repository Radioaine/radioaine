/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ohtu.radioaine.tools;

import java.util.ArrayList;
import java.util.List;
import ohtu.radioaine.domain.Batch;
import ohtu.radioaine.domain.Event;



/**
 *
 * @author Juuso
 */
public class EventHandler {

    private static final String NEWBATCH = "NEWBATCH";

    public static Event createEvent(Batch batch) {
        Event event = new Event();
        List<Batch> batchList = new ArrayList<Batch>();
        batchList.add(batch);
        event.setBatches(batchList);
        event.setMessage("Uusi erä");
        event.setType(NEWBATCH);
        return event;
    }
}
