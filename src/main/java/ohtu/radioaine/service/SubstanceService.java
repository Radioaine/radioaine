package ohtu.radioaine.service;

import java.util.List;
import ohtu.radioaine.domain.Substance;

public interface SubstanceService {
    public void lisaa(Substance esine);
    public List<Substance> listaa();
    public void poista(int esineId);
}
