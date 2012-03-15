package ohtu.radioaine.database;

import java.util.List;
import ohtu.radioaine.domain.Batch;

/**
 * Adds list-method for BatchDBDao
 *
 * @author rmjheino
 */
public interface BatchDBDao extends DAO<Batch> {

    public List<Batch> list();

    public List<Batch> listSubstanceBatches(int id);

    public List<Batch> getBatchesByType(int type);

    public Batch read(String batchNumber, int substance);
}
