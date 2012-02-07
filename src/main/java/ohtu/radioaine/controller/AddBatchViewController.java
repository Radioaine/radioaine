package ohtu.radioaine.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import ohtu.radioaine.service.ProductService;

@Controller
public class AddBatchViewController {

    @Autowired
    private ProductService esinePalvelu;

    @RequestMapping("add")
    public String addBatch() {
        return "addBatchView";
    }

}
