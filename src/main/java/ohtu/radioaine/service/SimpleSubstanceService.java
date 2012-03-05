package ohtu.radioaine.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ohtu.radioaine.database.SubstanceDBDao;
import ohtu.radioaine.domain.Substance;

/**
 * Implementation for Substance service methods.
 * @author rmjheino
 */
@Service
public class SimpleSubstanceService implements SubstanceService<Substance> {

    @Autowired
    private SubstanceDBDao storageDao;

    @Override
    @Transactional
    public Substance createOrUpdate(Substance substance) {
        return storageDao.createOrUpdate(substance  );
    }

    @Override
    @Transactional(readOnly = true)
    public List<Substance> list() {
        return storageDao.list();
    }

    @Override
    @Transactional
    public void delete(int esineId) {
        Substance e = storageDao.read(esineId);
        if (e != null) {
            storageDao.delete(e);
        }
    }
    
    @Override
    @Transactional(readOnly = true)
    public Substance read(int id) {
        return storageDao.read(id);
    }
    
//    @Override
//    @Transactional(readOnly = true)
//    public List<Substance> listSpecificType(String type) {
//        return storageDao.listSpecificType(type);
//    }
}
