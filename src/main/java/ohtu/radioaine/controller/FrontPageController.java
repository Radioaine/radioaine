package ohtu.radioaine.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import ohtu.radioaine.domain.Product;
import ohtu.radioaine.service.ProductService;

@Controller
public class FrontPageController {

    @Autowired
    private ProductService esinePalvelu;

    @RequestMapping("*")
    public String list() {
        return "redirect:/list";
    }
    
    //Proto by rmjheino
    @RequestMapping("add")
    public String addProduct() {
        return "addToProduct";
    }

    @RequestMapping("createRadioDrug")
    public String createRadioDrug() {
        return "createRadioDrug";
    }
    
    @RequestMapping("createEluate")
    public String createEluate() {
        return "createEluate";
    }
    
    @RequestMapping("list")
    public String frontpage() {
        return "frontpage";
    }
    
    @RequestMapping("historyView")
    public String history() {
        return "historyView";
    }
    
    @RequestMapping("product")
    public String productView() {
        return "productView";
    }
    
    @RequestMapping("batch")
    public String batchView() {
        return "batchView";
    }
    
    @RequestMapping("admin")
    public String adminView() {
        return "admin";
    }
    

    @RequestMapping(value = "lisaa", method = RequestMethod.POST)
    public String lisaa(@ModelAttribute Product esine) {
        esinePalvelu.lisaa(esine);
        return "redirect:/listaa";
    }

    @RequestMapping(value = "poista/{esineId}")
    public String poista(@PathVariable Integer esineId) {
        esinePalvelu.poista(esineId);
        return "redirect:/listaa";
    }
}
