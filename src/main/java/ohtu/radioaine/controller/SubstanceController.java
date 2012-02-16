package ohtu.radioaine.controller;

import javax.validation.Valid;
import ohtu.radioaine.domain.Substance;
import ohtu.radioaine.domain.SubstanceFormObject;
import ohtu.radioaine.service.BatchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import ohtu.radioaine.service.SubstanceService;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SubstanceController {

    @Autowired
    private SubstanceService substanceService;
    
    @Autowired
    private BatchService batchService;

    @RequestMapping(value = "substance/{id}", method = RequestMethod.GET)
    public String getSubstanceById(@PathVariable Integer id, Model model) {
        model.addAttribute("substance", substanceService.read(id));
        model.addAttribute("substanceBatches", batchService.listSubstanceBatches(id));
        return "substanceView";
    }

    @RequestMapping(value = "substance", method = RequestMethod.POST)
    public String addSubstance(@Valid @ModelAttribute("substance") SubstanceFormObject sfo, BindingResult result) {
        if(result.hasErrors()) {
            return "addSubstanceView";
        }
        substanceService.createOrUpdate(createSubstance(sfo));
        return "redirect:/substanceList";
    }
    
    private Substance createSubstance(SubstanceFormObject sfo) {
        Substance substance = new Substance();
        substance.setName(sfo.getName());
        substance.setManufacturer(sfo.getManufacturer());
        substance.setSupplier(sfo.getSupplier());
        substance.setAlertLimit1(sfo.getAlertLimit1());
        substance.setAlertLimit2(sfo.getAlertLimit2());
        substance.setTotalAmount(0);
        if(sfo.getNeedsColdStorage().equals("1")) {
            substance.setNeedsColdStorage(true);
        }
        else {
            substance.setNeedsColdStorage(false);
        }
        return substance;
    }

    @RequestMapping(value = "substance", method = RequestMethod.GET)
    public String listaa(Model model) {
        model.addAttribute("substances", substanceService.list());
        return "substanceViewTest";
    }

    @RequestMapping(value = "addSubstance", method = RequestMethod.GET)
    public String addSubstanceView(Model model) {
        model.addAttribute("substance", new SubstanceFormObject());
        return "addSubstanceView";
    }
}
