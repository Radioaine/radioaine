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
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(nullable = false)
    private Long id;
    @Column(nullable = false)
    private String name;
    private String genericName;
    private String eluateName;
    @Column(nullable = false)
    private int type;
    private double halflife;
    private int warningBeforeDays;
    private int warningBeforeAmount;
    private String volume;
    private String strength;
    private boolean ordered;
    private boolean needsColdStorage;
    private String manufacturer;
    private String supplier;
    private int totalAmount;
    private Timestamp oldestDate;
    private Timestamp warningDate;
    private String signature;
    private String[] statusMessages = new String[3];
    private int qualityStatus;
    private int qualityControl;
    private boolean inUse;
    private int countForReport = 0;

    public Timestamp getWarningDate() {
        return warningDate;
    }

    public void setWarningDate(Timestamp warningDate) {
        this.warningDate = warningDate;
    }

    public int getQualityStatus() {
        return qualityStatus;
    }

    public void setQualityStatus(int qualityStatus) {
        this.qualityStatus = qualityStatus;
    }

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

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public int getWarningBeforeAmount() {
        return warningBeforeAmount;
    }

    public void setWarningBeforeAmount(int warningBeforeAmount) {
        this.warningBeforeAmount = warningBeforeAmount;
    }

    public int getWarningBeforeDays() {
        return warningBeforeDays;
    }

    public void setWarningBeforeDays(int warningBeforeDays) {
        this.warningBeforeDays = warningBeforeDays;
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

    public void useOne() {
        totalAmount--;
    }

    public double getHalflife() {
        return halflife;
    }

    public void setHalflife(double halflife) {
        this.halflife = halflife;
    }

    public String getEluateName() {
        return eluateName;
    }

    public void setEluateName(String eluateName) {
        this.eluateName = eluateName;
    }

    public String getGenericName() {
        return genericName;
    }

    public void setGenericName(String genericName) {
        this.genericName = genericName;
    }

    public String getVolume() {
        return volume;
    }

    public void setVolume(String volume) {
        this.volume = volume;
    }

    public String getStrength() {
        return strength;
    }

    public void setStrength(String strength) {
        this.strength = strength;
    }

    public int getQualityControl() {
        return qualityControl;
    }

    public void setQualityControl(int qualityControl) {
        this.qualityControl = qualityControl;
    }

    public boolean isInUse() {
        return inUse;
    }

    public void setInUse(boolean inUse) {
        this.inUse = inUse;
    }

    public void incCountForReport() {
        countForReport++;
    }

    public void resetCountForReport() {
        countForReport = 0;
    }

    public int getCountForReport() {
        return countForReport;
    }
}
