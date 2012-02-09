package ohtu.radioaine.service;

import java.util.List;

public interface SubstanceService<Substance> {
    public Substance lisaa(Substance esine);
    public List<Substance> listaa();
    public void poista(int esineId);
}
