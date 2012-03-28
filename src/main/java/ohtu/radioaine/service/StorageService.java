/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ohtu.radioaine.service;

import java.util.List;
import ohtu.radioaine.domain.Storage;

/**
 *
 * @author Jarno
 */
public interface StorageService {
    
    public Storage createOrUpdate(Storage storage);

    public List<Storage> list();

    public Storage read(int id);

    public void delete(int id);
    
    public List<String> storageNamesList();

}
