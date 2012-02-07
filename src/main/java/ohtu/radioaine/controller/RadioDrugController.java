package ohtu.radioaine.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import ohtu.radioaine.service.SubstanceService;

@Controller
public class RadioDrugController {

    @Autowired
    private SubstanceService esinePalvelu;

    @RequestMapping("createRadioDrug")
    public String createRadioDrug() {
        return "createRadioDrug";
    }

}
