package ohtu.radioaine.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ohtu.radioaine.database.ProductDBDao;
import ohtu.radioaine.domain.Product;

@Service
public class SimpleProductService implements ProductService {

    @Autowired
    private ProductDBDao varastoDao;

    @Override
    @Transactional
    public void lisaa(Product esine) {
        varastoDao.create(esine);
    }

    @Override
    @Transactional(readOnly = true)
    public List<Product> listaa() {
        return varastoDao.list();
    }

    @Override
    @Transactional
    public void poista(int esineId) {
        Product e = varastoDao.read(esineId);
        if (e != null) {
            varastoDao.delete(e);
        }
    }
}
