package ohtu.radioaine.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import ohtu.radioaine.service.ProductService;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ProductViewController {

    @Autowired
    private ProductService esinePalvelu;

    @RequestMapping("product")
    public String productView() {
        return "productView";
    }

    @RequestMapping(value = "product/{productId}", method = RequestMethod.GET)
    public String lisaa(@PathVariable Integer productId) {
        // getProduct(productId);
        return "productView";
    }
}
