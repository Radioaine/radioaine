/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ohtu.radioaine.service;

import java.util.List;
import ohtu.radioaine.domain.Event;
import ohtu.radioaine.domain.Event3;

/**
 *
 * @author Richard Moneybags
 */
public interface EventService {
    public Event createOrUpdate(Event event);
    public List<Event> list();
    public List<Event> list(String arg);
    public Event read(int id);
    public void delete(int eventId);
}
