package ohtu.radioaine.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import ohtu.radioaine.service.ProductService;

@Controller
public class HistoryViewController {

    @Autowired
    private ProductService esinePalvelu;
    
    @RequestMapping("historyView")
    public String history() {
        return "historyView";
    }

}
