/*
 * :
 *  - admin: directs caller to admin page.
 */

package ohtu.radioaine.controller;

import javax.validation.Valid;
import ohtu.radioaine.domain.Storage;
import ohtu.radioaine.domain.StorageFormObject;
import ohtu.radioaine.domain.Substance;
import ohtu.radioaine.service.StorageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import ohtu.radioaine.service.SubstanceService;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

/**
 * Controllers for admin page.
 * @author rmjheino
 * 
 */
@Controller
public class AdminController {

    @Autowired
    private SubstanceService substanceService;
    
    @Autowired
    private StorageService storageService;
  
    @RequestMapping("admin")
    public String adminView(Model model) {
        model.addAttribute("substances", substanceService.list());
        return "admin";
    }
    
    @RequestMapping("substanceView")
    public String substancesUpdate(Model model) {
        model.addAttribute("substances", substanceService.list());
        return "substanceView";
    }
    
    @RequestMapping(value = "addStorage", method = RequestMethod.GET)
    public String addStorageView(Model model) {
        model.addAttribute("storage", new StorageFormObject());
        return "addStorageView";
    }
    
    @RequestMapping(value = "addStorage", method = RequestMethod.POST)
    public String addStorage(@Valid @ModelAttribute("storage") StorageFormObject sfo, BindingResult result) {
        if (result.hasErrors()) {
            return "addStoragesView";
        }
        storageService.createOrUpdate(createStorage(sfo));
        return "redirect:/storagesView";
    }
    
    @RequestMapping("storagesView")
    public String storageView(Model model) {
        model.addAttribute("storages", storageService.list());
        return "storagesView";
    }
    
    private Storage createStorage(StorageFormObject sfo) {
        Storage storage = new Storage();
        storage.setStorageType(sfo.getStorageType());
        storage.setName(sfo.getName());
        storage.setNotes(sfo.getNotes());

        return storage;
    }
    
    @RequestMapping(value = "addStatusComment/{sid}+{cid}")
    public String addStatusComment(@RequestParam String comment, 
    @PathVariable Integer sid,
    @PathVariable Integer cid ){
        Substance temp = (Substance)substanceService.read(sid);
        String [] comments = temp.getStatusMessages();
        comments[cid] = comment;
        temp.setStatusMessages(comments);
        substanceService.createOrUpdate(temp);
        return "redirect:/admin";
    }
    
}
