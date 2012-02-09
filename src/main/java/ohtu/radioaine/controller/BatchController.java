package ohtu.radioaine.controller;

import ohtu.radioaine.domain.Batch;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import ohtu.radioaine.service.BatchService;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BatchController {

    @Autowired
    private BatchService esinePalvelu;

    @RequestMapping("add")
    public String addBatch() {
        return "addBatchView";
    }

    @RequestMapping("batch")
    public String batchView() {
        return "batchView";
    }
    
    @RequestMapping(value = "batch/batchId", method = RequestMethod.GET)
    public String getBatchById(@PathVariable Integer productId) {
        
        //getbatch(batchId);
        return "batchView";
    }
    @RequestMapping("batchList")
    public String listaa(Model model) {
        System.out.println("listaus");
        model.addAttribute("batches", esinePalvelu.listaa());
        return "batchView";
    }
    @RequestMapping(value = "lisaa", method = RequestMethod.POST)
    public String lisaa(@ModelAttribute Batch batch) {
        System.out.println("lisaus");
        esinePalvelu.lisaa(batch);
        System.out.println("Eränumero : " + batch.getStrength());
        return "redirect:/batchList";
    }
    
    
}
