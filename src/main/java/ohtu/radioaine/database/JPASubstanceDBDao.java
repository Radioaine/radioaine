package ohtu.radioaine.database;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import org.springframework.stereotype.Repository;
import ohtu.radioaine.domain.Substance;

@Repository
public class JPASubstanceDBDao implements SubstanceDBDao {

    @PersistenceContext
    EntityManager entityManager;

    @Override
    public Substance create(Substance instance) {
        return entityManager.merge(instance);
    }

    @Override
    public Substance read(long id) {
        return entityManager.find(Substance.class, id);
    }

    @Override
    public void delete(Substance instance) {
        entityManager.remove(instance);
    }

    @Override
    public Substance update(Substance instance) {
        return entityManager.merge(instance);
    }

    @Override
    public List<Substance> list() {
        Query q = entityManager.createQuery("SELECT e FROM Substance e");
        return q.getResultList();
    }
}
