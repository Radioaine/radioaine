/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ohtu.radioaine.database;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import ohtu.radioaine.domain.Batch;
import ohtu.radioaine.domain.Substance;

/**
 *
 * @author Juuso
 */
public class JPABatchDBDao implements BatchDBDao {

    @PersistenceContext
    EntityManager entityManager;

    @Override
    public void create(Batch instance) {
        entityManager.merge(instance);
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
}
