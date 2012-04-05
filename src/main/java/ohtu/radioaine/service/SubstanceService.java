package ohtu.radioaine.service;

import java.util.List;

public interface SubstanceService<Substance> {
    public Substance createOrUpdate(Substance esine);
    public Substance read(Long id);
    public List<Substance> list();
    public void delete(Long esineId);
    public List<Substance> listSpecificType(String type);
}
