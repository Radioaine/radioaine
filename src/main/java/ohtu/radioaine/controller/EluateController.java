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
    int OTHER = 2;

    @RequestMapping(value = "createEluate", method = RequestMethod.GET)
    public String createEluate(Model model) {
        model.addAttribute("eluate", new EluateFormObject());
        model.addAttribute("generators", getSpecificTypesFromSubstances(substanceService.list(), GENERATOR));
//        List<Batch> batches = batchService.list();
//        model.addAttribute("kits", getSpecificTypesFromBatches(batches, KIT));
//        model.addAttribute("solvents", getSpecificTypesFromBatches(batches, OTHER));
        model.addAttribute("generators", batchService.getBatchesByType(GENERATOR));
        model.addAttribute("kits", batchService.getBatchesByType(KIT));
        model.addAttribute("others", batchService.getBatchesByType(OTHER));
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
        eluate.setTimestamp(Time.parseTimeStamp(efo.getDate() + " " + efo.getHours() + ":" + efo.getMinutes()));
        eluate.setSignature(efo.getSignature());
        eluate.setNote(efo.getNote());
        eluate.setStorageLocation(efo.getStorageLocation());

//        System.out.println("EFOIDT");
//        System.out.println(efo.getGenerators());
//        Batch generator = batchService.read(efo.getGenerators());
//        System.out.println(generator.getId());
//        System.out.println(efo.getOthers());
//        Batch otherss = batchService.read(efo.getOthers());
//        System.out.println(otherss.getId());
//        System.out.println(efo.getKits());
//        Batch kitsi = batchService.read(efo.getKits());
//        System.out.println(kitsi.getId());
        List<Batch> generators = new ArrayList<Batch>();
        generators.add(batchService.read(efo.getGenerators()));
        List<Batch> kits = new ArrayList<Batch>();
        kits.add(batchService.read(efo.getKits()));
        List<Batch> others = new ArrayList<Batch>();
        others.add(batchService.read(efo.getOthers()));


//        for (Batch generator : efo.getOthers()) {
//            generators.add((Batch) batchService.read(generator.getId()));
//        }
//        for (Batch solvent : efo.getOther()) {
//            generators.add((Batch) batchService.read(solvent.getId()));
//        }

        eluate.setGenerators(generators);
        eluate.setOthers(others);
        eluate.setKits(kits);
        return eluate;
    }
}
