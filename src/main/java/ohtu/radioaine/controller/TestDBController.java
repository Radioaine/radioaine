package ohtu.radioaine.controller;

import java.util.Random;
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
    private String[][] substances = {
        // Kitit
        {"Angiocis 20.12mg", "10", "12", "true", "false", "Lääkefirma Jamppa", "Magnum Medical Finland Oy", "0"},
        {"Bridatec", "3", "4", "false", "true", "Lääkefirma Perttilä", "Oy GE Healthcare Bio-Sciences Ab", "0"},
        {"Ceretec Exametazine Agent", "3", "4", "false", "true", "Lääkefirma Perttilä", "Oy GE Healthcare Bio-Sciences Ab", "0"},
        {"Ceretec Stabilised", "3", "4", "true", "false", "Lääkefirma Perttilä", "Oy GE Healthcare Bio-Sciences Ab", "0"},
        {"Myoview", "10", "12", "true", "false", "Lääkefirma Jamppa", "Magnum Medical Finland Oy", "0"},
        {"Nanocoll", "3", "4", "false", "true", "Lääkefirma Perttilä", "Oy GE Healthcare Bio-Sciences Ab", "0"},
        {"Nephromag 0.2mg", "3", "4", "false", "true", "Lääkefirma Perttilä", "Oy GE Healthcare Bio-Sciences Ab", "0"},
        {"Octreoscan (In-111)", "3", "4", "true", "false", "Lääkefirma Perttilä", "Oy GE Healthcare Bio-Sciences Ab", "0"},
        {"Pentacis", "10", "12", "true", "false", "Lääkefirma Jamppa", "Magnum Medical Finland Oy", "0"},
        {"Technescan DMSA", "3", "4", "false", "true", "Lääkefirma Perttilä", "Oy GE Healthcare Bio-Sciences Ab", "0"},
        {"Technescan Sestamibi", "3", "4", "false", "true", "Lääkefirma Perttilä", "Oy GE Healthcare Bio-Sciences Ab", "0"},
        {"Technescan LyoMAA", "3", "4", "true", "false", "Lääkefirma Perttilä", "Oy GE Healthcare Bio-Sciences Ab", "0"},
        //Generaattorit
        {"Teknetiumgeneraattori 21,5 GBq (581 mCi) Ultra Technekow FM", "10", "12", "true", "false", "Lääkefirma Jamppa", "Magnum Medical Finland Oy", "1"},
        {"Teknetiumgeneraattori 24 GBq (649mCi)", "3", "4", "false", "true", "Lääkefirma Perttilä", "Oy GE Healthcare Bio-Sciences Ab", "1"},
        {"Teknetiumgeneraattori 30 GBq (811mCi)", "3", "4", "false", "true", "Lääkefirma Perttilä", "Oy GE Healthcare Bio-Sciences Ab", "1"},
        //Muut
        {"NaCl 30 ml", "3", "4", "true", "false", "Lääkefirma Perttilä", "Oy GE Healthcare Bio-Sciences Ab", "2"},
        {"NaCl 1000 ml", "3", "4", "true", "false", "Lääkefirma Perttilä", "Oy GE Healthcare Bio-Sciences Ab", "2"}};
    private String[][] batches = {
        {"123445EE", "8", "30", "0", "Paljon huomautettavaa", "12.2.2012 08:35"},
        {"99AADD22", "3", "10", "1", "puolet rikki", "13.2.2012 10:35"},
        {"AAD453343175", "3", "10", "2", "1 lainassa", "13.6.2012 11:55"},
        {"AAt43tD435175", "3", "10", "2", "1 lainassa", "13.6.2012 12:45"},
        {"assfaAAD175", "3", "10", "2", "1 lainassa", "13.6.2012 09:23"},
        {"asdas123445EE", "8", "30", "0", "Jeejeee paljon huomautettavaa", "12.2.2012 08:35"},
        {"9fds9AADD22", "3", "10", "1", "puolet rikki", "13.2.2012 10:35"},
        {"fds54gAAD175", "3", "10", "2", "1 lainassa", "13.6.2012 11:55"},
        {"##f3AAD175", "3", "10", "2", "1 lainassa", "13.6.2012 12:45"},
        {"434AAD175", "3", "10", "2", "1 lainassa", "13.6.2012 09:23"},
        {"123445EE", "8", "30", "0", "Jeejeee paljon huomautettavaa", "12.2.2012 08:35"},
        {"547u399AADD22", "3", "10", "1", "puolet rikki", "13.2.2012 10:35"},
        {"9678AAD175", "3", "10", "2", "1 lainassa", "13.6.2012 11:55"},
        {"+09+09AAD175", "3", "10", "2", "1 lainassa", "13.6.2012 12:45"},
        {"´+0AAD175", "3", "10", "2", "1 lainassa", "13.6.2012 09:23"},
        {"äsd123445EE", "8", "30", "0", "Jeejeee paljon huomautettavaa", "12.2.2012 08:35"},
        // {"hgfj799AADD22", "3", "10", "1", "puolet rikki", "13.2.2012 10:35"},
        {"FSHAAD175", "3", "10", "2", "1 lainassa", "13.6.2012 11:55"}};

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
            Event event = EventHandler.newSubstanceEvent(substance, "test db");
            eventService.createOrUpdate(event);
        }
    }

    private void createBatches() {
        for (int j = 0; j < 3; ++j) {
            for (int i = 0; i < batches.length; i++) {
                Random generator = new Random();
                int randomNumber = generator.nextInt(batches.length + 1);

                if (randomNumber >= batches.length) {
                    continue;
                }

                Batch batch = new Batch();
                batch.setBatchNumber(batches[randomNumber][0]);

                batch.setAmount(Integer.parseInt(batches[randomNumber][1]));
                int[][] storageLocations = new int[10][2];
                storageLocations[0][0] = 1;
                storageLocations[0][1] = Integer.parseInt(batches[randomNumber][1]);
                batch.setStorageLocations(storageLocations);

                batch.setExpDate(Time.parseTimeStamp(batches[randomNumber][5]));

                batch.setSubstanceVolume(Integer.parseInt(batches[randomNumber][2]));
                batch.setQualityCheck(Integer.parseInt(batches[randomNumber][3]));
                batch.setNote(batches[randomNumber][4]);

                Substance substance = (Substance) substanceService.read(i + 1);
                substance.setTotalAmount(substance.getTotalAmount() + batch.getAmount());
                substanceService.createOrUpdate(substance);

                batch.setSubstance(substance);
                batch.setManufacturer(substance.getManufacturer());
                batch.setSupplier(substance.getSupplier());
                batch.setSignature("testi db");
                batch = batchService.createOrUpdate(batch);

                Event event = EventHandler.newBatchEvent(batch, "test db");
                eventService.createOrUpdate(event);
            }
        }
    }
}
