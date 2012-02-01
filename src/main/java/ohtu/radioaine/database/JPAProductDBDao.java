package ohtu.radioaine.database;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import org.springframework.stereotype.Repository;
import ohtu.radioaine.domain.Product;

@Repository
public class JPAProductDBDao implements ProductDBDao {

    @PersistenceContext
    EntityManager entityManager;

    @Override
    public void create(Product instance) {
        entityManager.merge(instance);
    }

    @Override
    public Product read(int id) {
        return entityManager.find(Product.class, id);
    }

    @Override
    public void delete(Product instance) {
        entityManager.remove(instance);
    }

    @Override
    public Product update(Product instance) {
        return entityManager.merge(instance);
    }

    @Override
    public List<Product> list() {
        Query q = entityManager.createQuery("SELECT e FROM Esine e");
        return q.getResultList();
    }
}
