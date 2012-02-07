package ohtu.radioaine.domain;

import java.util.List;
import javax.persistence.*;

@Entity
public class Eluate extends Product {

    @Id
    @GeneratedValue(strategy = GenerationType.TABLE)
    @Column(nullable = false)
    private Long id;
    @Column
    private double strength;
    @Column
    private List<StorageItem> itemUsed;

    public long getId() {
        return id;
    }
    
    public void setId(Long id) {
        this.id = id;
    }

    public double getStrength() {
        return strength;
    }

    public void setStrength(double strength) {
        this.strength = strength;
    }

    public List<StorageItem> getItemUsed() {
        return itemUsed;
    }

    public void setItemUsed(StorageItem itemUsed) {
        this.itemUsed.add(itemUsed);
    }
}
