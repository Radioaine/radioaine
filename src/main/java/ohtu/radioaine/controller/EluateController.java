package ohtu.radioaine.controller;

import java.awt.Event;
import java.beans.EventHandler;
import javax.validation.Valid;
import ohtu.radioaine.domain.Batch;
import ohtu.radioaine.domain.Eluate;
import ohtu.radioaine.domain.EluateFormObject;
import ohtu.radioaine.service.BatchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import ohtu.radioaine.service.EluateService;
import ohtu.radioaine.service.EventService;
import ohtu.radioaine.tools.Time;
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
    @Autowired
    private BatchService batchService;
    @Autowired
    private EventService eventService;

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
            Eluate = updateEluateSaato(temp.getId(), efo);
        }
        return "redirect:/Eluate/" + Eluate.getId();
    }
    
    /**
     *
     * @param efo
     * @return
     */
    private Eluate createEluate(EluateFormObject efo) {
        Eluate eluate = new Eluate();
        
        eluate.setStrength(efo.getStrength());
        eluate.setVolume(efo.getVolume());
        eluate.setTimestamp(Time.parseDate(efo.getTimestamp()));
        eluate.setSignature(efo.getSignature());
        eluate.setNote(efo.getNote());
        eluate.setStorageLocation(efo.getStorageLocation());
        
        Batch generator = (Batch) batchService.read(efo.getGenerator().getId());
        Batch solvent = (Batch) batchService.read(efo.getSolvent().getId());
        eluate.setGenerator(generator);
        eluate.setSolvent(solvent);
        
        eluateService.createOrUpdate(eluate);

        return eluate;
    }

}
