package ohtu.radioaine.controller;

import java.util.ArrayList;
import java.util.List;
import ohtu.radioaine.domain.Batch;
import ohtu.radioaine.domain.Substance;
import ohtu.radioaine.service.BatchService;
import ohtu.radioaine.service.SubstanceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * Creates a test database
 * @author Radioaine
 * 
 */
@Controller
public class TestDBController {
    
    @Autowired
    private SubstanceService substanceService;
    @Autowired
    private BatchService batchService;
    
    private String[][] substances =   {{"Angiocis 20.12mg 5 inj.plo", "10", "12", "true", "false", "Lääkefirma Jamppa", "Magnum Medical Finland Oy", "5"}, 
                                {"Bridatec kittipakkaus 5 inj.plo", "3", "4", "false", "true", "Lääkefirma Perttilä", "Oy GE Healthcare Bio-Sciences Ab", "5"},
                                {"Ceretec Exametazine Agent kittipakkaus 5 inj.plo", "3", "4", "false", "true", "Lääkefirma Perttilä", "Oy GE Healthcare Bio-Sciences Ab", "10"},
                                {"Ceretec Stabilised kittipakkaus 5 inj.plo", "3", "4", "true", "false", "Lääkefirma Perttilä", "Oy GE Healthcare Bio-Sciences Ab", "18"},
                                {"Myoview kittipakkaus 5 inj.plo", "3", "4",  "true", "true", "Lääkefirma Perttilä", "Oy GE Healthcare Bio-Sciences Ab", "1"}};
    
    private String[][] batches = {{"123445EE", "8", "true", "Jeejeee paljon huomautettavaa"},
                                    {"99AADD22", "3", "false","puolet rikki"}};
    
    @RequestMapping("generateTestDB")
    public String createDB()    {
        createSubstances();
        createBatches();
        return "redirect:/frontpage";
    }
    
    private void createSubstances() {
        for(int i=0; i < substances.length; i++) {
            Substance substance = new Substance();
            substance.setName(substances[i][0]);
            substance.setAlertLimit1(Integer.parseInt(substances[i][1]));
            substance.setAlertLimit2(Integer.parseInt(substances[i][2]));
            substance.setHasBeenOrdered(Boolean.parseBoolean(substances[i][3]));
            substance.setNeedsColdStorage(Boolean.parseBoolean(substances[i][4]));
            substance.setManufacturer(substances[i][5]);
            substance.setSupplier(substances[i][6]);
            substanceService.createOrUpdate(substance);
        }
    }
    
    private void createBatches()    {
        for(int i=0; i < batches.length; i++) {
            Batch batch = new Batch();
            batch.setBatchNumber(batches[i][0]);
            batch.setAmount(Integer.parseInt(batches[i][1]));
            batch.setQualityCheck(Boolean.parseBoolean(batches[i][2]));
            batch.setNote(batches[i][3]);
            Substance substance = (Substance) substanceService.read(1);
            substance.setTotalAmount(substance.getTotalAmount() + batch.getAmount());
            substanceService.createOrUpdate(substance);
            batch.setSubstance(substance);
            batchService.createOrUpdate(batch);
        }
    }
}
