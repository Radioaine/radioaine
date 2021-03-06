/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ohtu.radioaine.database;

import java.sql.Timestamp;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import ohtu.radioaine.domain.Eluate;
import org.springframework.stereotype.Repository;

/**
 *
 * @author rmjheino
 */
@Repository
public class JPAEluateDBDao implements EluateDBDao {

    @PersistenceContext
    EntityManager entityManager;

    @Override
    public Eluate createOrUpdate(Eluate instance) {
        return entityManager.merge(instance);
    }

    @Override
    public Eluate read(Long id) {
        return entityManager.find(Eluate.class, id);
    }

    @Override
    public void delete(Eluate instance) {
        entityManager.remove(instance);
    }

    @Override
    public Eluate update(Eluate instance) {
        return entityManager.merge(instance);
    }

    @Override
    public List<Eluate> list() {
        Query q = entityManager.createQuery("SELECT e FROM Eluate e");
        return q.getResultList();
    }

    @Override
    public List<Eluate> getAllByDate(Timestamp timestamp) {
        Query q = entityManager.createQuery("SELECT e FROM Eluate e WHERE e.date >'" + timestamp + "'");
        return q.getResultList();
    }

    @Override
    public List<Eluate> list(Timestamp startDate, Timestamp endDate) {
        Query q = entityManager.createQuery("SELECT e FROM Eluate e WHERE e.date between '" + startDate + "' AND '" + endDate + "' ORDER BY e.date ASC");
        return q.getResultList();
    }
}
