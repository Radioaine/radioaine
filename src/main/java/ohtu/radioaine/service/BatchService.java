package ohtu.radioaine.service;

import java.util.List;
import ohtu.radioaine.domain.Batch;

/**
 * Interface for DAO methods
 * @author rmjheino
 */
public interface BatchService {
    public Batch create(Batch esine);
    public List<Batch> listaa();
    public Batch read(int id);
    public void delete(int esineId);
    public List<Batch> listBatchesWhereSubstancee(int id);
}
