package ohtu.radioaine.domain;

import java.io.Serializable;
import javax.persistence.*;

@Entity
public class Product implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.TABLE)
    @Column(nullable=false)
    private int id;
    @Column(nullable=false)
    private String name;
    private int alertLimit1;
    private int alertLimit2;
    private boolean hasBeenOrdered;
    private boolean needsColdStorage;

    public Product() {
    }

    public int getId() {
        return id;
    }

    public int getAlertLimit1() {
        return alertLimit1;
    }

    public void setAlertLimit1(int alertLimit1) {
        this.alertLimit1 = alertLimit1;
    }

    public int getAlertLimit2() {
        return alertLimit2;
    }

    public void setAlertLimit2(int alertLimit2) {
        this.alertLimit2 = alertLimit2;
    }

    public boolean isHasBeenOrdered() {
        return hasBeenOrdered;
    }

    public void setHasBeenOrdered(boolean hasBeenOrdered) {
        this.hasBeenOrdered = hasBeenOrdered;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public boolean isNeedsColdStorage() {
        return needsColdStorage;
    }

    public void setNeedsColdStorage(boolean needsColdStorage) {
        this.needsColdStorage = needsColdStorage;
    }
}
