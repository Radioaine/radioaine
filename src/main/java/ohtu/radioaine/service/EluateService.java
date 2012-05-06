/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ohtu.radioaine.service;

import java.sql.Timestamp;
import java.util.List;
import ohtu.radioaine.domain.Eluate;

/**
 *
 * @author rmjheino
 */
public interface EluateService {
    public Eluate createOrUpdate(Eluate eluate);
    public List<Eluate> list();
    public Eluate read(Long id);
    public void delete(Long id);
    public List<Eluate> getAllByDate(Timestamp timestamp);
    public List<Eluate> list(Timestamp startDate, Timestamp endDate);
}