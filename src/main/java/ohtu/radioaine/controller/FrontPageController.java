package ohtu.radioaine.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import ohtu.radioaine.service.BatchService;

@Controller
public class FrontPageController {

    @Autowired
    private BatchService esinePalvelu;

    @RequestMapping("*")
    public String list() {
        return "redirect:/list";
    }
    
    @RequestMapping("list")
    public String frontpage() {
        return "frontpage";
    }

}
