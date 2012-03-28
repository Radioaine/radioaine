/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ohtu.radioaine.database;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import ohtu.radioaine.domain.Storage;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Jarno
 */
@Repository
public class JPAStorageDBDao implements StorageDBDao    {
    @PersistenceContext
    EntityManager entityManager;

    @Override
    public Storage createOrUpdate(Storage instance) {
        return entityManager.merge(instance);
    }

    @Override
    public Storage read(int id) {
        return entityManager.find(Storage.class, id);
    }

    @Override
    public void delete(Storage instance) {
        entityManager.remove(instance);
    }

    @Override
    public Storage update(Storage instance) {
        return entityManager.merge(instance);
    }

    @Override
    public List<Storage> list() {
        Query q = entityManager.createQuery("SELECT b FROM Storage b");
        return q.getResultList();
    }
}
