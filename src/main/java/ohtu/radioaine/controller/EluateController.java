package ohtu.radioaine.controller;

import javax.validation.Valid;
import ohtu.radioaine.domain.Eluate;
import ohtu.radioaine.domain.EluateFormObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import ohtu.radioaine.service.EluateService;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Controllers for eluate creation ja viewing
 * @author rmjheino
 */
@Controller
public class EluateController {

    @Autowired
    private EluateService eluateService;

    @RequestMapping("createEluate")
    public String createEluate() {
        return "createEluate";
    }
    
    @RequestMapping(value = "createEluate", method = RequestMethod.POST)
    public String newEluate(@Valid @ModelAttribute("eluate") EluateFormObject efo, BindingResult result) {
        if (result.hasErrors()) {
            return "createEluate";
        }
        Eluate eluate = createEluate(efo);
        Eluate temp = EluateService.read(Eluate.getEluateNumber(), bfm.getSubstance());
        if (temp == null) {
            Eluate = EluateService.createOrUpdate(Eluate);
            Event event = EventHandler.newEluateEvent(Eluate);
            eventService.createOrUpdate(event);
        } else {
            Eluate = updateEluateSaato(temp.getId(), bfm);
        }
        return "redirect:/Eluate/" + Eluate.getId();
        return "createEluate";
    }
    

}
