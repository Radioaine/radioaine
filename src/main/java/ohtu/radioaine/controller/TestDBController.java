package ohtu.radioaine.controller;

import ohtu.radioaine.domain.Batch;
import ohtu.radioaine.domain.Event;
import ohtu.radioaine.domain.Substance;
import ohtu.radioaine.service.BatchService;
import ohtu.radioaine.service.EventService;
import ohtu.radioaine.service.SubstanceService;
import ohtu.radioaine.tools.EventHandler;
import ohtu.radioaine.tools.Time;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * Creates a test database
 *
 * @author Radioaine
 *
 */
@Controller
public class TestDBController {

    @Autowired
    private SubstanceService substanceService;
    @Autowired
    private BatchService batchService;
    @Autowired
    private EventService eventService;
    private String[][] substances = {{"Angiocis 20.12mg 5 inj.plo", "10", "12", "true", "false", "Lääkefirma Jamppa", "Magnum Medical Finland Oy", "0"},
        {"Bridatec kittipakkaus 5 inj.plo", "3", "4", "false", "true", "Lääkefirma Perttilä", "Oy GE Healthcare Bio-Sciences Ab", "0"},
        {"Ceretec Exametazine Agent kittipakkaus 5 inj.plo", "3", "4", "false", "true", "Lääkefirma Perttilä", "Oy GE Healthcare Bio-Sciences Ab", "0"},
        {"Geneerinen generaattori", "3", "4", "true", "false", "Lääkefirma Perttilä", "Oy GE Healthcare Bio-Sciences Ab", "1"},
        {"Suolaliuos plo", "3", "4", "true", "false", "Lääkefirma Perttilä", "Oy GE Healthcare Bio-Sciences Ab", "2"}};
    private String[][] batches = {{"123445EE", "8", "30", "0", "Jeejeee paljon huomautettavaa", "12.2.2012 08:35"},
        {"99AADD22", "3", "10", "1", "puolet rikki", "13.2.2012 10:35"}, {"AAD175", "3", "10", "2", "1 lainassa", "13.6.2012 11:55"},
        {"AAD175", "3", "10", "2", "1 lainassa", "13.6.2012 12:45"}, {"AAD175", "3", "10", "2", "1 lainassa", "13.6.2012 09:23"}};

    @RequestMapping("generateTestDB")
    public String createDB() {
        createSubstances();
        createBatches();
        return "redirect:/storage";
    }

    private void createSubstances() {
        for (int i = 0; i < substances.length; i++) {
            Substance substance = new Substance();
            substance.setName(substances[i][0]);
            substance.setAlertLimit1(Integer.parseInt(substances[i][1]));
            substance.setAlertLimit2(Integer.parseInt(substances[i][2]));
            substance.setHasBeenOrdered(Boolean.parseBoolean(substances[i][3]));
            substance.setNeedsColdStorage(Boolean.parseBoolean(substances[i][4]));
            substance.setManufacturer(substances[i][5]);
            substance.setSupplier(substances[i][6]);
            substance.setType(Integer.parseInt(substances[i][7]));
            substanceService.createOrUpdate(substance);
        }
    }

    private void createBatches() {
        for (int i = 0; i < batches.length; i++) {
            Batch batch = new Batch();
            batch.setBatchNumber(batches[i][0]);

            batch.setAmount(Integer.parseInt(batches[i][1]));
            int[][] storageLocations = new int[10][2];
            storageLocations[0][0] = 1;
            storageLocations[0][1] = Integer.parseInt(batches[i][1]);
            batch.setStorageLocations(storageLocations);

            batch.setExpDate(Time.parseTimeStamp(batches[i][5]));

            batch.setSubstanceVolume(Integer.parseInt(batches[i][2]));
            batch.setQualityCheck(Integer.parseInt(batches[i][3]));
            batch.setNote(batches[i][4]);
            Substance substance = (Substance) substanceService.read(i + 1);
            substance.setTotalAmount(substance.getTotalAmount() + batch.getAmount());
            substanceService.createOrUpdate(substance);

            batch.setSubstance(substance);
            batch.setManufacturer(substance.getManufacturer());
            batch.setSupplier(substance.getSupplier());
            batch.setSignature("testi db");
            batch = batchService.createOrUpdate(batch);

            Event event = EventHandler.newBatchEvent(batch);
            eventService.createOrUpdate(event);
        }
    }
}
