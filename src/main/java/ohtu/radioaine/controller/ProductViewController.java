package ohtu.radioaine.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import ohtu.radioaine.service.ProductService;

@Controller
public class ProductPageController {

    @Autowired
    private ProductService esinePalvelu;

    @RequestMapping(value = "nayta/{productId}")
    public String poista(@PathVariable Integer esineId) {
        //esinePalvelu.poista(esineId);
        
        return "productView";
    }
}
