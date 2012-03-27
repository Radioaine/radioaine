package ohtu.radioaine.controller;

import javax.validation.Valid;
import ohtu.radioaine.domain.Substance;
import ohtu.radioaine.domain.SubstanceFormObject;
import ohtu.radioaine.service.BatchService;
import ohtu.radioaine.service.EventService;
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
    @Autowired
    private EventService eventService;
    
    @RequestMapping(value = "substance/{id}", method = RequestMethod.GET)
    public String getSubstanceById(@PathVariable Integer id, Model model) {
        Substance substance = (Substance) substanceService.read(id);
        model.addAttribute("substance", substance);
        model.addAttribute("substanceBatches", batchService.listSubstanceBatches(id));
        model.addAttribute("substanceHistory", eventService.list(substance.getName()));
        return "substanceBatches";
    }

    @RequestMapping(value = "substance", method = RequestMethod.POST)
    public String addSubstance(@Valid @ModelAttribute("substance") SubstanceFormObject sfo, BindingResult result) {
        if (result.hasErrors()) {
            return "addSubstanceView";
        }
        substanceService.createOrUpdate(createSubstance(sfo));
        return "redirect:/substanceList";
    }

    private Substance createSubstance(SubstanceFormObject sfo) {
        Substance substance = new Substance();
        substance.setType(sfo.getType());
        substance.setName(sfo.getName());
        substance.setManufacturer(sfo.getManufacturer());
        substance.setSupplier(sfo.getSupplier());
        substance.setAlertLimit1(sfo.getAlertLimit1());
        substance.setAlertLimit2(sfo.getAlertLimit2());
        substance.setTotalAmount(0);

        return substance;
    }

    @RequestMapping(value = "substance", method = RequestMethod.GET)
    public String listaa(Model model) {
        model.addAttribute("substances", substanceService.list());
        return "substanceViewTest";
    }

    @RequestMapping(value = "updateSubstance/{id}", method = RequestMethod.POST)
    public String updateSubstance(@Valid @ModelAttribute("substance") SubstanceFormObject sfm,
            BindingResult result,
            Model model,
            @PathVariable Integer id) {
        Substance temp = (Substance) substanceService.read(id);
        Substance substance = new Substance();
        substance.setId(temp.getId());
        substance.setName(sfm.getName());
        substance.setType(sfm.getType());
        substance.setAlertLimit1(sfm.getAlertLimit1());
        substance.setAlertLimit2(sfm.getAlertLimit2());
        substance.setNeedsColdStorage(sfm.getNeedsColdStorage());
        substance.setManufacturer(sfm.getManufacturer());
        substance.setSupplier(sfm.getSupplier());
        substanceService.createOrUpdate(substance);

        return "redirect:/updateSubstance/" + id;
    }

    @RequestMapping(value = "updateSubstance/{id}", method = RequestMethod.GET)
    public String updateSubstanceView(Model model, @PathVariable Integer id) {
        System.out.println(id);
        model.addAttribute("substance", substanceService.read(id));
        return "substanceUpdateView";
    }

    @RequestMapping(value = "addSubstance", method = RequestMethod.GET)
    public String addSubstanceView(Model model) {
        model.addAttribute("substance", new SubstanceFormObject());
        return "addSubstanceView";
    }
    
    
}
