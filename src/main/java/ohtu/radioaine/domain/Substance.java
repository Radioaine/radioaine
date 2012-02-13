 package ohtu.radioaine.domain;

import java.io.Serializable;
import java.sql.Timestamp;
import javax.persistence.*;

 /**
  * Entity for different substances in storage. Used to create table Substance
  * in DB.
  * @author rmjheino
  */
@Entity
public class Substance implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.TABLE)
    @Column(nullable=false)
    private int id;
    @Column(nullable=false)
    private String name;
    private int alertLimit1;
    private int alertLimit2;
    private boolean ordered;
    private boolean needsColdStorage;
    private String manufacturer;
    private String supplier;
    private int totalAmount;
    private Timestamp oldestDate;

    public Timestamp getOldestDate() {
        return oldestDate;
    }

    public void setOldestDate(Timestamp oldestDate) {
        this.oldestDate = oldestDate;
    }

    public int getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(int totalAmount) {
        this.totalAmount = totalAmount;
    }

    public String getSupplier() {
        return supplier;
    }

    public void setSupplier(String supplier) {
        this.supplier = supplier;
    }

    public String getManufacturer() {
        return manufacturer;
    }

    public void setManufacturer(String manufacturer) {
        this.manufacturer = manufacturer;
    }

    public boolean isOrdered() {
        return ordered;
    }

    public void setOrdered(boolean ordered) {
        this.ordered = ordered;
    }

    public Substance() {
    }
    
    public Substance(String name) {
        this.name = name;
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

    public boolean hasBeenOrdered() {
        return ordered;
    }

    public void setHasBeenOrdered(boolean hasBeenOrdered) {
        this.ordered = hasBeenOrdered;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public boolean needsColdStorage() {
        return needsColdStorage;
    }

    public void setNeedsColdStorage(boolean needsColdStorage) {
        this.needsColdStorage = needsColdStorage;
    }
    
    @Override
    public String toString() {
        return name;
    }
}
