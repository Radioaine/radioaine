package ohtu.radioaine.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ohtu.radioaine.database.BatchDBDao;
import ohtu.radioaine.domain.Batch;

@Service
public class SimpleBatchService implements BatchService {

    @Autowired
    private BatchDBDao varastoDao;

    @Override
    @Transactional
    public Batch lisaa(Batch esine) {
        return varastoDao.create(esine);
    }

    @Override
    @Transactional(readOnly = true)
    public List<Batch> listaa() {
        return varastoDao.list();
    }
    
    @Override
    @Transactional(readOnly = true)
    public Batch lue(int id) {
        return varastoDao.read(id);
    }

    @Override
    @Transactional
    public void poista(int esineId) {
        Batch e = varastoDao.read(esineId);
        if (e != null) {
            varastoDao.delete(e);
        }
    }
}
