package ohtu.radioaine.controller;

import java.sql.Timestamp;
import ohtu.radioaine.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import ohtu.radioaine.tools.Time;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * Controllers for historypage
 * @author rmjheino
 */
@Controller
public class HistoryController {

    @Autowired
    private EventService eventService;
    @Autowired
    private BatchService batchService;
    @Autowired
    private SubstanceService substanceService;
    @Autowired
    private RadioMedService radioMedService;
    @Autowired
    private EluateService eluateService;
    
    @RequestMapping("historyView")
    public String historyCTRL(Model model) {
        model.addAttribute("events", eventService.list());
        return "historyView";
    }
    
    @RequestMapping("seekModify")
    public String modifiedCTRL(Model model) {
        model.addAttribute("modified", eventService.list("type=modify"));
        return "historyView";
    }
    
    @RequestMapping("seek")
    public String seekByNameCTRL(@RequestParam String[] reports, 
    Model model,
    @RequestParam String start,
    @RequestParam String end) {
        int counter = 1;
        
        Timestamp startDate = Time.parseTimeStamp(start+" 00:00");
        Timestamp endDate = Time.parseTimeStamp(end+" 23:59");
        for(String str : reports){
            if(str.equals("arrived")){
                model.addAttribute("arrived", eventService.listArrived(startDate, endDate));
            }
            else if(str.equals("removed")){
                model.addAttribute("removed", eventService.listRemoved(startDate, endDate));
            }
            else {
                model.addAttribute("radioMeds", radioMedService.list(startDate, endDate));
            }
            
            counter++;
        }
        model.addAttribute("substances", substanceService.list());
        model.addAttribute("startDate", startDate);
        model.addAttribute("endDate", endDate);
        //model.addAttribute("eluates", eluateService.list());
        
        
        return "raportView";
    }

}
