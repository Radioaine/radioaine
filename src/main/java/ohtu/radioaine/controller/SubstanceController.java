package ohtu.radioaine.controller;

import ohtu.radioaine.domain.Substance;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import ohtu.radioaine.service.SubstanceService;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SubstanceController {

    @Autowired
    private SubstanceService esinePalvelu;

    @RequestMapping("addSubstance")
    public String substanceView() {
        return "addSubstanceView";
    }

    @RequestMapping(value = "addSubstance", method = RequestMethod.POST)
    public String addSubstance(@ModelAttribute Substance substance) {
        esinePalvelu.lisaa(substance);
        return "redirect:/substanceList";
    }
    
    @RequestMapping("substanceList")
    public String listaa(Model model) {
        System.out.println("listaus");
        model.addAttribute("substances", esinePalvelu.listaa());
        return "substanceViewTest";
    }
    
    
}