package ohtu.radioaine.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import ohtu.radioaine.service.BatchService;
import ohtu.radioaine.service.EventService;
import org.springframework.ui.Model;

/**
 * Controllers for historypage
 * @author rmjheino
 */
@Controller
public class HistoryController {

    @Autowired
    private EventService eventService;
    
    @RequestMapping("historyView")
    public String history(Model model) {
        model.addAttribute("events", eventService.list());
        return "historyView";
    }

}
