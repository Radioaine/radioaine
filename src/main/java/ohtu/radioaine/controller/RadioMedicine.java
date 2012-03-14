package ohtu.radioaine.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import ohtu.radioaine.service.BatchService;
import ohtu.radioaine.service.SubstanceService;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class RadioMedicine {

    @Autowired
    private BatchService esinePalvelu;
    
    @Autowired
    private SubstanceService substanceService;

    @RequestMapping("createRadioMedicine")
    public String createRadioMedicine() {
        return "createRadioMedicine";
    }
    
    @RequestMapping(value = "createRadioMedicine", method = RequestMethod.GET)
    public String createRadioMedicineView(Model model) {
        model.addAttribute("substances", substanceService.list());
        return "createRadioMedicine";
    }

}
