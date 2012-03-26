package ohtu.radioaine.domain;

import java.io.Serializable;
import java.sql.Timestamp;
import javax.persistence.*;

/**
 * Entity for different substances in storage. Used to create table Substance in
 * DB.
 *
 * @author rmjheino
 */
@Entity
public class Substance implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(nullable = false)
    private int id;
    @Column(nullable = false)
    private String name;
    @Column(nullable = false)
    private int type;
    private int alertLimit1;
    private int alertLimit2;
    private boolean ordered;
    private boolean needsColdStorage;
    private String manufacturer;
    private String supplier;
    private int totalAmount;
    private Timestamp oldestDate;
    private String signature;
    private String[] statusMessages = new String[3];

    public String[] getStatusMessages() {
        return statusMessages;
    }

    public void setStatusMessages(String[] statusMessages) {
        this.statusMessages = statusMessages;
    }
    
    public String getSignature() {
        return signature;
    }

    public void setSignature(String signature) {
        this.signature = signature;
    }

    public Substance() {
        totalAmount = 0;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }
    
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

    public int getId() {
        return id;
    }
    
    public void setId(int id) {
        this.id = id;
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

    public boolean getNeedsColdStorage() {
        return needsColdStorage;
    }

    public void setNeedsColdStorage(boolean needsColdStorage) {
        this.needsColdStorage = needsColdStorage;
    }

    
    public String toStringDB() {
        return "Substance{" + "id=" + id + ", name=" + name + ", type=" + type + ", alertLimit1=" + alertLimit1 + ", alertLimit2=" + alertLimit2 + ", ordered=" + ordered + ", needsColdStorage=" + needsColdStorage + ", manufacturer=" + manufacturer + ", supplier=" + supplier + ", totalAmount=" + totalAmount + ", oldestDate=" + oldestDate + '}';
    }
    
    public String toStringShow() {
        return "NIMI= " + name + ", TYYPPI= " + type + ", HÄLYRAJA1= " + alertLimit1 + ", HÄLYRAJA2= " + alertLimit2 + ", KYLMÄSÄILYTYS= " + needsColdStorage + ", VALMISTAJA= " + manufacturer + ", TOIMITTAJA= " + supplier;
    }

    public void useOne(){
        totalAmount--;
    }
}
