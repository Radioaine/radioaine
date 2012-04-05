package ohtu.radioaine.database;

import java.sql.Timestamp;
import java.util.List;
import ohtu.radioaine.domain.Batch;

/**
 * Adds list-method for BatchDBDao
 *
 * @author rmjheino
 */
public interface BatchDBDao extends DAO<Batch> {

    public List<Batch> list();
    public List<Batch> list(Timestamp start, Timestamp end);

    public List<Batch> listSubstanceBatches(Long id);

    public List<Batch> getBatchesByType(Long type);

    public Batch read(String batchNumber, Long substance);
}
