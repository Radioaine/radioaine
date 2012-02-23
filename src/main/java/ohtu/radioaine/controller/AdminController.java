/*
 * :
 *  - admin: directs caller to admin page.
 */

package ohtu.radioaine.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import ohtu.radioaine.service.BatchService;
import ohtu.radioaine.service.SubstanceService;
import org.springframework.ui.Model;

/**
 * Controllers for admin page.
 * @author rmjheino
 * 
 */
@Controller
public class AdminController {

    @Autowired
    private SubstanceService substanceService;
  
    @RequestMapping("admin")
    public String adminView() {
        return "admin";
    }
    
    @RequestMapping("substanceView")
    public String substancesUpdate(Model model) {
        model.addAttribute("substances", substanceService.list());
        return "substanceView";
    }
    
}
