package ohtu.radioaine.database;

import java.util.List;
import ohtu.radioaine.domain.Batch;

/**
 * Adds list-method for BatchDBDao
 * @author rmjheino
 */

public interface BatchDBDao extends DAO<Batch> {
    public List<Batch> list();
}
