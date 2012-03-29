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
import ohtu.radioaine.domain.RadioMedicine;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Richard Moneybags
 */
@Repository
public class JPARadioMedDBDao implements RadioMedDBDao {
    
    @PersistenceContext
    EntityManager entityManager;
    
    @Override
    public List<RadioMedicine> list() {
        Query q = entityManager.createQuery("SELECT e FROM RadioMedicine e");
        return q.getResultList();
    }

    @Override
    public RadioMedicine createOrUpdate(RadioMedicine instance) {
        return entityManager.merge(instance);
    }

    @Override
    public RadioMedicine read(int id) {
        return entityManager.find(RadioMedicine.class, id);
    }

    @Override
    public void delete(RadioMedicine instance) {
        entityManager.remove(instance);
    }

    @Override
    public RadioMedicine update(RadioMedicine instance) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public List<RadioMedicine> list(Timestamp startDate, Timestamp endDate) {
        Query q = entityManager.createQuery("SELECT e FROM RadioMedicine e WHERE e.date between '"+startDate+"' AND '"+endDate+"'");
        return q.getResultList();
    }
    
}
