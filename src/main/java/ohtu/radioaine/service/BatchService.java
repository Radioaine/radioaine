package ohtu.radioaine.service;

import java.sql.Timestamp;
import java.util.List;
import ohtu.radioaine.domain.Batch;

/**
 * Interface for DAO methods
 *
 * @author rmjheino
 */
public interface BatchService {

    public Batch createOrUpdate(Batch batch);

    public List<Batch> list();
    public List<Batch> list(Timestamp start, Timestamp end);

    public Batch read(Long id);

    public void delete(Long id);

    public List<Batch> listSubstanceBatches(Long id);

    public Batch read(String batchNumber, Long substance);

    public List<Batch> getBatchesByType(Long type);
}
