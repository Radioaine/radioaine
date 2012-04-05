package ohtu.radioaine.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import ohtu.radioaine.service.BatchService;
import ohtu.radioaine.service.EluateService;
import ohtu.radioaine.service.RadioMedService;
import ohtu.radioaine.service.StorageService;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Controllers for frontpage
 *
 * @author rmjheino
 */
@Controller
public class FrontPageController {

    long GENERATOR = 1;
    @Autowired
    private EluateService eluateService;
    @Autowired
    private RadioMedService radioMedService;
    @Autowired
    private BatchService batchService;
    @Autowired
    private StorageService storageService;

    @RequestMapping("*")
    public String list() {
        return "redirect:/frontpage";
    }

    @RequestMapping(value = "frontpage", method = RequestMethod.GET)
    public String frontPage(Model model) {
        model.addAttribute("eluates", eluateService.list());
        model.addAttribute("radioMeds", radioMedService.list());
        model.addAttribute("generators", batchService.getBatchesByType(GENERATOR));
        model.addAttribute("storages", storageService.list());
        return "frontpage";
    }
}
