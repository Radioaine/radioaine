package ohtu.radioaine.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import ohtu.radioaine.service.BatchService;

@Controller
public class HistoryController {

    @Autowired
    private BatchService esinePalvelu;
    
    @RequestMapping("historyView")
    public String history() {
        return "historyView";
    }

}
