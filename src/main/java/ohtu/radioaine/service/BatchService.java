package ohtu.radioaine.service;

import java.util.List;
import ohtu.radioaine.domain.Batch;

public interface BatchService {
    public Batch lisaa(Batch esine);
    public List<Batch> listaa();
    public Batch lue(int id);
    public void poista(int esineId);
}
