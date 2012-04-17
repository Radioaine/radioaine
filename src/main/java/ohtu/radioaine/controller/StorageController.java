package ohtu.radioaine.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import ohtu.radioaine.service.BatchService;
import ohtu.radioaine.service.SubstanceService;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class StorageController {
    
    @Autowired
    private SubstanceService substanceService;

    @Autowired
    private BatchService esinePalvelu;
    
    @RequestMapping(value = "storage", method = RequestMethod.GET)
    public String storageViewCTRL(Model model) {
        model.addAttribute("substances", substanceService.list());
        return "storageView";
    }

}
