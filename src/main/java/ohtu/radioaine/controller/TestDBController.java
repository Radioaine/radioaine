package ohtu.radioaine.controller;

import java.util.Random;
import ohtu.radioaine.domain.Batch;
import ohtu.radioaine.domain.Event;
import ohtu.radioaine.domain.Storage;
import ohtu.radioaine.domain.Substance;
import ohtu.radioaine.service.BatchService;
import ohtu.radioaine.service.EventService;
import ohtu.radioaine.service.StorageService;
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
    @Autowired
    private StorageService storageService;
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
        {"123445EE", "8", "30", "0", "Paljon huomautettavaa", "12.2.2010 08:35"},
        {"99AADD22", "3", "10", "1", "puolet rikki", "03.4.2012 10:35"},
        {"AAD453343175", "3", "10", "2", "1 lainassa", "13.4.2012 11:15"},
        {"AAt43tD435175", "3", "10", "2", "1 lainassa", "13.5.2012 12:25"},
        {"assfaAAD175", "3", "10", "2", "1 lainassa", "13.8.2012 09:23"},
        {"asdas123445EE", "8", "30", "0", "Jeejeee paljon huomautettavaa", "12.2.2012 08:35"},
        {"9fds9AADD22", "3", "10", "1", "puolet rikki", "13.2.2012 10:35"},
        {"fds54gAAD175", "3", "10", "2", "1 lainassa", "11.6.2012 11:51"},
        {"##f3AAD175", "3", "10", "2", "1 lainassa", "13.6.2012 12:45"},
        {"434AAD175", "3", "10", "2", "1 lainassa", "14.6.2012 09:23"},
        {"123445EE", "8", "30", "0", "Jeejeee paljon huomautettavaa", "12.2.2012 08:35"},
        {"547u399AADD22", "3", "10", "1", "puolet rikki", "13.2.2012 10:35"},
        {"9678AAD175", "3", "10", "2", "1 lainassa", "13.7.2012 11:53"},
        {"+09+09AAD175", "3", "10", "2", "1 lainassa", "13.4.2012 11:52"},
        {"´+0AAD175", "3", "10", "2", "1 lainassa", "14.6.2012 09:23"},
        {"äsd123445EE", "8", "30", "0", "Jeejeee paljon huomautettavaa", "12.4.2012 08:35"},
        // {"hgfj799AADD22", "3", "10", "1", "puolet rikki", "13.2.2012 10:35"},
        {"FSHAAD175", "3", "10", "2", "1 lainassa", "13.6.2013 11:55"}};
    
    private String[] storages = {"Alakerran kaappi", "Yläkerran kaappi", "Varastokaappi", "Hoitajien kaappi"};

    @RequestMapping("generateTestDB")
    public String createDB() {
        createStorages();
        createSubstances();
        createBatches();
        
        return "redirect:/storage";
    }
    
    private void createStorages()   {
        for (int i = 0; i < storages.length; i++) {
            Storage storage = new Storage();
            storage.setName(storages[i]);
            storage.setHidden(false);
            storage.setInUse(false);
            storageService.createOrUpdate(storage);
//            Event event = EventHandler.newStorageEvent(storage, "test db");
//            eventService.createOrUpdate(event);
        }
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
            substance.setOldestDate(Time.parseTimeStamp("13.6.2050 10:00"));
            Random randomGenerator = new Random();
            int randomInt = randomGenerator.nextInt(3);
            substance.setQualityStatus(randomInt);
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
                Storage storage = storageService.read(1);
                storage.setInUse(true);
                storageService.createOrUpdate(storage);
                batch.setStorageLocations(storageLocations);
                batch.setArrivalDate(Time.parseTimeStamp(batches[randomNumber][5]));
                batch.setExpDate(Time.parseTimeStamp("10.2.2012 00:00"));
                batch.setSubstanceVolume(Integer.parseInt(batches[randomNumber][2]));
                batch.setQualityCheck(Integer.parseInt(batches[randomNumber][3]));
                batch.setNote(batches[randomNumber][4]);

                Substance substance = (Substance) substanceService.read(i + 1);
                if(substance.getOldestDate().compareTo(batch.getExpDate()) > 0){
                    substance.setOldestDate(batch.getExpDate());
                    substance.setWarningDate(Time.parseWarningDate(batch.getExpDate()));
                }
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
