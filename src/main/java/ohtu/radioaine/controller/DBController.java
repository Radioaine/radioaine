package ohtu.radioaine.controller;

import ohtu.radioaine.domain.Substance;
import ohtu.radioaine.service.BatchService;
import ohtu.radioaine.service.SubstanceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author Jarno
 */
@Controller
public class DBController {
    
    @Autowired
    private SubstanceService substanceService;
    @Autowired
    private BatchService batchService;
    
    private String[][] substances =   {{"Angiocis 20.12mg 5 inj.plo", "10", "12", "true", "false", "Lääkefirma Jamppa", "Magnum Medical Finland Oy", "5"}, 
                                {"Bridatec kittipakkaus 5 inj.plo", "3", "4", "false", "true", "Lääkefirma Perttilä", "Oy GE Healthcare Bio-Sciences Ab", "5"},
                                {"Ceretec Exametazine Agent kittipakkaus 5 inj.plo", "3", "4", "false", "true", "Lääkefirma Perttilä", "Oy GE Healthcare Bio-Sciences Ab", "10"},
                                {"Ceretec Stabilised kittipakkaus 5 inj.plo", "3", "4", "true", "false", "Lääkefirma Perttilä", "Oy GE Healthcare Bio-Sciences Ab", "18"},
                                {"Myoview kittipakkaus 5 inj.plo", "3", "4",  "true", "true", "Lääkefirma Perttilä", "Oy GE Healthcare Bio-Sciences Ab", "1"}};
    
    @RequestMapping("generateDB")
    public String createDB()    {
        createSubstances();
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
            substance.setTotalAmount(Integer.parseInt(substances[i][7]));
            substanceService.lisaa(substance);
        }
    }
    
    private void createBatches()    {
        
    }
}
