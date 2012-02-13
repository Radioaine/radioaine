package ohtu.radioaine.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import ohtu.radioaine.service.BatchService;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Controllers for 
 * @author rmjheino
 */
@Controller
public class ProductController {

    @Autowired
    private BatchService esinePalvelu;

    @RequestMapping(value = "product", method = RequestMethod.GET)
    public String productView() {
        return "productView";
    }
    
    // This is how you use parameters in request
    @RequestMapping(value = "product/{productId}", method = RequestMethod.GET)
    public String showProductById(@PathVariable Integer productId) {
        // getProduct(productId);
        return "productView";
    }
    
    @RequestMapping(value = "product/{id}", method = RequestMethod.POST)
    public String addProduct() {
        //create product
        //add product to database
        return "productView";
    }
        
}
