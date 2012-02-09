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

    @RequestMapping("addBatch")
    public String addBatch() {
        return "addBatchView";
    }

    @RequestMapping("batch")
    public String batchView() {
        return "batchView";
    }
    
    @RequestMapping(value = "batch/{id}", method = RequestMethod.GET)
    public String getBatchById(@PathVariable Integer id, Model model) {
        model.addAttribute("batch", esinePalvelu.lue(id));
        
        return "batchView";
    }
    
    @RequestMapping("batchList")
    public String list(Model model) {
        model.addAttribute("batches", esinePalvelu.listaa());
        
        return "batchView";
    }
    
    @RequestMapping(value = "add", method = RequestMethod.POST)
    public String add(@ModelAttribute Batch batch) {
        batch = esinePalvelu.lisaa(batch);
        
        return "redirect:/batch/"+batch.getId();
        //return "redirect:/batchList";
    }
    
    
}
