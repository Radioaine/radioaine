/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ohtu.radioaine.database;

import java.sql.Timestamp;
import java.util.List;
import ohtu.radioaine.domain.RadioMedicine;

/**
 *
 * @author Richard Moneybags
 */
public interface RadioMedDBDao extends DAO<RadioMedicine> {
    public List<RadioMedicine> list();

    public List<RadioMedicine> list(Timestamp startDate, Timestamp endDate);
 
}
