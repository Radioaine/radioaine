/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ohtu.radioaine.database;

import java.util.List;
import ohtu.radioaine.domain.Event;
import ohtu.radioaine.domain.Event3;

/**
 *
 * @author Richard Moneybags
 */
public interface EventDBDao extends DAO<Event> {
    public List<Event> list();
}
