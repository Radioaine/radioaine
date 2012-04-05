package ohtu.radioaine.service;

import java.sql.Timestamp;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ohtu.radioaine.database.BatchDBDao;
import ohtu.radioaine.domain.Batch;

/**
 * Implementation for Batch service methods.
 *
 * @author rmjheino
 */
@Service
public class SimpleBatchService implements BatchService {

    @Autowired
    private BatchDBDao storageDao;

    @Override
    @Transactional
    public Batch createOrUpdate(Batch batch) {
        return storageDao.createOrUpdate(batch);
    }

    @Override
    @Transactional(readOnly = true)
    public List<Batch> list() {
        return storageDao.list();
    }

    @Override
    @Transactional(readOnly = true)
    public Batch read(int id) {
        return storageDao.read(id);
    }

    @Override
    @Transactional
    public void delete(int batchId) {
        Batch e = storageDao.read(batchId);
        if (e != null) {
            storageDao.delete(e);
        }
    }

    @Override
    @Transactional(readOnly = true)
    public List<Batch> listSubstanceBatches(int id) {
        return storageDao.listSubstanceBatches(id);
    }

    @Override
    @Transactional
    public Batch read(String batchNumber, int substance) {
        return storageDao.read(batchNumber, substance);
    }

    @Override
    public List<Batch> getBatchesByType(int type) {
        return storageDao.getBatchesByType(type);
    }

//    @Override
//    public List<Batch> getGeneratorBatches(int type) {
//        return storageDao.getBatchesByType(type);
//    }

    @Override
    public List<Batch> list(Timestamp start, Timestamp end) {
        return storageDao.list(start, end);
    }
}
