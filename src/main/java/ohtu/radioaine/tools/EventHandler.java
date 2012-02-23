/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ohtu.radioaine.tools;

import java.util.ArrayList;
import java.util.List;
import ohtu.radioaine.domain.Batch;
import ohtu.radioaine.domain.Event;
import ohtu.radioaine.service.EventService;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author Juuso
 */
public class EventHandler {

    public static Event createEvent(String message, List<Object> objects) {
        Event event = new Event(objects);
        event.setHappening(message);
        return event;
    }

    public static Event createEvent(String message, Batch batch) {
        List<Object> list = new ArrayList<Object>();
        list.add(batch);
        return createEvent(message, list);
    }
}
