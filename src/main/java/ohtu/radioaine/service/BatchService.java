package ohtu.radioaine.service;

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

    public Batch read(int id);

    public void delete(int id);

    public List<Batch> listSubstanceBatches(int id);

    public Batch read(String batchNumber, int substance);

    public List<Batch> getBatchesByType(int type);
}
