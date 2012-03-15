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
        Query q = entityManager.createQuery("SELECT e FROM Batch e");
        return q.getResultList();
    }

    @Override
    public List<Batch> listSubstanceBatches(int id) {
        Query q = entityManager.createQuery("SELECT e FROM Batch e WHERE e.substance.id=" + id);
        return q.getResultList();
    }

    @Override
    public Batch read(String batchNumber, int substance) {
        try {
            Query q = entityManager.createQuery("SELECT e FROM Batch e WHERE e.batchNumber='" + batchNumber + "' AND e.substance.id=" + substance);
            return (Batch) q.getSingleResult();
        } catch (NoResultException e) {
            return null;
        }
    }

    @Override
    public List<Batch> getBatchesByType(int type) {
        try {
            Query q = entityManager.createQuery("SELECT e FROM Batch e WHERE e IN (SELECT * FROM Batch_Substance where Substance.name IN (SELECT s FROM Substance s WHERE s.type='" + type + "')) ORDER BY expDate ASC");
            return q.getResultList();
        } catch (NoResultException e) {
            return null;
        }
    }
}
