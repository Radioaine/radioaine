package ohtu.radioaine.database;

import java.util.List;
import ohtu.radioaine.domain.Batch;

public interface BatchDBDao extends DAO<Batch> {
    public List<Batch> list();
}
