/*
 * Contains following controllers for batch page:
 *  - batch/{id}: fetches batch by id from db, gives it in model to view 'batchView'
 *  - batch: fetches all batches from db, gives them in model to view 'batch' 
 *  - addBatch: 
 */

/**
 * 
 */

package ohtu.radioaine.controller;

import javax.validation.Valid;
import ohtu.radioaine.domain.Batch;
import ohtu.radioaine.domain.BatchFormObject;
import ohtu.radioaine.domain.Substance;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import ohtu.radioaine.service.BatchService;
import ohtu.radioaine.service.SubstanceService;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMethod;
import ohtu.radioaine.tools.Time;
import org.springframework.web.bind.annotation.*;

/**
 * Controllers for batch creation and viewing
 * @author rmjheino
 */
@Controller
public class BatchController {

    @Autowired
    private BatchService batchService;
    @Autowired
    private SubstanceService substanceService;

    @RequestMapping(value = "batch/{id}", method = RequestMethod.GET)
    public String getBatchById(@PathVariable Integer id, Model model) {
        model.addAttribute("batch", batchService.read(id));
        return "batchView";
    }

    @RequestMapping(value = "batch", method = RequestMethod.GET)
    public String batchList(Model model) {
        model.addAttribute("batches", batchService.list());
        return "batchView";
    }

    @RequestMapping(value = "addBatch", method = RequestMethod.GET)
    public String addbatchView(Model model) {
        model.addAttribute("batch", new BatchFormObject());
        model.addAttribute("substances", substanceService.list());
        return "addBatchView";
    }

    @RequestMapping(value = "batch", method = RequestMethod.POST)
    public String addBatch(@Valid @ModelAttribute("batch") BatchFormObject bfm, BindingResult result) {
        if (result.hasErrors()) {
            return "addBatchView";
        }
        Batch batch = batchService.createOrUpdate(createBatch(bfm));
        return "redirect:/batch/" + batch.getId();
    }
    
//    @RequestMapping(value = "batch/{id}", method = RequestMethod.DELETE)
//    public String deleteBatch(@RequestParam String name, @RequestParam Integer amount, @PathVariable Integer id) {
//        Batch batch = batchService.read(id);
//        
////        int total = batch.getAmount() - amount;
////        if(total >= 0) {
////            batch.setAmount(total);
//            batchService.delete(id);
////        }
//        return "redirect:/batch/" + id;
//    }


    /**
     * 
     * @param bfo 
     * @return 
     */
    private Batch createBatch(BatchFormObject bfo) {
        Batch batch = new Batch();
        batch.setBatchNumber(bfo.getBatchNumber());
        batch.setNote(bfo.getNote());
        batch.setArrivalDate(Time.getTimestamp());
        batch.setExpDate((Time.getTimestamp()));
        batch.setAmount(bfo.getAmount());

        Substance substance = (Substance) substanceService.read(bfo.getSubstance());
        //Substance substance = createTestSubstance(bfo); //luodaan testiaine testausta varten
        substance.setTotalAmount(substance.getTotalAmount()+bfo.getAmount());
        substanceService.createOrUpdate(substance);
        batch.setSubstance(substance);
        batch.setManufacturer(substance.getManufacturer());
        batch.setSupplier(substance.getSupplier());
        return batch;
    }

//    private Substance createTestSubstance(BatchFormObject bfm) {
//        Substance substance = new Substance("" + bfm.getSubstance());
//        substance.setName("LääkeaineX");
//        substance.setNeedsColdStorage(true);
//        substance.setAlertLimit1(5);
//        substance.setAlertLimit2(8);
//        substance.setHasBeenOrdered(false);
//        substance.setManufacturer("Pekan lääkefirma");
//        substance.setSupplier("Taavon tukkuliike");
//        return substance;
//    }
}
