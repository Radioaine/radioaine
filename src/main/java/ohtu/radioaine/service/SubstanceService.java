package ohtu.radioaine.service;

import java.util.List;

public interface SubstanceService<Substance> {
    public Substance createOrUpdate(Substance esine);
    public Substance read(int id);
    public List<Substance> list();
    public void delete(int esineId);
}
