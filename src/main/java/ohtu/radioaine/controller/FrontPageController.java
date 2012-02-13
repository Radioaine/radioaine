package ohtu.radioaine.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import ohtu.radioaine.service.BatchService;
import ohtu.radioaine.service.SubstanceService;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class FrontPageController {
    
    @Autowired
    private SubstanceService substanceService;

    @Autowired
    private BatchService esinePalvelu;

    @RequestMapping("*")
    public String list() {
        return "redirect:/list";
    }
    
    @RequestMapping(value = "list", method = RequestMethod.GET)
    public String batchList(Model model) {
        model.addAttribute("substances", substanceService.listaa());
        return "frontpage";
    }

}
