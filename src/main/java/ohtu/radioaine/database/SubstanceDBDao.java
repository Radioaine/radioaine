package ohtu.radioaine.database;

import java.util.List;
import ohtu.radioaine.domain.Substance;

public interface SubstanceDBDao extends DAO<Substance> {
    public List<Substance> list();
    @Override
    public Substance create(Substance instance);
}
