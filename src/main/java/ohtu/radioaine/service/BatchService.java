package ohtu.radioaine.service;

import java.util.List;
import ohtu.radioaine.domain.Batch;

public interface BatchService {
    public void lisaa(Batch esine);
    public List<Batch> listaa();
    public void poista(int esineId);
}
