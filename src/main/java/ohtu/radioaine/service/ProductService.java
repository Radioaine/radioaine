package ohtu.radioaine.service;

import java.util.List;
import ohtu.radioaine.domain.Product;

public interface ProductService {
    public void lisaa(Product esine);
    public List<Product> listaa();
    public void poista(int esineId);
}
