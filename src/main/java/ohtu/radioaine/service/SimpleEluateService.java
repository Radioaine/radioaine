/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ohtu.radioaine.service;

import java.util.List;
import ohtu.radioaine.database.BatchDBDao;
import ohtu.radioaine.database.EluateDBDao;
import ohtu.radioaine.domain.Eluate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author rmjheino
 */
@Service
public class SimpleEluateService implements EluateService {

    @Autowired
    private EluateDBDao storageDao;

    @Override
    @Transactional
    public Eluate createOrUpdate(Eluate eluate) {
        return storageDao.createOrUpdate(eluate);
    }

    @Override
    @Transactional
    public List<Eluate> list() {
        return storageDao.list();
    }

    @Override
    @Transactional
    public Eluate read(int id) {
        return storageDao.read(id);
    }

    @Override
    @Transactional
    public void delete(int id) {
        Eluate e = storageDao.read(id);
        if (e != null) {
            storageDao.delete(e);
        }
    }
}
