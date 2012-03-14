package ohtu.radioaine.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import ohtu.radioaine.service.BatchService;
import ohtu.radioaine.service.EluateService;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Controllers for frontpage
 * @author rmjheino
 */
@Controller
public class FrontPageController {
    
    @Autowired
    private EluateService eluateService;

    @Autowired
    private BatchService esinePalvelu;

    @RequestMapping("*")
    public String list() {
        return "redirect:/frontpage";
    }
    
    @RequestMapping(value = "frontpage", method = RequestMethod.GET)
    public String frontPage(Model model) {
        model.addAttribute("eluates", eluateService.list());
        return "frontpage";
    }

}
