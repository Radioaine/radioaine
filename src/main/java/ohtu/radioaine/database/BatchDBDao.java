/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ohtu.radioaine.database;

import java.util.List;
import ohtu.radioaine.domain.Batch;
import ohtu.radioaine.domain.Substance;

/**
 *
 * @author Juuso
 */
public interface BatchDBDao extends DAO<Batch>{
    public List<Batch> list();
}
