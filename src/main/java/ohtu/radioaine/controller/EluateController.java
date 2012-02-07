package ohtu.radioaine.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import ohtu.radioaine.service.SubstanceService;

@Controller
public class EluateController {

    @Autowired
    private SubstanceService esinePalvelu;

    @RequestMapping("createEluate")
    public String createEluate() {
        return "createEluate";
    }

}
