package ohtu.radioaine.database;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import org.springframework.stereotype.Repository;
import ohtu.radioaine.domain.Batch;

/**
 * DB methods for Batch
 * @author rmjheino
 */
@Repository
public class JPABatchDBDao implements BatchDBDao {

    @PersistenceContext
    EntityManager entityManager;
    
    @Override
    public Batch create(Batch instance) {
       return entityManager.merge(instance);
    }

    @Override
    public Batch read(long id) {
        System.out.println("db id: " + id);
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
}
