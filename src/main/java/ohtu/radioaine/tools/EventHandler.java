/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ohtu.radioaine.tools;

import ohtu.radioaine.domain.*;
import ohtu.radioaine.service.EventService;
import org.springframework.beans.factory.annotation.Autowired;



/**
 *
 * @author Richard Moneybags
 */
public class EventHandler {
    
    public static Event newBatchEvent(Batch batch, String sig) {
        Event event = new Event();
        event.setInfo("type=arrived "+batch.toString());
        event.setAmount(batch.getAmount());
        event.setBatchNumber(batch.getBatchNumber());
        event.setNote(batch.getNote());
        event.setSignature(sig);
        event.setSubstanceName(batch.getSubstance().getName());
        event.setArrivalDate(batch.getArrivalDate());
        event.setExpDate(batch.getExpDate());
        return event;
    }

    public static Event updateBatchEvent(Batch batch, String sig) {
        Event event = new Event();
        event.setInfo("type=modifyBatch "+batch.toString());
        return event;
    }

    public static Event addToBatchEvent(Batch batch, String sig) {
        Event event = new Event();
        event.setAmount(batch.getAmount());
        event.setBatchNumber(batch.getBatchNumber());
        event.setNote(batch.getNote());
        event.setSignature(sig);
        event.setSubstanceName(batch.getSubstance().getName());
        event.setArrivalDate(batch.getArrivalDate());
        event.setExpDate(batch.getExpDate());
        event.setInfo("type=arrived "+batch.toString());
        return event;
    }
    
    public static Event removeFromBatchEvent(Batch batch, String sig, String reason, int amount) {
        Event event = new Event();
        event.setNote(reason);
        event.setSignature(sig);
        event.setAmount(amount);
        event.setBatchNumber(batch.getBatchNumber());
        event.setExpDate(batch.getExpDate());
        event.setSubstanceName(batch.getSubstance().getName());
        event.setInfo("type=removed "+batch.toString());
        return event;
    }
    
    public static Event qualityCheckEvent(Batch batch, String sig) {
        Event event = new Event();
        event.setInfo("type=qualityCheck "+batch.toString());
        return event;
    }
    
    public static Event newSubstanceEvent(Substance substance, String sig){
        Event event = new Event();
        event.setSignature(sig);
        event.setInfo("type=newSubstance "+substance.toString());
        return event;
    }
    
    public static Event newEluateEvent(Eluate eluate, String sig){
        Event event = new Event();
        event.setSignature(sig);
        event.setInfo("type=newEluate "+eluate.toString());
        return event;
    }
    
    public static Event updateEluateEvent(Eluate eluate, String sig){
        Event event = new Event();
        event.setSignature(sig);
        event.setInfo("type=updateEluate "+eluate.toString());
        return event;
    }
    public static Event newRadioMedEvent(RadioMedicine radioMed, String sig){
        Event event = new Event();
        event.setSignature(sig);
        event.setSubstanceName(radioMed.getName());
        event.setInfo("type=newRadioMed "+radioMed.toString());
        return event;
    }
}
