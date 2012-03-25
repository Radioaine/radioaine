/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ohtu.radioaine.database;

import java.util.List;
import ohtu.radioaine.domain.Storage;

/**
 *
 * @author Jarno
 */
public interface StorageDBDao extends DAO<Storage> {
    public List<Storage> list();

    public List<Storage> listByStorageType(int type);
}
