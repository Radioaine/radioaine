package ohtu.radioaine.service;

import java.util.List;
import javax.persistence.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ohtu.radioaine.database.BatchDBDao;
import ohtu.radioaine.domain.Batch;

/**
 * Implementation for Batch service methods.
 * @author rmjheino
 */
@Service
public class SimpleBatchService implements BatchService {

    @Autowired
    private BatchDBDao varastoDao;

    @Override
    @Transactional
    public Batch createOrUpdate(Batch esine) {
        return varastoDao.createOrUpdate(esine);
    }

    @Override
    @Transactional(readOnly = true)
    public List<Batch> list() {
        return varastoDao.list();
    }
    
    @Override
    @Transactional(readOnly = true)
    public Batch read(int id) {
        return varastoDao.read(id);
    }

    @Override
    @Transactional
    public void delete(int esineId) {
        Batch e = varastoDao.read(esineId);
        if (e != null) {
            varastoDao.delete(e);
        }
    }
    
    @Override
    @Transactional(readOnly = true)
    public List<Batch> listSubstanceBatches(int id) {
        return varastoDao.listSubstanceBatches(id);
    }
}
