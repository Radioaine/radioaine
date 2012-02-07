package ohtu.radioaine.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import ohtu.radioaine.service.SubstanceService;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BatchController {

    @Autowired
    private SubstanceService esinePalvelu;

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
    
    
}
