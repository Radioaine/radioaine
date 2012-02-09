package ohtu.radioaine.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import ohtu.radioaine.service.BatchService;

@Controller
public class RadioDrugController {

    @Autowired
    private BatchService esinePalvelu;

    @RequestMapping("createRadioDrug")
    public String createRadioDrug() {
        return "createRadioDrug";
    }

}
