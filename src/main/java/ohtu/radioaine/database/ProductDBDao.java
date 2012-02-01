package ohtu.radioaine.database;

import java.util.List;
import ohtu.radioaine.domain.Product;

public interface ProductDBDao extends DAO<Product> {
    public List<Product> list();
}
