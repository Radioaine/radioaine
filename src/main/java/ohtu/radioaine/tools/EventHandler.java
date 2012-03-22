/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ohtu.radioaine.tools;

import ohtu.radioaine.domain.Batch;
import ohtu.radioaine.domain.Event;
import ohtu.radioaine.domain.Substance;
import ohtu.radioaine.service.EventService;
import org.springframework.beans.factory.annotation.Autowired;



/**
 *
 * @author Richard Moneybags
 */
public class EventHandler {
    
    public static Event newBatchEvent(Batch batch) {
        Event event = new Event();
        event.setHappening("type=newBatch "+batch.toStringDB());
        event.setInfo("Luotiin erä "+batch.toStringShow());
        return event;
    }

    public static Event updateBatchEvent(Batch batch) {
        Event event = new Event();
        event.setHappening("type=modifyBatch "+batch.toStringDB());
        event.setInfo("Muokattiin "+batch.toStringShow());
        return event;
    }

    public static Event addToBatchEvent(Batch batch) {
        Event event = new Event();
        event.setHappening("type=addToBatch "+batch.toStringDB());
        event.setInfo("Lisättiin erään "+batch.toStringShow());
        return event;
    }
    
    public static Event newSubstanceEvent(Substance substance){
        Event event = new Event();
        event.setHappening("type=newSubstance "+substance.toStringDB());
        event.setInfo("Lisättiin uusi aine "+substance.toStringShow());
        return event;
    }
    
}
