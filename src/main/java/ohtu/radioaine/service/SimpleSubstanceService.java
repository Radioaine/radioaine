package ohtu.radioaine.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ohtu.radioaine.database.SubstanceDBDao;
import ohtu.radioaine.domain.Substance;

@Service
public class SimpleSubstanceService implements SubstanceService {

    @Autowired
    private SubstanceDBDao varastoDao;

    @Override
    @Transactional
    public void lisaa(Substance esine) {
        varastoDao.create(esine);
    }

    @Override
    @Transactional(readOnly = true)
    public List<Substance> listaa() {
        return varastoDao.list();
    }

    @Override
    @Transactional
    public void poista(int esineId) {
        Substance e = varastoDao.read(esineId);
        if (e != null) {
            varastoDao.delete(e);
        }
    }
}
