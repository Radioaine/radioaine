package ohtu.radioaine.database;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import org.springframework.stereotype.Repository;
import ohtu.radioaine.domain.Batch;

/**
 * DB methods for Batch
 *
 * @author rmjheino
 */
@Repository
public class JPABatchDBDao implements BatchDBDao {

    @PersistenceContext
    EntityManager entityManager;

    @Override
    public Batch createOrUpdate(Batch instance) {
        return entityManager.merge(instance);
    }

    @Override
    public Batch read(int id) {
        return entityManager.find(Batch.class, id);
    }

    @Override
    public void delete(Batch instance) {
        entityManager.remove(instance);
    }

    @Override
    public Batch update(Batch instance) {
        return entityManager.merge(instance);
    }

    @Override
    public List<Batch> list() {
        Query q = entityManager.createQuery("SELECT b FROM Batch b");
        return q.getResultList();
    }

    @Override
    public List<Batch> listSubstanceBatches(int id) {
        Query q = entityManager.createQuery("SELECT b FROM Batch b WHERE b.substance.id=" + id);
        return q.getResultList();
    }

    @Override
    public Batch read(String batchNumber, int substance) {
        try {
            Query q = entityManager.createQuery("SELECT b FROM Batch b WHERE b.batchNumber='" + batchNumber + "' AND b.substance.id=" + substance);
            return (Batch) q.getSingleResult();
        } catch (NoResultException e) {
            return null;
        }
    }

    @Override
    public List<Batch> getBatchesByType(int type) {
        try {
            Query q = entityManager.createQuery("SELECT b FROM Batch b WHERE b.substance.type=" + type);
            return q.getResultList();
        } catch (NoResultException e) {
            return null;
        }
    }
}
