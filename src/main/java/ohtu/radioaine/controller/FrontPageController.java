package ohtu.radioaine.controller;

import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import ohtu.radioaine.service.BatchService;
import ohtu.radioaine.service.EluateService;
import ohtu.radioaine.service.RadioMedService;
import ohtu.radioaine.service.StorageService;
import ohtu.radioaine.tools.Time;
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
    public String redirectToFrontpageCTRL() {
        return "redirect:/frontpage";
    }

    @RequestMapping(value = "frontpage", method = RequestMethod.GET)
    public String frontPageCTRL(Model model) {
        Calendar calendar = Calendar.getInstance();
        Date now = calendar.getTime();
        Timestamp timestamp = new java.sql.Timestamp(now.getTime());
        model.addAttribute("eluates", eluateService.getAllByDate(Time.getTodayDate()));
        model.addAttribute("radioMeds", radioMedService.list());
        model.addAttribute("generators", batchService.getBatchesByType(GENERATOR));
        model.addAttribute("storages", storageService.list());
        return "frontpage";
    }
}
