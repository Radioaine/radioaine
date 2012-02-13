/*
 * :
 *  - admin: directs caller to admin page.
 */

package ohtu.radioaine.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import ohtu.radioaine.service.BatchService;

/**
 * Controllers for admin page.
 * @author rmjheino
 * 
 */
@Controller
public class AdminController {

    @Autowired
    private BatchService esinePalvelu;
  
    @RequestMapping("admin")
    public String adminView() {
        return "admin";
    }
}
