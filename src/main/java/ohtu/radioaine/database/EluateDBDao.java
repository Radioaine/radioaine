/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ohtu.radioaine.database;

import java.util.List;
import ohtu.radioaine.domain.Eluate;

/**
 *
 * @author rmjheino
 */
public interface EluateDBDao extends DAO<Eluate>{
    public List<Eluate> list();
}
