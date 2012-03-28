/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ohtu.radioaine.service;

import java.util.List;
import ohtu.radioaine.database.StorageDBDao;
import ohtu.radioaine.domain.Storage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Jarno
 */
@Service
public class SimpleStorageService implements StorageService {
    @Autowired
    private StorageDBDao storageDao;
    
    @Override
    @Transactional
    public Storage createOrUpdate(Storage storage) {
        return storageDao.createOrUpdate(storage);
    }

    @Override
    @Transactional(readOnly = true)
    public List<Storage> list() {
        return storageDao.list();
    }

    @Override
    @Transactional(readOnly = true)
    public Storage read(int id) {
        return storageDao.read(id);
    }

    @Override
    @Transactional
    public void delete(int storageId) {
        Storage e = storageDao.read(storageId);
        if (e != null) {
            storageDao.delete(e);
        }
    }
    
    public List<String> storageNamesList()  {
        return storageDao.storageNamesList();
    }
    
}
