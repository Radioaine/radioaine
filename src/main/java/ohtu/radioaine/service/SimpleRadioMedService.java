/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ohtu.radioaine.service;

import java.sql.Timestamp;
import java.util.List;
import ohtu.radioaine.database.RadioMedDBDao;
import ohtu.radioaine.domain.RadioMedicine;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Richard Moneybags
 */
@Service
public class SimpleRadioMedService implements RadioMedService {
    
    @Autowired
    private RadioMedDBDao storageDao;
    
    @Override
    @Transactional
    public RadioMedicine createOrUpdate(RadioMedicine radioMedicine) {
        return storageDao.createOrUpdate(radioMedicine);
    }

    @Override
    @Transactional
    public List<RadioMedicine> list() {
        return storageDao.list();
    }

    @Override
    @Transactional
    public RadioMedicine read(Long id) {
        return storageDao.read(id);
    }

    @Override
    @Transactional
    public void delete(Long id) {
        RadioMedicine e = storageDao.read(id);
        if (e != null) {
            storageDao.delete(e);
        }
    }

    @Override
    public List<RadioMedicine> list(Timestamp startDate, Timestamp endDate) {
        return storageDao.list(startDate, endDate);
    }
}
