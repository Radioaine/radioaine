package ohtu.radioaine.controller;

import java.util.ArrayList;
import java.util.List;
import javax.validation.Valid;
import ohtu.radioaine.domain.Batch;
import ohtu.radioaine.domain.Eluate;
import ohtu.radioaine.domain.EluateFormObject;
import ohtu.radioaine.domain.Substance;
import ohtu.radioaine.service.BatchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import ohtu.radioaine.service.EluateService;
import ohtu.radioaine.service.EventService;
import ohtu.radioaine.service.SubstanceService;
import ohtu.radioaine.tools.Time;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Controllers for eluate creation ja viewing
 *
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
    @Autowired
    private SubstanceService substanceService;
    int GENERATOR = 1;
    int KIT = 0;
    int SOLVENT = 2;

    @RequestMapping(value = "createEluate", method = RequestMethod.GET)
    public String createEluate(Model model) {
        model.addAttribute("eluate", new EluateFormObject());
        model.addAttribute("generators", getSpecificTypesFromSubstances(substanceService.list(), GENERATOR));
        List<Batch> batches = batchService.list();
        model.addAttribute("kits", getSpecificTypesFromBatches(batches, KIT));
        model.addAttribute("solvents", getSpecificTypesFromBatches(batches, SOLVENT));
        return "createEluate";
    }

    private List<Substance> getSpecificTypesFromSubstances(List<Substance> substances, int type) {
        List<Substance> typeList = new ArrayList<Substance>();
        for (Substance substance : substances) {
            if (substance.getType() == type) {
                typeList.add(substance);
            }
        }
        return typeList;
    }

    private List<Batch> getSpecificTypesFromBatches(List<Batch> batches, int type) {
        List<Batch> typeList = new ArrayList<Batch>();
        for (Batch batch : batches) {
            if (batch.getSubstance().getType() == type) {
                typeList.add(batch);
            }
        }
        return typeList;
    }

    @RequestMapping(value = "createEluate", method = RequestMethod.POST)
    public String newEluate(@Valid @ModelAttribute("eluate") EluateFormObject efo, BindingResult result) {
        if (result.hasErrors()) {
            return "createEluate";
        }
        Eluate newEluate = eluateService.createOrUpdate(createEluate(efo));
        return "redirect:/frontpage";
    }
    
    @RequestMapping("Eluate/{id}")
    public String eluateView(@PathVariable Integer id) {
        return "frontpage";
    }

    /**
     *
     * @param efo
     * @return
     */
    private Eluate createEluate(EluateFormObject efo) {
        Eluate eluate = new Eluate();
        System.out.println(efo.getStrength());
        eluate.setStrength(efo.getStrength());
        eluate.setVolume(efo.getVolume());
        eluate.setTimestamp(Time.parseDate(efo.getDate()));
        eluate.setSignature(efo.getSignature());
        eluate.setNote(efo.getNote());
        eluate.setStorageLocation(efo.getStorageLocation());

        List<Substance> generators = new ArrayList<Substance>();
        generators.add((Substance) substanceService.read(efo.getGenerators()));
        List<Batch> kits = new ArrayList<Batch>();
        kits.add(batchService.read(efo.getKits()));
        List<Batch> solvents = new ArrayList<Batch>();
        solvents.add(batchService.read(efo.getSolvents()));


//        for (Batch generator : efo.getGenerators()) {
//            generators.add((Batch) batchService.read(generator.getId()));
//        }
//        for (Batch solvent : efo.getSolvents()) {
//            generators.add((Batch) batchService.read(solvent.getId()));
//        }

        eluate.setGenerators(generators);
        eluate.setSolvents(solvents);
        eluate.setKits(kits);
        return eluate;
    }
}
