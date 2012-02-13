package ohtu.radioaine.database;

/**
 * Generic Data Access Object methods
 * @author rmjheino
 * @param <T> 
 */
public interface DAO<T> {
    public T create(T instance);
    public T read(int id);
    public void delete(T instance);
    public T update(T instance);
}
