/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ohtu.radioaine.database;

import java.sql.Timestamp;
import java.util.List;
import ohtu.radioaine.domain.Eluate;

/**
 *
 * @author rmjheino
 */
public interface EluateDBDao extends DAO<Eluate>{
    public List<Eluate> list();
    public List<Eluate> getAllByDate(Timestamp timestamp);
    public List<Eluate> list(Timestamp startDate, Timestamp endDate);
}


