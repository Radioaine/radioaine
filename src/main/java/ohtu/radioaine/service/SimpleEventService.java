/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ohtu.radioaine.service;

import java.util.List;
import ohtu.radioaine.database.EventDBDao;
import ohtu.radioaine.domain.Event;
import ohtu.radioaine.domain.Event3;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Richard Moneybags
 */
@Service
public class SimpleEventService implements EventService {
    
    @Autowired
    private EventDBDao varastoDao;
    
    @Override
    @Transactional
    public Event createOrUpdate(Event event) {
        return varastoDao.createOrUpdate(event);
    }

    @Override
    @Transactional
    public List<Event> list() {
        return varastoDao.list();
    }

    @Override
    @Transactional
    public Event read(int id) {
        return varastoDao.read(id);
    }

    @Override
    @Transactional
    public void delete(int id) {
        Event e = varastoDao.read(id);
        if (e != null) {
            varastoDao.delete(e);
        }
    }   
}
