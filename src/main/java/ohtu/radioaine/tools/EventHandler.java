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
    
    public static Event newBatchEvent(Batch batch, String sig) {
        Event event = new Event();
        event.setHappening("type=newBatch "+batch.toStringDB());
        event.setInfo("Luotiin erä "+batch.toStringShow()+", kirjaaja= "+sig);
        return event;
    }

    public static Event updateBatchEvent(Batch batch, String sig) {
        Event event = new Event();
        event.setHappening("type=modifyBatch "+batch.toStringDB());
        event.setInfo("Muokattiin "+batch.toStringShow()+", kirjaaja= "+sig);
        return event;
    }

    public static Event addToBatchEvent(Batch batch, String sig) {
        Event event = new Event();
        event.setHappening("type=addToBatch "+batch.toStringDB());
        event.setInfo("Lisättiin erään "+batch.toStringShow()+", kirjaaja= "+sig);
        return event;
    }
    
    public static Event qualityCheckEvent(Batch batch, String sig) {
        Event event = new Event();
        event.setHappening("type=qualityCheck "+batch.toStringDB());
        event.setInfo("Suoritettiin laadunvarmistus aineen "+batch.getSubstance().getName()+" erälle "+batch.getBatchNumber()+", kirjaaja= "+sig);
        return event;
    }
    
    public static Event newSubstanceEvent(Substance substance, String sig){
        Event event = new Event();
        event.setHappening("type=newSubstance "+substance.toStringDB());
        event.setInfo("Lisättiin uusi aine "+substance.toStringShow()+", kirjaaja= "+sig);
        return event;
    }  
}
