package ohtu.radioaine.domain;

import java.io.Serializable;
import java.sql.Timestamp;
import javax.persistence.*;

/**
 * Entity for a batch of products. Used to create table BATCH to database.
 *
 * @author radioaine
 */
@Entity
public class Batch implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(nullable = false)
    private Long id;
    @Column(nullable = false)
    private String batchNumber;
    private int amount;
    private int substanceVolume;
    //Products of this batch are made of this substance
    @ManyToOne
    private Substance substance;
    @ManyToOne
    private Eluate eluate;
    private Timestamp arrivalDate;
    private Timestamp expDate;
    private int qualityCheck;
    private String signature;
    private String qualityCheckSignature;
    private double strength;
    private String manufacturer;
    private String supplier;
    private String note;
    private int storageLocationsCount = 100;
    private Long[][] storageLocations = new Long[storageLocationsCount][2];
    private int status;

//    @ManyToOne
//    private List<Storage> storages;
//
//    public List<Storage> getStorages() {
//        return storages;
//    }
//
//    public void setStorages(List<Storage> storages) {
//        this.storages = storages;
//    }
    public String getQualityCheckSignature() {
        return qualityCheckSignature;
    }

    public void setQualityCheckSignature(String qualityCheckSignature) {
        this.qualityCheckSignature = qualityCheckSignature;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Eluate getEluate() {
        return eluate;
    }

    public void setEluate(Eluate eluate) {
        this.eluate = eluate;
    }

    public String getSignature() {
        return signature;
    }

    public void setSignature(String signature) {
        this.signature = signature;
    }

    public Long[][] getStorageLocations() {
        return storageLocations;
    }

    public void setStorageLocations(Long[][] storageLocations) {
        this.storageLocations = storageLocations;
    }

    public int getStorageLocationsCount() {
        return storageLocationsCount;
    }

    public void setStorageLocationsCount(int storageLocationsCount) {
        this.storageLocationsCount = storageLocationsCount;
    }

    public int getSubstanceVolume() {
        return substanceVolume;
    }

    public void setSubstanceVolume(int substanceVolume) {
        this.substanceVolume = substanceVolume;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public Timestamp getArrivalDate() {
        return arrivalDate;
    }

    public void setArrivalDate(Timestamp arrivalDate) {
        this.arrivalDate = arrivalDate;
    }

    public Timestamp getExpDate() {
        return expDate;
    }

    public void setExpDate(Timestamp expDate) {
        this.expDate = expDate;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getBatchNumber() {
        return batchNumber;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setBatchNumber(String batchNumber) {
        this.batchNumber = batchNumber;
    }

    public String getManufacturer() {
        return manufacturer;
    }

    public void setManufacturer(String manufacturer) {
        this.manufacturer = manufacturer;
    }

    public int getQualityCheck() {
        return qualityCheck;
    }

    public void setQualityCheck(int qualityCheck) {
        this.qualityCheck = qualityCheck;
    }

    public double getStrength() {
        return strength;
    }

    public void setStrength(double strength) {
        this.strength = strength;
    }

    @Override
    public String toString() {
        return "Batch{" + "id=" + id + ", batchNumber=" + batchNumber + ", amount=" + amount + ", volume=" + substanceVolume + ", substance=" + substance.getName() + ", eluate=" + eluate + ", arrivalDate=" + arrivalDate + ", expDate=" + expDate + ", qualityCheck=" + qualityCheck + ", signature=" + signature + ", strength=" + strength + ", manufacturer=" + manufacturer + ", supplier=" + supplier + ", note=" + note + ", status=" + status + '}';
    }

    public Substance getSubstance() {
        return substance;
    }

    public void setSubstance(Substance substance) {
        this.substance = substance;
    }

    public String getSupplier() {
        return supplier;
    }

    public void setSupplier(String supplier) {
        this.supplier = supplier;
    }

    public int getCurrentStorageLocationsCount() {
        int temp = 0;
        for (int i = 0; i < storageLocations.length; i++) {
            if (/*
                     * storageLocations[i][1] > 0 ||
                     */storageLocations[i][1] != null) {
                temp++;
            }
        }
        return temp;
    }

    public void useOne() {
        amount--;
    }
}
